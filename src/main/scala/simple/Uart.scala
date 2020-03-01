/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package simple

import chisel3._
import chisel3.util._
import chisel3.util.Enum

class Uart(size: Int=2) extends Module {
  val io = IO(new Bundle {
    val TD     = Output(UInt(1.W))
    val RD     = Input(UInt(1.W))
    val GPIO   = Output(UInt(8.W))
    val FREQ   = Input(UInt(16.W))
    val SW_IN  = Input(UInt(4.W))
    val SW_OUT = Output(UInt(4.W))
  })
  var RD = io.RD
  var TIME_BAUD     = 10416.U(16.W)
  var TIME_START    = (TIME_BAUD + (TIME_BAUD>>1))
  var TIME_UART_MAX = 10.U
  val eIdle :: eStart :: eReceiving :: Nil = Enum(3)
  val state = RegInit(eIdle)

  val incr_uart_cnt = Wire(UInt(1.W))
  val clr_uart_cnt  = Wire(UInt(1.W))
  clr_uart_cnt := 0.U

  // Counters
  val counter_out = Wire(UInt(16.W))
  val i_counter     = Module(new Counter(16))
  incr_uart_cnt := ((state===eStart    ) && (counter_out === TIME_START)) |
                   ((state===eReceiving) && (counter_out === TIME_BAUD ))
  counter_out := i_counter.io.out
  i_counter.io.rst := incr_uart_cnt | (state === eIdle)
  i_counter.io.en  := (state != eIdle)

  val i_uart_cnt   = Module(new Counter(8))
  val uart_cnt_out = Wire(UInt(16.W))
  i_uart_cnt.io.rst := clr_uart_cnt
  i_uart_cnt.io.en  := incr_uart_cnt
  uart_cnt_out      := i_uart_cnt.io.out


  // State Machine
  switch(state){
    is (eIdle){
      when(RD===0.U){
        state := eStart
      }
    }
    is (eStart){
      when(counter_out === TIME_START){ // TIME_BAUD * 1.5
        state := eReceiving
      }
    }
    is (eReceiving){
      when(uart_cnt_out === TIME_UART_MAX){ // TIME_BAUD * 1.5
        state := eIdle
        clr_uart_cnt := 1.U
      }
    }
  }


  val r_recdata = RegInit(0.U(8.W))
  val r_GPIO    = RegInit(0.U(8.W))
  when(incr_uart_cnt===1.U){
    r_recdata := Cat(RD, r_recdata(7,1)) // UART: LSB -> MSB
  }.elsewhen(clr_uart_cnt===1.U){
    r_recdata := 0.U
  }

  when((incr_uart_cnt===1.U) && (uart_cnt_out === 0x8.U)){
    r_GPIO    := r_recdata
  }
  io.TD     := 1.U
  io.GPIO   := r_GPIO
  io.SW_OUT := 0.U
}

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

object UartMain extends App {
  println("Generating the Uart hardware")
  chisel3.Driver.execute(Array("--target-dir", "generated"), () => new Uart())
}
