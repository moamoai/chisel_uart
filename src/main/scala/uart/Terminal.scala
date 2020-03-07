/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package uart

import chisel3._
import chisel3.util._
import chisel3.util.Enum

class Terminal() extends Module {
  val io = IO(new Bundle {
    val in_en    = Input (UInt(1.W))
    val in_data  = Input (UInt(8.W))
    val SW_IN    = Input (UInt(4.W))
    val GPIO     = Output(UInt(8.W))
    val transmit = Output(UInt(1.W))
    val txdata   = Output(UInt(8.W))
  })

  val r_arg0    = RegInit(0.U(8.W))
  val r_arg1    = RegInit(0.U(8.W))
  val r_cmd     = RegInit(0.U(8.W))
  when(io.in_en===1.U){
    r_arg1   := io.in_data
    r_arg0   := r_arg1
    r_cmd    := r_arg0
  }

  // Counter Controll
  val i_cnt  = Module(new Counter(2))
  val received_cmd = Wire(UInt(1.W))
  i_cnt.io.en  := io.in_en
  i_cnt.io.rst := received_cmd
  received_cmd := (i_cnt.io.out === 3.U)

  // cmd decorder
  val s_cmd = Wire(UInt(1.W))
  val m_cmd = Wire(UInt(1.W))
  val w_cmd = Wire(UInt(1.W))
  val l_cmd = Wire(UInt(1.W))
  val o_cmd = Wire(UInt(1.W))
  s_cmd := (received_cmd & (r_cmd===0x73.U))
  m_cmd := (received_cmd & (r_cmd===0x6D.U))
  w_cmd := (received_cmd & (r_cmd===0x77.U))
  l_cmd := (received_cmd & (r_cmd===0x6C.U))
  o_cmd := (received_cmd & (r_cmd===0x6F.U))

  val r_m_cmd = RegInit(0.U(1.W))
  val rdata   = Wire(UInt(8.W))
  r_m_cmd := m_cmd

  // TX controll
  val txdata = Wire(UInt(8.W))
  txdata := 0.U
  when(l_cmd===1.U){
     txdata := r_arg0
  }.elsewhen(s_cmd===1.U){
     txdata := io.SW_IN
  }.elsewhen(r_m_cmd===1.U){
     txdata := rdata
  }

  // GPIO Controll
  val r_GPIO = RegInit(0.U(8.W))
  when(o_cmd===1.U){
    r_GPIO := r_arg0
  }
//  r_GPIO := rdata

  // Memory 
  val i_mem  = Module(new Memory)
  rdata          := i_mem.io.rdata
  i_mem.io.we    := w_cmd
  i_mem.io.addr  := r_arg0
  i_mem.io.wdata := r_arg1
  

  val idle = Wire(UInt(1.W))
  idle := (i_cnt.io.out===0.U)
  io.GPIO := Cat(r_GPIO(7,1), idle)
  io.transmit := s_cmd | l_cmd | r_m_cmd
  io.txdata   := txdata
}