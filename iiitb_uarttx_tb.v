`timescale 1ns/10ps

`include "iiitb_uarttx.v"

module uart_tb();

parameter c_CLOCK_PERIOD_NS = 40;
parameter c_CLKS_PER_BIT    = 217;
parameter c_BIT_PERIOD      = 8600;

  reg r_Clock = 0;
  reg r_TX_DV = 0;
  wire w_TX_Active, w_UART_Line;
  wire w_TX_Serial;
  reg [7:0] r_TX_Byte = 8'h3F;
  wire [7:0] w_RX_Byte ;

UART_TX #(.CLKS_PER_BIT(c_CLKS_PER_BIT)) UART_TX_Inst
    (.i_Clock(r_Clock),
     .i_TX_DV(r_TX_DV),
     .i_TX_Byte(r_TX_Byte),
     .o_TX_Active(w_TX_Active),
     .o_TX_Serial(w_TX_Serial),
     .o_TX_Done()
     );

always
    #(c_CLOCK_PERIOD_NS/2) r_Clock <= !r_Clock;
  

    // Main Testing:
  initial
    begin
      // Tell UART to send a command (exercise TX)
      @(posedge r_Clock);
      @(posedge r_Clock);
      r_TX_DV   <= 1'b1;
      r_TX_Byte <= 8'hAA;
      @(posedge r_Clock);
      r_TX_DV <= 1'b0;

    end

    initial 
  begin
    // Required to dump signals to EPWave
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end



endmodule
