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
class Uart_LBTester(dut: Uart_LB) extends PeekPokeTester(dut) {
  // val TIME_BAUD = 125*1000*1000/9600
  val TIME_BAUD = 125*1000*1000/115200
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
    poke(dut.io.RD, 1.U) //

    // poke(dut.io.RD, 0.U) // Parity bit
    // step(TIME_BAUD)
    // poke(dut.io.RD, 1.U) // Stop bit
    // step(TIME_BAUD)
    // poke(dut.io.RD, 1.U) // Stop bit
    // step(TIME_BAUD)
  }

  def receive_data(){
    var rdata = BigInt(0)
    var td    = peek(dut.io.TD)
    while(td == 1){   // Start wait
      step(10) // tmp
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
  }
  var TEST_DATA = 0x89
  send_uart(TEST_DATA)
  receive_data()

  if(peek(dut.io.GPIO)!=TEST_DATA){
    println("#[NG] Error TEST_DATA:" + TEST_DATA.toString)
  }

  TEST_DATA = 0x5A
  send_uart(TEST_DATA)
  receive_data()
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

object Uart_LBTester extends App {
  // Disable this until we fix isCommandAvailable to swallow stderr along with stdout
  private val backendNames = if(firrtl.FileUtils.isCommandAvailable(Seq("verilator", "--version"))) {
    Array("firrtl", "verilator")
  }
//  val param = Array("--target-dir", "generated", "--generate-vcd-output", "on")
//                    "--wave-form-file-name", "test_run_dir/Uart_LB.vcd")

  iotesters.Driver.execute(Array[String]("--generate-vcd-output", "on",
                        "--fint-write-vcd", "--wave-form-file-name", "test_run_dir/Uart_LB.vcd"),
                                          () => new Uart_LB(2)) {
    c => new Uart_LBTester(c)
  }
}