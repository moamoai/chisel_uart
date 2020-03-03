module Counter(
  input         clock,
  input         reset,
  input         io_en,
  input         io_rst,
  output [15:0] io_out
);
  reg [15:0] r_cnt; // @[Counter.scala 19:22]
  reg [31:0] _RAND_0;
  wire [15:0] _T_3; // @[Counter.scala 23:20]
  assign _T_3 = r_cnt + 16'h1; // @[Counter.scala 23:20]
  assign io_out = r_cnt; // @[Counter.scala 27:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_cnt = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_cnt <= 16'h0;
    end else if (io_rst) begin
      r_cnt <= 16'h0;
    end else if (io_en) begin
      r_cnt <= _T_3;
    end
  end
endmodule
module Counter_1(
  input        clock,
  input        reset,
  input        io_en,
  input        io_rst,
  output [7:0] io_out
);
  reg [7:0] r_cnt; // @[Counter.scala 19:22]
  reg [31:0] _RAND_0;
  wire [7:0] _T_3; // @[Counter.scala 23:20]
  assign _T_3 = r_cnt + 8'h1; // @[Counter.scala 23:20]
  assign io_out = r_cnt; // @[Counter.scala 27:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_cnt = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_cnt <= 8'h0;
    end else if (io_rst) begin
      r_cnt <= 8'h0;
    end else if (io_en) begin
      r_cnt <= _T_3;
    end
  end
endmodule
module UartRX(
  input        clock,
  input        reset,
  input        io_RD,
  output [7:0] io_recdata,
  output       io_received
);
  wire  i_counter_clock; // @[UartRX.scala 33:29]
  wire  i_counter_reset; // @[UartRX.scala 33:29]
  wire  i_counter_io_en; // @[UartRX.scala 33:29]
  wire  i_counter_io_rst; // @[UartRX.scala 33:29]
  wire [15:0] i_counter_io_out; // @[UartRX.scala 33:29]
  wire  i_uart_cnt_clock; // @[UartRX.scala 40:28]
  wire  i_uart_cnt_reset; // @[UartRX.scala 40:28]
  wire  i_uart_cnt_io_en; // @[UartRX.scala 40:28]
  wire  i_uart_cnt_io_rst; // @[UartRX.scala 40:28]
  wire [7:0] i_uart_cnt_io_out; // @[UartRX.scala 40:28]
  reg [1:0] state; // @[UartRX.scala 25:22]
  reg [31:0] _RAND_0;
  wire  _T_2; // @[UartRX.scala 34:27]
  wire [15:0] counter_out; // @[UartRX.scala 32:25 UartRX.scala 36:15]
  wire  _T_3; // @[UartRX.scala 34:58]
  wire  _T_4; // @[UartRX.scala 34:42]
  wire  _T_5; // @[UartRX.scala 35:27]
  wire  _T_6; // @[UartRX.scala 35:58]
  wire  _T_7; // @[UartRX.scala 35:42]
  wire  incr_uart_cnt; // @[UartRX.scala 34:75]
  wire  _T_9; // @[UartRX.scala 37:46]
  wire  _T_12; // @[Conditional.scala 37:30]
  wire  _T_13; // @[UartRX.scala 49:14]
  wire  _T_14; // @[Conditional.scala 37:30]
  wire  _T_16; // @[Conditional.scala 37:30]
  wire [15:0] uart_cnt_out; // @[UartRX.scala 41:26 UartRX.scala 44:21]
  wire  _T_17; // @[UartRX.scala 59:25]
  wire  _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_7; // @[Conditional.scala 39:67]
  wire  clr_uart_cnt; // @[Conditional.scala 40:58]
  reg [7:0] r_recdata; // @[UartRX.scala 66:26]
  reg [31:0] _RAND_1;
  wire [6:0] _T_19; // @[UartRX.scala 68:35]
  wire [7:0] _T_20; // @[Cat.scala 29:58]
  wire  _T_23; // @[UartRX.scala 74:54]
  Counter i_counter ( // @[UartRX.scala 33:29]
    .clock(i_counter_clock),
    .reset(i_counter_reset),
    .io_en(i_counter_io_en),
    .io_rst(i_counter_io_rst),
    .io_out(i_counter_io_out)
  );
  Counter_1 i_uart_cnt ( // @[UartRX.scala 40:28]
    .clock(i_uart_cnt_clock),
    .reset(i_uart_cnt_reset),
    .io_en(i_uart_cnt_io_en),
    .io_rst(i_uart_cnt_io_rst),
    .io_out(i_uart_cnt_io_out)
  );
  assign _T_2 = state == 2'h1; // @[UartRX.scala 34:27]
  assign counter_out = i_counter_io_out; // @[UartRX.scala 32:25 UartRX.scala 36:15]
  assign _T_3 = counter_out == 16'h65b; // @[UartRX.scala 34:58]
  assign _T_4 = _T_2 & _T_3; // @[UartRX.scala 34:42]
  assign _T_5 = state == 2'h2; // @[UartRX.scala 35:27]
  assign _T_6 = counter_out == 16'h43d; // @[UartRX.scala 35:58]
  assign _T_7 = _T_5 & _T_6; // @[UartRX.scala 35:42]
  assign incr_uart_cnt = _T_4 | _T_7; // @[UartRX.scala 34:75]
  assign _T_9 = state == 2'h0; // @[UartRX.scala 37:46]
  assign _T_12 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_13 = io_RD == 1'h0; // @[UartRX.scala 49:14]
  assign _T_14 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_16 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign uart_cnt_out = {{8'd0}, i_uart_cnt_io_out}; // @[UartRX.scala 41:26 UartRX.scala 44:21]
  assign _T_17 = uart_cnt_out == 16'ha; // @[UartRX.scala 59:25]
  assign _GEN_5 = _T_16 & _T_17; // @[Conditional.scala 39:67]
  assign _GEN_7 = _T_14 ? 1'h0 : _GEN_5; // @[Conditional.scala 39:67]
  assign clr_uart_cnt = _T_12 ? 1'h0 : _GEN_7; // @[Conditional.scala 40:58]
  assign _T_19 = r_recdata[7:1]; // @[UartRX.scala 68:35]
  assign _T_20 = {io_RD,_T_19}; // @[Cat.scala 29:58]
  assign _T_23 = uart_cnt_out == 16'h8; // @[UartRX.scala 74:54]
  assign io_recdata = r_recdata; // @[UartRX.scala 76:15]
  assign io_received = incr_uart_cnt & _T_23; // @[UartRX.scala 77:15]
  assign i_counter_clock = clock;
  assign i_counter_reset = reset;
  assign i_counter_io_en = state != 2'h0; // @[UartRX.scala 38:20]
  assign i_counter_io_rst = incr_uart_cnt | _T_9; // @[UartRX.scala 37:20]
  assign i_uart_cnt_clock = clock;
  assign i_uart_cnt_reset = reset;
  assign i_uart_cnt_io_en = _T_4 | _T_7; // @[UartRX.scala 43:21]
  assign i_uart_cnt_io_rst = _T_12 ? 1'h0 : _GEN_7; // @[UartRX.scala 42:21]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r_recdata = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else if (_T_12) begin
      if (_T_13) begin
        state <= 2'h1;
      end
    end else if (_T_14) begin
      if (_T_3) begin
        state <= 2'h2;
      end
    end else if (_T_16) begin
      if (_T_17) begin
        state <= 2'h0;
      end
    end
    if (reset) begin
      r_recdata <= 8'h0;
    end else if (incr_uart_cnt) begin
      r_recdata <= _T_20;
    end else if (clr_uart_cnt) begin
      r_recdata <= 8'h0;
    end
  end
endmodule
module Counter_2(
  input        clock,
  input        reset,
  input        io_en,
  input        io_rst,
  output [1:0] io_out
);
  reg [1:0] r_cnt; // @[Counter.scala 19:22]
  reg [31:0] _RAND_0;
  wire [1:0] _T_3; // @[Counter.scala 23:20]
  assign _T_3 = r_cnt + 2'h1; // @[Counter.scala 23:20]
  assign io_out = r_cnt; // @[Counter.scala 27:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_cnt = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_cnt <= 2'h0;
    end else if (io_rst) begin
      r_cnt <= 2'h0;
    end else if (io_en) begin
      r_cnt <= _T_3;
    end
  end
endmodule
module UartTX(
  input        clock,
  input        reset,
  input        io_transmit,
  input  [7:0] io_txdata,
  output       io_TD
);
  wire  i_tx_cnt_clock; // @[UartTX.scala 29:25]
  wire  i_tx_cnt_reset; // @[UartTX.scala 29:25]
  wire  i_tx_cnt_io_en; // @[UartTX.scala 29:25]
  wire  i_tx_cnt_io_rst; // @[UartTX.scala 29:25]
  wire [15:0] i_tx_cnt_io_out; // @[UartTX.scala 29:25]
  wire  i_txd_cnt_clock; // @[UartTX.scala 36:28]
  wire  i_txd_cnt_reset; // @[UartTX.scala 36:28]
  wire  i_txd_cnt_io_en; // @[UartTX.scala 36:28]
  wire  i_txd_cnt_io_rst; // @[UartTX.scala 36:28]
  wire [7:0] i_txd_cnt_io_out; // @[UartTX.scala 36:28]
  reg [7:0] r_txdata; // @[UartTX.scala 22:25]
  reg [31:0] _RAND_0;
  reg  r_TD; // @[UartTX.scala 23:25]
  reg [31:0] _RAND_1;
  reg [2:0] tx_state; // @[UartTX.scala 26:25]
  reg [31:0] _RAND_2;
  wire  _T; // @[UartTX.scala 32:47]
  wire [15:0] tx_cnt; // @[UartTX.scala 28:23 UartTX.scala 31:19]
  wire  incr_txd_cnt; // @[UartTX.scala 40:31]
  wire  _T_4; // @[Conditional.scala 37:30]
  wire  _T_6; // @[Conditional.scala 37:30]
  wire  _T_8; // @[Conditional.scala 37:30]
  wire  _T_9; // @[UartTX.scala 61:23]
  wire [6:0] _T_11; // @[UartTX.scala 63:29]
  wire [7:0] txd_cnt; // @[UartTX.scala 35:26 UartTX.scala 43:20]
  wire  _T_12; // @[UartTX.scala 65:21]
  wire  _T_14; // @[UartTX.scala 65:29]
  wire  _T_15; // @[Conditional.scala 37:30]
  wire  _T_17; // @[Conditional.scala 37:30]
  wire  _T_18; // @[UartTX.scala 79:21]
  wire  _T_20; // @[UartTX.scala 79:29]
  wire  _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_24; // @[Conditional.scala 40:58]
  Counter i_tx_cnt ( // @[UartTX.scala 29:25]
    .clock(i_tx_cnt_clock),
    .reset(i_tx_cnt_reset),
    .io_en(i_tx_cnt_io_en),
    .io_rst(i_tx_cnt_io_rst),
    .io_out(i_tx_cnt_io_out)
  );
  Counter_1 i_txd_cnt ( // @[UartTX.scala 36:28]
    .clock(i_txd_cnt_clock),
    .reset(i_txd_cnt_reset),
    .io_en(i_txd_cnt_io_en),
    .io_rst(i_txd_cnt_io_rst),
    .io_out(i_txd_cnt_io_out)
  );
  assign _T = tx_state == 3'h0; // @[UartTX.scala 32:47]
  assign tx_cnt = i_tx_cnt_io_out; // @[UartTX.scala 28:23 UartTX.scala 31:19]
  assign incr_txd_cnt = tx_cnt == 16'h43d; // @[UartTX.scala 40:31]
  assign _T_4 = 3'h0 == tx_state; // @[Conditional.scala 37:30]
  assign _T_6 = 3'h1 == tx_state; // @[Conditional.scala 37:30]
  assign _T_8 = 3'h2 == tx_state; // @[Conditional.scala 37:30]
  assign _T_9 = r_txdata[0]; // @[UartTX.scala 61:23]
  assign _T_11 = r_txdata[7:1]; // @[UartTX.scala 63:29]
  assign txd_cnt = i_txd_cnt_io_out; // @[UartTX.scala 35:26 UartTX.scala 43:20]
  assign _T_12 = txd_cnt == 8'h8; // @[UartTX.scala 65:21]
  assign _T_14 = _T_12 & incr_txd_cnt; // @[UartTX.scala 65:29]
  assign _T_15 = 3'h3 == tx_state; // @[Conditional.scala 37:30]
  assign _T_17 = 3'h4 == tx_state; // @[Conditional.scala 37:30]
  assign _T_18 = txd_cnt == 8'h1; // @[UartTX.scala 79:21]
  assign _T_20 = _T_18 & incr_txd_cnt; // @[UartTX.scala 79:29]
  assign _GEN_10 = _T_17 | r_TD; // @[Conditional.scala 39:67]
  assign _GEN_12 = _T_17 & _T_20; // @[Conditional.scala 39:67]
  assign _GEN_13 = _T_15 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  assign _GEN_15 = _T_15 ? incr_txd_cnt : _GEN_12; // @[Conditional.scala 39:67]
  assign _GEN_16 = _T_8 ? _T_9 : _GEN_13; // @[Conditional.scala 39:67]
  assign _GEN_19 = _T_8 ? _T_14 : _GEN_15; // @[Conditional.scala 39:67]
  assign _GEN_20 = _T_6 ? 1'h0 : _GEN_16; // @[Conditional.scala 39:67]
  assign _GEN_23 = _T_6 ? 1'h0 : _GEN_19; // @[Conditional.scala 39:67]
  assign _GEN_24 = _T_4 | _GEN_20; // @[Conditional.scala 40:58]
  assign io_TD = r_TD; // @[UartTX.scala 86:13]
  assign i_tx_cnt_clock = clock;
  assign i_tx_cnt_reset = reset;
  assign i_tx_cnt_io_en = tx_state != 3'h0; // @[UartTX.scala 33:19]
  assign i_tx_cnt_io_rst = incr_txd_cnt | _T; // @[UartTX.scala 32:19]
  assign i_txd_cnt_clock = clock;
  assign i_txd_cnt_reset = reset;
  assign i_txd_cnt_io_en = tx_cnt == 16'h43d; // @[UartTX.scala 42:20]
  assign i_txd_cnt_io_rst = _T_4 ? 1'h0 : _GEN_23; // @[UartTX.scala 41:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_txdata = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r_TD = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  tx_state = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_txdata <= 8'h0;
    end else if (_T_4) begin
      if (io_transmit) begin
        r_txdata <= io_txdata;
      end
    end else if (!(_T_6)) begin
      if (_T_8) begin
        if (incr_txd_cnt) begin
          r_txdata <= {{1'd0}, _T_11};
        end
      end
    end
    r_TD <= reset | _GEN_24;
    if (reset) begin
      tx_state <= 3'h0;
    end else if (_T_4) begin
      if (io_transmit) begin
        tx_state <= 3'h1;
      end
    end else if (_T_6) begin
      if (incr_txd_cnt) begin
        tx_state <= 3'h2;
      end
    end else if (_T_8) begin
      if (_T_14) begin
        tx_state <= 3'h3;
      end
    end else if (_T_15) begin
      if (incr_txd_cnt) begin
        tx_state <= 3'h4;
      end
    end else if (_T_17) begin
      if (_T_20) begin
        tx_state <= 3'h0;
      end
    end
  end
endmodule
module Uart(
  input        clock,
  input        reset,
  output       io_TD,
  input        io_RD,
  output [7:0] io_GPIO,
  input        io_SW_IN,
  output       io_SW_OUT
);
  wire  i_uart_rx_clock; // @[Uart.scala 25:26]
  wire  i_uart_rx_reset; // @[Uart.scala 25:26]
  wire  i_uart_rx_io_RD; // @[Uart.scala 25:26]
  wire [7:0] i_uart_rx_io_recdata; // @[Uart.scala 25:26]
  wire  i_uart_rx_io_received; // @[Uart.scala 25:26]
  wire  i_cnt_clock; // @[Uart.scala 43:22]
  wire  i_cnt_reset; // @[Uart.scala 43:22]
  wire  i_cnt_io_en; // @[Uart.scala 43:22]
  wire  i_cnt_io_rst; // @[Uart.scala 43:22]
  wire [1:0] i_cnt_io_out; // @[Uart.scala 43:22]
  wire  i_uart_tx_clock; // @[Uart.scala 50:26]
  wire  i_uart_tx_reset; // @[Uart.scala 50:26]
  wire  i_uart_tx_io_transmit; // @[Uart.scala 50:26]
  wire [7:0] i_uart_tx_io_txdata; // @[Uart.scala 50:26]
  wire  i_uart_tx_io_TD; // @[Uart.scala 50:26]
  reg [7:0] r_arg0; // @[Uart.scala 34:26]
  reg [31:0] _RAND_0;
  reg [7:0] r_arg1; // @[Uart.scala 35:26]
  reg [31:0] _RAND_1;
  reg [7:0] r_cmd; // @[Uart.scala 36:26]
  reg [31:0] _RAND_2;
  wire  received; // @[Uart.scala 27:24 Uart.scala 30:19]
  wire [7:0] recdata; // @[Uart.scala 26:24 Uart.scala 29:19]
  wire  received_cmd; // @[Uart.scala 47:33]
  wire  _T_2; // @[Uart.scala 51:50]
  UartRX i_uart_rx ( // @[Uart.scala 25:26]
    .clock(i_uart_rx_clock),
    .reset(i_uart_rx_reset),
    .io_RD(i_uart_rx_io_RD),
    .io_recdata(i_uart_rx_io_recdata),
    .io_received(i_uart_rx_io_received)
  );
  Counter_2 i_cnt ( // @[Uart.scala 43:22]
    .clock(i_cnt_clock),
    .reset(i_cnt_reset),
    .io_en(i_cnt_io_en),
    .io_rst(i_cnt_io_rst),
    .io_out(i_cnt_io_out)
  );
  UartTX i_uart_tx ( // @[Uart.scala 50:26]
    .clock(i_uart_tx_clock),
    .reset(i_uart_tx_reset),
    .io_transmit(i_uart_tx_io_transmit),
    .io_txdata(i_uart_tx_io_txdata),
    .io_TD(i_uart_tx_io_TD)
  );
  assign received = i_uart_rx_io_received; // @[Uart.scala 27:24 Uart.scala 30:19]
  assign recdata = i_uart_rx_io_recdata; // @[Uart.scala 26:24 Uart.scala 29:19]
  assign received_cmd = i_cnt_io_out == 2'h3; // @[Uart.scala 47:33]
  assign _T_2 = r_cmd == 8'h6c; // @[Uart.scala 51:50]
  assign io_TD = i_uart_tx_io_TD; // @[Uart.scala 54:13]
  assign io_GPIO = {{6'd0}, i_cnt_io_out}; // @[Uart.scala 48:11]
  assign io_SW_OUT = io_SW_IN; // @[Uart.scala 55:13]
  assign i_uart_rx_clock = clock;
  assign i_uart_rx_reset = reset;
  assign i_uart_rx_io_RD = io_RD; // @[Uart.scala 28:19]
  assign i_cnt_clock = clock;
  assign i_cnt_reset = reset;
  assign i_cnt_io_en = i_uart_rx_io_received; // @[Uart.scala 45:16]
  assign i_cnt_io_rst = i_cnt_io_out == 2'h3; // @[Uart.scala 46:16]
  assign i_uart_tx_clock = clock;
  assign i_uart_tx_reset = reset;
  assign i_uart_tx_io_transmit = received_cmd & _T_2; // @[Uart.scala 51:25]
  assign i_uart_tx_io_txdata = r_arg0; // @[Uart.scala 52:25]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_arg0 = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r_arg1 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  r_cmd = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_arg0 <= 8'h0;
    end else if (received) begin
      r_arg0 <= r_arg1;
    end
    if (reset) begin
      r_arg1 <= 8'h0;
    end else if (received) begin
      r_arg1 <= recdata;
    end
    if (reset) begin
      r_cmd <= 8'h0;
    end else if (received) begin
      r_cmd <= r_arg0;
    end
  end
endmodule
