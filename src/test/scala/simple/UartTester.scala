/*
 * A simple counter example with configurable bit width and with a test bench.
 * 
 */

package simple

import chisel3._
import chisel3.iotesters.PeekPokeTester

/**
 * Test the counter by printing out the value at each clock cycle.
 */
class UartTester(dut: Uart) extends PeekPokeTester(dut) {
  val TIME_BAUD = 125*1000*1000/9600
  def send_uart(TDATA:Int=0x00){
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
    poke(dut.io.RD, 0.U) // Parity bit
    step(TIME_BAUD)
    poke(dut.io.RD, 1.U) // Stop bit
    step(TIME_BAUD)
    poke(dut.io.RD, 1.U) // Stop bit
    step(TIME_BAUD)
  }
  var TEST_DATA = 0x89
  send_uart(TEST_DATA)
  if(peek(dut.io.GPIO)!=TEST_DATA){
    println("#[NG] Error TEST_DATA:" + TEST_DATA.toString)
  }
  TEST_DATA = 0x5A
  send_uart(TEST_DATA)
  if(peek(dut.io.GPIO)!=TEST_DATA){
    println("#[NG] Error TEST_DATA:" + TEST_DATA.toString)
  }

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
                                          () => new Uart(2)) {
    c => new UartTester(c)
  }
}