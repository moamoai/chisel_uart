#
# Building Chisel examples without too much sbt/scala/... stuff
#
# sbt looks for default into a folder ./project and . for build.sdt and Build.scala
# sbt creates per default a ./target folder

SBT = sbt -mem 4096

# Generate Verilog code

uart:
	$(SBT) "runMain simple.UartMain"

uart_lb:
	$(SBT) "runMain simple.Uart_LBMain"


uartlb-test:
	$(SBT) "test:runMain simple.Uart_LBTester --backend-name verilator"
uart-test:
	$(SBT) "test:runMain simple.UartTester --backend-name verilator"

GTKWAVE = /Applications/gtkwave.app/Contents/Resources/bin/gtkwave
view:
	$(GTKWAVE) ./test_run_dir/Uart.gtkw

# clean everything (including IntelliJ project settings)

clean:
	git clean -fd
