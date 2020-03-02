module Counter(
  input         clock,
  input         reset,
  input         io_en,
  input         io_rst,
  output [15:0] io_out
);
  reg [15:0] r_cnt; // @[Uart.scala 159:22]
  reg [31:0] _RAND_0;
  wire [15:0] _T_3; // @[Uart.scala 163:20]
  assign _T_3 = r_cnt + 16'h1; // @[Uart.scala 163:20]
  assign io_out = r_cnt; // @[Uart.scala 167:10]
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
  reg [7:0] r_cnt; // @[Uart.scala 159:22]
  reg [31:0] _RAND_0;
  wire [7:0] _T_3; // @[Uart.scala 163:20]
  assign _T_3 = r_cnt + 8'h1; // @[Uart.scala 163:20]
  assign io_out = r_cnt; // @[Uart.scala 167:10]
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
  wire  i_counter_clock; // @[Uart.scala 38:29]
  wire  i_counter_reset; // @[Uart.scala 38:29]
  wire  i_counter_io_en; // @[Uart.scala 38:29]
  wire  i_counter_io_rst; // @[Uart.scala 38:29]
  wire [15:0] i_counter_io_out; // @[Uart.scala 38:29]
  wire  i_uart_cnt_clock; // @[Uart.scala 45:28]
  wire  i_uart_cnt_reset; // @[Uart.scala 45:28]
  wire  i_uart_cnt_io_en; // @[Uart.scala 45:28]
  wire  i_uart_cnt_io_rst; // @[Uart.scala 45:28]
  wire [7:0] i_uart_cnt_io_out; // @[Uart.scala 45:28]
  wire  i_tx_cnt_clock; // @[Uart.scala 90:25]
  wire  i_tx_cnt_reset; // @[Uart.scala 90:25]
  wire  i_tx_cnt_io_en; // @[Uart.scala 90:25]
  wire  i_tx_cnt_io_rst; // @[Uart.scala 90:25]
  wire [15:0] i_tx_cnt_io_out; // @[Uart.scala 90:25]
  wire  i_txd_cnt_clock; // @[Uart.scala 97:28]
  wire  i_txd_cnt_reset; // @[Uart.scala 97:28]
  wire  i_txd_cnt_io_en; // @[Uart.scala 97:28]
  wire  i_txd_cnt_io_rst; // @[Uart.scala 97:28]
  wire [7:0] i_txd_cnt_io_out; // @[Uart.scala 97:28]
  reg [1:0] state; // @[Uart.scala 27:22]
  reg [31:0] _RAND_0;
  reg [2:0] tx_state; // @[Uart.scala 30:25]
  reg [31:0] _RAND_1;
  wire  _T_2; // @[Uart.scala 39:27]
  wire [15:0] counter_out; // @[Uart.scala 37:25 Uart.scala 41:15]
  wire  _T_3; // @[Uart.scala 39:58]
  wire  _T_4; // @[Uart.scala 39:42]
  wire  _T_5; // @[Uart.scala 40:27]
  wire  _T_6; // @[Uart.scala 40:58]
  wire  _T_7; // @[Uart.scala 40:42]
  wire  incr_uart_cnt; // @[Uart.scala 39:75]
  wire  _T_9; // @[Uart.scala 42:46]
  wire  _T_12; // @[Conditional.scala 37:30]
  wire  _T_13; // @[Uart.scala 55:14]
  wire  _T_14; // @[Conditional.scala 37:30]
  wire  _T_16; // @[Conditional.scala 37:30]
  wire [15:0] uart_cnt_out; // @[Uart.scala 46:26 Uart.scala 49:21]
  wire  _T_17; // @[Uart.scala 65:25]
  wire  _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_7; // @[Conditional.scala 39:67]
  wire  clr_uart_cnt; // @[Conditional.scala 40:58]
  reg [7:0] r_recdata; // @[Uart.scala 73:26]
  reg [31:0] _RAND_2;
  reg [7:0] r_GPIO; // @[Uart.scala 74:26]
  reg [31:0] _RAND_3;
  wire [6:0] _T_19; // @[Uart.scala 76:35]
  wire [7:0] _T_20; // @[Cat.scala 29:58]
  reg [7:0] r_txdata; // @[Uart.scala 82:25]
  reg [31:0] _RAND_4;
  reg  r_TD; // @[Uart.scala 83:25]
  reg [31:0] _RAND_5;
  wire  _T_23; // @[Uart.scala 84:54]
  wire  received; // @[Uart.scala 84:37]
  wire  _T_26; // @[Uart.scala 93:47]
  wire [15:0] tx_cnt; // @[Uart.scala 89:23 Uart.scala 92:19]
  wire  incr_txd_cnt; // @[Uart.scala 101:31]
  wire  _T_30; // @[Conditional.scala 37:30]
  wire  _T_32; // @[Conditional.scala 37:30]
  wire  _T_34; // @[Conditional.scala 37:30]
  wire  _T_35; // @[Uart.scala 122:23]
  wire [6:0] _T_37; // @[Uart.scala 124:29]
  wire [7:0] txd_cnt; // @[Uart.scala 96:26 Uart.scala 104:20]
  wire  _T_38; // @[Uart.scala 126:21]
  wire  _T_40; // @[Uart.scala 126:29]
  wire  _T_41; // @[Conditional.scala 37:30]
  wire  _T_43; // @[Conditional.scala 37:30]
  wire  _T_44; // @[Uart.scala 140:21]
  wire  _T_46; // @[Uart.scala 140:29]
  wire  _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_37; // @[Conditional.scala 40:58]
  Counter i_counter ( // @[Uart.scala 38:29]
    .clock(i_counter_clock),
    .reset(i_counter_reset),
    .io_en(i_counter_io_en),
    .io_rst(i_counter_io_rst),
    .io_out(i_counter_io_out)
  );
  Counter_1 i_uart_cnt ( // @[Uart.scala 45:28]
    .clock(i_uart_cnt_clock),
    .reset(i_uart_cnt_reset),
    .io_en(i_uart_cnt_io_en),
    .io_rst(i_uart_cnt_io_rst),
    .io_out(i_uart_cnt_io_out)
  );
  Counter i_tx_cnt ( // @[Uart.scala 90:25]
    .clock(i_tx_cnt_clock),
    .reset(i_tx_cnt_reset),
    .io_en(i_tx_cnt_io_en),
    .io_rst(i_tx_cnt_io_rst),
    .io_out(i_tx_cnt_io_out)
  );
  Counter_1 i_txd_cnt ( // @[Uart.scala 97:28]
    .clock(i_txd_cnt_clock),
    .reset(i_txd_cnt_reset),
    .io_en(i_txd_cnt_io_en),
    .io_rst(i_txd_cnt_io_rst),
    .io_out(i_txd_cnt_io_out)
  );
  assign _T_2 = state == 2'h1; // @[Uart.scala 39:27]
  assign counter_out = i_counter_io_out; // @[Uart.scala 37:25 Uart.scala 41:15]
  assign _T_3 = counter_out == 16'h4c4a; // @[Uart.scala 39:58]
  assign _T_4 = _T_2 & _T_3; // @[Uart.scala 39:42]
  assign _T_5 = state == 2'h2; // @[Uart.scala 40:27]
  assign _T_6 = counter_out == 16'h32dc; // @[Uart.scala 40:58]
  assign _T_7 = _T_5 & _T_6; // @[Uart.scala 40:42]
  assign incr_uart_cnt = _T_4 | _T_7; // @[Uart.scala 39:75]
  assign _T_9 = state == 2'h0; // @[Uart.scala 42:46]
  assign _T_12 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_13 = io_RD == 1'h0; // @[Uart.scala 55:14]
  assign _T_14 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_16 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign uart_cnt_out = {{8'd0}, i_uart_cnt_io_out}; // @[Uart.scala 46:26 Uart.scala 49:21]
  assign _T_17 = uart_cnt_out == 16'ha; // @[Uart.scala 65:25]
  assign _GEN_5 = _T_16 & _T_17; // @[Conditional.scala 39:67]
  assign _GEN_7 = _T_14 ? 1'h0 : _GEN_5; // @[Conditional.scala 39:67]
  assign clr_uart_cnt = _T_12 ? 1'h0 : _GEN_7; // @[Conditional.scala 40:58]
  assign _T_19 = r_recdata[7:1]; // @[Uart.scala 76:35]
  assign _T_20 = {io_RD,_T_19}; // @[Cat.scala 29:58]
  assign _T_23 = uart_cnt_out == 16'h8; // @[Uart.scala 84:54]
  assign received = incr_uart_cnt & _T_23; // @[Uart.scala 84:37]
  assign _T_26 = tx_state == 3'h0; // @[Uart.scala 93:47]
  assign tx_cnt = i_tx_cnt_io_out; // @[Uart.scala 89:23 Uart.scala 92:19]
  assign incr_txd_cnt = tx_cnt == 16'h32dc; // @[Uart.scala 101:31]
  assign _T_30 = 3'h0 == tx_state; // @[Conditional.scala 37:30]
  assign _T_32 = 3'h1 == tx_state; // @[Conditional.scala 37:30]
  assign _T_34 = 3'h2 == tx_state; // @[Conditional.scala 37:30]
  assign _T_35 = r_txdata[0]; // @[Uart.scala 122:23]
  assign _T_37 = r_txdata[7:1]; // @[Uart.scala 124:29]
  assign txd_cnt = i_txd_cnt_io_out; // @[Uart.scala 96:26 Uart.scala 104:20]
  assign _T_38 = txd_cnt == 8'h8; // @[Uart.scala 126:21]
  assign _T_40 = _T_38 & incr_txd_cnt; // @[Uart.scala 126:29]
  assign _T_41 = 3'h3 == tx_state; // @[Conditional.scala 37:30]
  assign _T_43 = 3'h4 == tx_state; // @[Conditional.scala 37:30]
  assign _T_44 = txd_cnt == 8'h1; // @[Uart.scala 140:21]
  assign _T_46 = _T_44 & incr_txd_cnt; // @[Uart.scala 140:29]
  assign _GEN_23 = _T_43 | r_TD; // @[Conditional.scala 39:67]
  assign _GEN_25 = _T_43 & _T_46; // @[Conditional.scala 39:67]
  assign _GEN_26 = _T_41 ? 1'h0 : _GEN_23; // @[Conditional.scala 39:67]
  assign _GEN_28 = _T_41 ? incr_txd_cnt : _GEN_25; // @[Conditional.scala 39:67]
  assign _GEN_29 = _T_34 ? _T_35 : _GEN_26; // @[Conditional.scala 39:67]
  assign _GEN_32 = _T_34 ? _T_40 : _GEN_28; // @[Conditional.scala 39:67]
  assign _GEN_33 = _T_32 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  assign _GEN_36 = _T_32 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  assign _GEN_37 = _T_30 | _GEN_33; // @[Conditional.scala 40:58]
  assign io_TD = r_TD; // @[Uart.scala 147:13]
  assign io_GPIO = r_GPIO; // @[Uart.scala 148:13]
  assign io_SW_OUT = io_SW_IN; // @[Uart.scala 149:13]
  assign i_counter_clock = clock;
  assign i_counter_reset = reset;
  assign i_counter_io_en = state != 2'h0; // @[Uart.scala 43:20]
  assign i_counter_io_rst = incr_uart_cnt | _T_9; // @[Uart.scala 42:20]
  assign i_uart_cnt_clock = clock;
  assign i_uart_cnt_reset = reset;
  assign i_uart_cnt_io_en = _T_4 | _T_7; // @[Uart.scala 48:21]
  assign i_uart_cnt_io_rst = _T_12 ? 1'h0 : _GEN_7; // @[Uart.scala 47:21]
  assign i_tx_cnt_clock = clock;
  assign i_tx_cnt_reset = reset;
  assign i_tx_cnt_io_en = tx_state != 3'h0; // @[Uart.scala 94:19]
  assign i_tx_cnt_io_rst = incr_txd_cnt | _T_26; // @[Uart.scala 93:19]
  assign i_txd_cnt_clock = clock;
  assign i_txd_cnt_reset = reset;
  assign i_txd_cnt_io_en = tx_cnt == 16'h32dc; // @[Uart.scala 103:20]
  assign i_txd_cnt_io_rst = _T_30 ? 1'h0 : _GEN_36; // @[Uart.scala 102:20]
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
  tx_state = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  r_recdata = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  r_GPIO = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  r_txdata = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  r_TD = _RAND_5[0:0];
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
      tx_state <= 3'h0;
    end else if (_T_30) begin
      if (received) begin
        tx_state <= 3'h1;
      end
    end else if (_T_32) begin
      if (incr_txd_cnt) begin
        tx_state <= 3'h2;
      end
    end else if (_T_34) begin
      if (_T_40) begin
        tx_state <= 3'h3;
      end
    end else if (_T_41) begin
      if (incr_txd_cnt) begin
        tx_state <= 3'h4;
      end
    end else if (_T_43) begin
      if (_T_46) begin
        tx_state <= 3'h0;
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
    end else if (received) begin
      r_GPIO <= r_recdata;
    end
    if (reset) begin
      r_txdata <= 8'h0;
    end else if (_T_30) begin
      if (received) begin
        r_txdata <= r_recdata;
      end
    end else if (!(_T_32)) begin
      if (_T_34) begin
        if (incr_txd_cnt) begin
          r_txdata <= {{1'd0}, _T_37};
        end
      end
    end
    r_TD <= reset | _GEN_37;
  end
endmodule
