/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package uart

import chisel3._
import chisel3.util._
import chisel3.util.Enum

class Uart_LB(size: Int=2) extends Module {
  val io = IO(new Bundle {
    val TD     = Output(UInt(1.W))
    val RD     = Input(UInt(1.W))
    val GPIO   = Output(UInt(8.W))
//    val FREQ   = Input(UInt(16.W))
    val SW_IN  = Input(UInt(1.W))
    val SW_OUT = Output(UInt(1.W))
  })
  var TIME_BAUD = 1085.U(16.W) // 115200 bps
  // var TIME_BAUD = 13020.U(16.W) // 9600 bps

  val i_uart_rx  = Module(new UartRX(TIME_BAUD))
  val recdata    = Wire(UInt(8.W))
  val received   = Wire(UInt(1.W))
  i_uart_rx.io.RD := io.RD
  recdata         := i_uart_rx.io.recdata
  received        := i_uart_rx.io.received

  val r_txdata  = RegInit(0.U(8.W))
  val r_TD      = RegInit(1.U(1.W))
  val r_GPIO    = RegInit(0.U(8.W))
  when(received===1.U){
    r_GPIO   := recdata
  }

  val i_uart_tx  = Module(new UartTX(TIME_BAUD))
  i_uart_tx.io.transmit := received
  i_uart_tx.io.txdata   := recdata

  io.TD     := i_uart_tx.io.TD
  io.GPIO   := r_GPIO
  io.SW_OUT := io.SW_IN
}

object Uart_LBMain extends App {
  println("Generating the Uart_LB hardware")
  chisel3.Driver.execute(Array("--target-dir", "generated"), () => new Uart_LB())
}
