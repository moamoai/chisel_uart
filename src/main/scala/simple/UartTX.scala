/*
 * 
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package simple

import chisel3._
import chisel3.util._
import chisel3.util.Enum

class UartTX(TIME_BAUD: UInt=1085.U(16.W)) extends Module {
  val io = IO(new Bundle {
    val transmit = Input (UInt(1.W))
    val txdata   = Input (UInt(8.W))
    val TD       = Output(UInt(1.W))
  })

  var txdata   = io.txdata
  var transmit = io.transmit
  val r_txdata = RegInit(0.U(8.W))
  val r_TD     = RegInit(1.U(1.W))

  val txIdle :: txStart :: txTransmitting :: txPGEN :: txStop :: Nil = Enum(5)
  val tx_state = RegInit(txIdle)

  val tx_cnt    = Wire(UInt(16.W))
  val i_tx_cnt  = Module(new Counter(16))
  val incr_txd_cnt = Wire(UInt(1.W))
  tx_cnt          := i_tx_cnt.io.out
  i_tx_cnt.io.rst := incr_txd_cnt | (tx_state === txIdle)
  i_tx_cnt.io.en  := (tx_state != txIdle)

  val txd_cnt      = Wire(UInt(8.W))
  val i_txd_cnt    = Module(new Counter(8))
  val clr_txd_cnt  = Wire(UInt(1.W))
  clr_txd_cnt      := 0.U
  // incr_txd_cnt     := (tx_state===txTransmitting) && (tx_cnt === TIME_BAUD)
  incr_txd_cnt     := (tx_cnt === TIME_BAUD)
  i_txd_cnt.io.rst := clr_txd_cnt
  i_txd_cnt.io.en  := incr_txd_cnt
  txd_cnt          := i_txd_cnt.io.out

  // Tx State machine
  switch(tx_state){
    is (txIdle){
      r_TD := 1.U
      when(transmit===1.U){
        r_txdata := txdata
        tx_state := txStart
      }
    }
    is (txStart){
      r_TD := 0.U
      when(tx_cnt === TIME_BAUD){
        tx_state := txTransmitting
      }
    }
    is (txTransmitting){
      r_TD := r_txdata(0)
      when(incr_txd_cnt===1.U){
        r_txdata := r_txdata(7,1)
      }
      when((txd_cnt === 8.U)&&(incr_txd_cnt===1.U)){ // Last data
        tx_state := txPGEN
        clr_txd_cnt := 1.U
      }
    }
    is (txPGEN){
      r_TD := 0.U // tmp. need to be parity
      when(tx_cnt === TIME_BAUD){
        tx_state := txStop
        clr_txd_cnt := 1.U
      }
    }
    is (txStop){
      r_TD := 1.U
      when((txd_cnt === 1.U)&&(incr_txd_cnt===1.U)){ // Last data
        tx_state := txIdle
        clr_txd_cnt := 1.U
      }
    }
  }

  io.TD     := r_TD
}
