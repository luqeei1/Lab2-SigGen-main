module sinegen #(
    parameter A_WIDTH = 8,
              D_WIDTH = 8
)(
    // interface signals
    input  logic           clk,   // clock
    input  logic           rst,   // reset
    input  logic           en,    // enable
    input logic  [D_WIDTH-1:0]           offset,
    input  logic [D_WIDTH-1:0] incr, // increment for addr counter
    output logic [D_WIDTH-1:0] dout,  // output data
    output logic [D_WIDTH-1:0] dout2
);

    logic [A_WIDTH-1:0] address;  // interconnect wire
    logic[A_WIDTH-1:0] address2;

    counter addrCounter (
        .clk (clk),
        .rst (rst),
        .en  (en),
        .incr(incr),
        .count(address)
    );

    assign address2 = address + offset;

    rom sineRom (
        .clk  (clk),
        .addr (address),
        .addr2 (address2),
        .dout (dout),
        .dout2 (dout2)
    );

endmodule
