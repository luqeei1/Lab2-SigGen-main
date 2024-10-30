module sigdelay #(
    parameter A_WIDTH = 9,
              D_WIDTH = 8
)(
    // interface signals
    input  logic           clk,   // clock
    input  logic           rst,   // reset
    input  logic            wr,
    input  logic            rd,
    input  logic  [D_WIDTH-1:0]         mic_signal,
    input logic  [D_WIDTH-1:0]    offset,
    output logic  [D_WIDTH-1:0]      delayed_signal,
);

    logic [A_WIDTH-1:0] address;  // interconnect wire

    counter addrCounter (
        .clk (clk),
        .rst (rst),
        .count(address)
    );


    ram2ports #(A_WIDTH,D_WIDTH) audioRam(
        .clk  (clk),
        .wr_addr (address),
        .wr_en(wr),
        .rd_en(rd),
        .rd_addr (address - offset),
        .din (mic_signal),
        .dout (delayed_signal)
    );

endmodule
