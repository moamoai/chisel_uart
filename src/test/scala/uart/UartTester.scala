/*
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package uart

import chisel3._
import chisel3.iotesters.PeekPokeTester

/**
 * Test the counter by printing out the value at each clock cycle.
 */


object OBJ_TEST {
  val TIME_BAUD  = 16
}

// abstract class absUartTester[+T <: chisel3.MultiIOModule](dut:T) extends PeekPokeTester(dut){
// }

class UartTester(dut: Uart) extends PeekPokeTester(dut) {
  // val TIME_BAUD = 125*1000*1000/9600
  // val TIME_BAUD = 125*1000*1000/115200
  val TIME_BAUD = OBJ_TEST.TIME_BAUD
  def send_uart(TDATA:Int=0x00, SKIP:Int=0x00){
    poke(dut.io.RD, 1.U)
    step(TIME_BAUD)
    poke(dut.io.RD, 1.U)
    step(TIME_BAUD)
    poke(dut.io.RD, 0.U) // Start bit
    step(TIME_BAUD)
    for (i <- 0 until 8) {
      var td = (TDATA>>i) & 0x01
      poke(dut.io.RD, td) // Data bit
      step(TIME_BAUD)
    }
    poke(dut.io.RD, 1.U) //

    if(SKIP!=1){
      poke(dut.io.RD, 0.U) // Parity bit
      step(TIME_BAUD)
      poke(dut.io.RD, 1.U) // Stop bit
      step(TIME_BAUD)
      poke(dut.io.RD, 1.U) // Stop bit
      step(TIME_BAUD)
    }
  }

  def receive_data() : BigInt = {
    var rdata = BigInt(0)
    var td    = peek(dut.io.TD)
    while(td == 1){   // Start wait
      step(1)
      td = peek(dut.io.TD)
    }
    step(TIME_BAUD) // Stop
    step(TIME_BAUD/2) // D0 1/2
    for (i <- 0 until 8) {
      rdata = rdata + (peek(dut.io.TD)<<i)
      step(TIME_BAUD)
    }
    step(TIME_BAUD) // Parity
    step(TIME_BAUD) // STOP
    step(TIME_BAUD) // STOP
    println(f"# Received Data[$rdata%02x]")
    return rdata
  }

  // Loop back test
  var L_CHAR    = 0x6C // l(0x6C)
  var TEST_DATA = 0x5A
  send_uart(L_CHAR)
  send_uart(TEST_DATA)
  send_uart(0x0, 1)
  var rdata = receive_data()
  if(rdata !=TEST_DATA){
    println("#[NG] Error TEST_DATA:" + TEST_DATA.toString)
  }
  // Switch Test
  var S_CHAR    = 0x73
  var SW_IN = 5
  poke(dut.io.SW_IN, SW_IN.U)
  send_uart(S_CHAR)
  send_uart(0x0)
  send_uart(0x0, 1)
  rdata = receive_data()
  if(rdata !=SW_IN){
    println("#[NG] Error rdata=" + rdata.toString)
  }

  // Memory Write/Read
  var W_CHAR    = 0x77
  var M_CHAR    = 0x6D
  var ADDR  = 0x04
  var WDATA = 0x5A
  send_uart(W_CHAR)
  send_uart(ADDR) 
  send_uart(WDATA)
  send_uart(M_CHAR)
  send_uart(ADDR)
  send_uart(0x0, 1)
  rdata = receive_data()
  if(rdata !=WDATA){
    println("#[NG] Error rdata=" + rdata.toString)
  }

  // GPIO
  var o_CHAR    = 0x6F
  for (i <- 0 until 4) {
    send_uart(o_CHAR)
    send_uart(i) 
    send_uart(0xA0 + i)
  }

  for (i <- 1 until 4) {
    send_uart(S_CHAR)
    send_uart(i) 
    send_uart(0x00, 1)
    rdata = receive_data()
    if(rdata != (0xA0 + i)){
      println("#[NG] Error GPIO rdata=" + rdata.toString)
    }
  }

//  TEST_DATA = 0x5A
//  send_uart(TEST_DATA)
//  receive_data()
//  if(peek(dut.io.GPIO)!=TEST_DATA){
//    println("#[NG] Error TEST_DATA:" + TEST_DATA.toString)
//  }

//  for (i <- 0 until 5) {
//    println(i.toString + ": " + peek(c.io.out).toString())
//    step(1)
//  }
}

/**
 * Create a counter and a tester.
 */
// object CounterTester extends App {
// 
//   iotesters.Driver.execute(Array[String](), () => new Counter(2)) {
//     c => new CounterTester(c)
//   }
// }

object UartTester extends App {
  // Disable this until we fix isCommandAvailable to swallow stderr along with stdout
  private val backendNames = if(firrtl.FileUtils.isCommandAvailable(Seq("verilator", "--version"))) {
    Array("firrtl", "verilator")
  }
//  val param = Array("--target-dir", "generated", "--generate-vcd-output", "on")
//                    "--wave-form-file-name", "test_run_dir/Uart.vcd")

  iotesters.Driver.execute(Array[String]("--generate-vcd-output", "on",
                        "--fint-write-vcd", "--wave-form-file-name", "test_run_dir/Uart.vcd"),
                                          () => new Uart(OBJ_TEST.TIME_BAUD.U)) {
    c => new UartTester(c)
  }
}