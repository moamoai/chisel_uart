module Counter(
  input         clock,
  input         reset,
  input         io_en,
  input         io_rst,
  output [15:0] io_out
);
  reg [15:0] r_cnt; // @[Uart.scala 93:22]
  reg [31:0] _RAND_0;
  wire [15:0] _T_3; // @[Uart.scala 97:20]
  assign _T_3 = r_cnt + 16'h1; // @[Uart.scala 97:20]
  assign io_out = r_cnt; // @[Uart.scala 101:10]
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
  reg [7:0] r_cnt; // @[Uart.scala 93:22]
  reg [31:0] _RAND_0;
  wire [7:0] _T_3; // @[Uart.scala 97:20]
  assign _T_3 = r_cnt + 8'h1; // @[Uart.scala 97:20]
  assign io_out = r_cnt; // @[Uart.scala 101:10]
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
module Uart(
  input        clock,
  input        reset,
  output       io_TD,
  input        io_RD,
  output [7:0] io_GPIO,
  input        io_SW_IN,
  output       io_SW_OUT
);
  wire  i_counter_clock; // @[Uart.scala 35:29]
  wire  i_counter_reset; // @[Uart.scala 35:29]
  wire  i_counter_io_en; // @[Uart.scala 35:29]
  wire  i_counter_io_rst; // @[Uart.scala 35:29]
  wire [15:0] i_counter_io_out; // @[Uart.scala 35:29]
  wire  i_uart_cnt_clock; // @[Uart.scala 42:28]
  wire  i_uart_cnt_reset; // @[Uart.scala 42:28]
  wire  i_uart_cnt_io_en; // @[Uart.scala 42:28]
  wire  i_uart_cnt_io_rst; // @[Uart.scala 42:28]
  wire [7:0] i_uart_cnt_io_out; // @[Uart.scala 42:28]
  reg [1:0] state; // @[Uart.scala 27:22]
  reg [31:0] _RAND_0;
  wire  _T_2; // @[Uart.scala 36:27]
  wire [15:0] counter_out; // @[Uart.scala 34:25 Uart.scala 38:15]
  wire  _T_3; // @[Uart.scala 36:58]
  wire  _T_4; // @[Uart.scala 36:42]
  wire  _T_5; // @[Uart.scala 37:27]
  wire  _T_6; // @[Uart.scala 37:58]
  wire  _T_7; // @[Uart.scala 37:42]
  wire  incr_uart_cnt; // @[Uart.scala 36:75]
  wire  _T_9; // @[Uart.scala 39:46]
  wire  _T_12; // @[Conditional.scala 37:30]
  wire  _T_13; // @[Uart.scala 52:14]
  wire  _T_14; // @[Conditional.scala 37:30]
  wire  _T_16; // @[Conditional.scala 37:30]
  wire [15:0] uart_cnt_out; // @[Uart.scala 43:26 Uart.scala 46:21]
  wire  _T_17; // @[Uart.scala 62:25]
  wire  _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_7; // @[Conditional.scala 39:67]
  wire  clr_uart_cnt; // @[Conditional.scala 40:58]
  reg [7:0] r_recdata; // @[Uart.scala 70:26]
  reg [31:0] _RAND_1;
  reg [7:0] r_GPIO; // @[Uart.scala 71:26]
  reg [31:0] _RAND_2;
  wire [6:0] _T_19; // @[Uart.scala 73:35]
  wire [7:0] _T_20; // @[Cat.scala 29:58]
  wire  _T_23; // @[Uart.scala 78:47]
  wire  _T_24; // @[Uart.scala 78:30]
  Counter i_counter ( // @[Uart.scala 35:29]
    .clock(i_counter_clock),
    .reset(i_counter_reset),
    .io_en(i_counter_io_en),
    .io_rst(i_counter_io_rst),
    .io_out(i_counter_io_out)
  );
  Counter_1 i_uart_cnt ( // @[Uart.scala 42:28]
    .clock(i_uart_cnt_clock),
    .reset(i_uart_cnt_reset),
    .io_en(i_uart_cnt_io_en),
    .io_rst(i_uart_cnt_io_rst),
    .io_out(i_uart_cnt_io_out)
  );
  assign _T_2 = state == 2'h1; // @[Uart.scala 36:27]
  assign counter_out = i_counter_io_out; // @[Uart.scala 34:25 Uart.scala 38:15]
  assign _T_3 = counter_out == 16'h4c4a; // @[Uart.scala 36:58]
  assign _T_4 = _T_2 & _T_3; // @[Uart.scala 36:42]
  assign _T_5 = state == 2'h2; // @[Uart.scala 37:27]
  assign _T_6 = counter_out == 16'h32dc; // @[Uart.scala 37:58]
  assign _T_7 = _T_5 & _T_6; // @[Uart.scala 37:42]
  assign incr_uart_cnt = _T_4 | _T_7; // @[Uart.scala 36:75]
  assign _T_9 = state == 2'h0; // @[Uart.scala 39:46]
  assign _T_12 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_13 = io_RD == 1'h0; // @[Uart.scala 52:14]
  assign _T_14 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_16 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign uart_cnt_out = {{8'd0}, i_uart_cnt_io_out}; // @[Uart.scala 43:26 Uart.scala 46:21]
  assign _T_17 = uart_cnt_out == 16'ha; // @[Uart.scala 62:25]
  assign _GEN_5 = _T_16 & _T_17; // @[Conditional.scala 39:67]
  assign _GEN_7 = _T_14 ? 1'h0 : _GEN_5; // @[Conditional.scala 39:67]
  assign clr_uart_cnt = _T_12 ? 1'h0 : _GEN_7; // @[Conditional.scala 40:58]
  assign _T_19 = r_recdata[7:1]; // @[Uart.scala 73:35]
  assign _T_20 = {io_RD,_T_19}; // @[Cat.scala 29:58]
  assign _T_23 = uart_cnt_out == 16'h8; // @[Uart.scala 78:47]
  assign _T_24 = incr_uart_cnt & _T_23; // @[Uart.scala 78:30]
  assign io_TD = 1'h1; // @[Uart.scala 81:13]
  assign io_GPIO = r_GPIO; // @[Uart.scala 82:13]
  assign io_SW_OUT = io_SW_IN; // @[Uart.scala 83:13]
  assign i_counter_clock = clock;
  assign i_counter_reset = reset;
  assign i_counter_io_en = state != 2'h0; // @[Uart.scala 40:20]
  assign i_counter_io_rst = incr_uart_cnt | _T_9; // @[Uart.scala 39:20]
  assign i_uart_cnt_clock = clock;
  assign i_uart_cnt_reset = reset;
  assign i_uart_cnt_io_en = _T_4 | _T_7; // @[Uart.scala 45:21]
  assign i_uart_cnt_io_rst = _T_12 ? 1'h0 : _GEN_7; // @[Uart.scala 44:21]
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  r_GPIO = _RAND_2[7:0];
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
    if (reset) begin
      r_GPIO <= 8'h0;
    end else if (_T_24) begin
      r_GPIO <= r_recdata;
    end
  end
endmodule
