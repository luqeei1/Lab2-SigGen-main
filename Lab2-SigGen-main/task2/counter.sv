module counter #(

    parameter WIDTH = 8
)(

input logic     clk,
input logic     rst,
input logic [WIDTH-1:0] incr,
output logic[WIDTH-1:0] count

);

always_ff @ (posedge clk)
    if (rst) count <= {WIDTH{1'b0}};
    else count <= count +  {{WIDTH-1{1'b0}}, 1'b1};;

endmodule
