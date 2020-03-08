/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package uart

import chisel3._
import chisel3.util._
import chisel3.util.Enum

class Uart(TIME_BAUD:UInt = 1085.U(16.W), DATA_W:Int=8, ADDR_W:Int=8) extends Module {
  val io = IO(new Bundle {
    val TD     = Output(UInt(1.W))
    val RD     = Input(UInt(1.W))
//    val GPIO   = Output(UInt(8.W))
//    val SW_IN  = Input(UInt(4.W))
    val MONITOR  = Input (Vec(4, UInt(8.W)))
    val GPIO     = Output(Vec(4, UInt(8.W)))
    val idle     = Output(UInt(1.W))

    // Memory IF
    val we    = Output(UInt(1.W))
    val addr  = Output(UInt(ADDR_W.W))
    val wdata = Output(UInt(DATA_W.W))
    val rdata = Input (UInt(DATA_W.W))
  })
//  var TIME_BAUD = 1085.U(16.W) // 115200 bps
  // var TIME_BAUD = 13020.U(16.W) // 9600 bps

  val i_uart_rx  = Module(new UartRX(TIME_BAUD))
  val recdata    = Wire(UInt(8.W))
  val received   = Wire(UInt(1.W))
  i_uart_rx.io.RD := io.RD
  recdata         := i_uart_rx.io.recdata
  received        := i_uart_rx.io.received

  val i_term  = Module(new Terminal)
  i_term.io.in_en   := received
  i_term.io.in_data := recdata
  i_term.io.MONITOR := io.MONITOR

  io.we           := i_term.io.we
  io.addr         := i_term.io.addr
  io.wdata        := i_term.io.wdata
  i_term.io.rdata := io.rdata

  val i_uart_tx  = Module(new UartTX(TIME_BAUD))
  i_uart_tx.io.transmit := i_term.io.transmit
  i_uart_tx.io.txdata   := i_term.io.txdata

  io.TD   := i_uart_tx.io.TD
  io.GPIO := i_term.io.GPIO
  io.idle := i_term.io.idle
}

object UartMain extends App {
  println("Generating the Uart hardware")
  chisel3.Driver.execute(Array("--target-dir", "generated"), () => new Uart())
}
