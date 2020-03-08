/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package uart

import chisel3._
import chisel3.util._
import chisel3.util.Enum

class UartTop(TIME_BAUD:UInt = 1085.U(16.W)) extends Module {
  val io = IO(new Bundle {
    val TD     = Output(UInt(1.W))
    val RD     = Input(UInt(1.W))
    val GPIO   = Output(UInt(8.W))
//    val FREQ   = Input(UInt(16.W))
    val SW_IN  = Input(UInt(4.W))
//    val SW_OUT = Output(UInt(1.W))
  })
//  var TIME_BAUD = 1085.U(16.W) // 115200 bps
  // var TIME_BAUD = 13020.U(16.W) // 9600 bps

  val i_uart  = Module(new Uart(TIME_BAUD))
  i_uart.io.RD := io.RD
  io.TD        := i_uart.io.TD

  i_uart.io.MONITOR(0) := io.SW_IN
  i_uart.io.MONITOR(1) := i_uart.io.GPIO(1)
  i_uart.io.MONITOR(2) := i_uart.io.GPIO(2)
  i_uart.io.MONITOR(3) := i_uart.io.GPIO(3)
  io.GPIO := Cat(i_uart.io.GPIO(0)(7,1), i_uart.io.idle)

 val i_mem  = Module(new Memory)
  i_uart.io.rdata := i_mem.io.rdata
  i_mem.io.we     := i_uart.io.we
  i_mem.io.addr   := i_uart.io.addr
  i_mem.io.wdata  := i_uart.io.wdata

}