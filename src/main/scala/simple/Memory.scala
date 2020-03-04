/*
 *
 * An ALU is a minimal start for a processor.
 *
 */

package simple

import chisel3._
import chisel3.util._
// import chisel3.util.experimental.loadMemoryFromFile
// import chisel3.util.experimental.MemoryLoadFileType

/**
 * This is a very basic ALU example.
 */
class Memory extends Module {
  val io = IO(new Bundle {
    val we    = Input (UInt(1.W))
    val wdata = Input (UInt(8.W))
    val addr  = Input (UInt(8.W))
    val rdata = Output(UInt(8.W))
  })

  // Use shorter variable names
  val we    = io.we
  val wdata = io.wdata
  val addr  = io.addr

  val rdata = Wire(UInt(8.W))
  // some default value is needed
  rdata := 0.U

  val my_mem = Mem((1<<8), UInt(8.W))

  //loadMemoryFromFile(my_mem, "mem1.txt")
  // The ALU selection
  when(we === 1.U) {
    my_mem(addr) := wdata
  }
  rdata := my_mem(addr)

  // Output on the LEDs
  io.rdata := rdata
}