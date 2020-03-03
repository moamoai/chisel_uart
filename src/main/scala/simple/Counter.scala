/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package simple

import chisel3._
import chisel3.util._

class Counter(size: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input (UInt(1.W))
    val rst = Input (UInt(1.W))
    val out = Output(UInt(size.W))
  })

  val r_cnt = RegInit(0.U(size.W))
  when(io.rst===1.U){
    r_cnt := 0.U
  }.elsewhen(io.en===1.U){
    r_cnt := r_cnt + 1.U
  }.otherwise{
    r_cnt := r_cnt
  }
  io.out := r_cnt
}