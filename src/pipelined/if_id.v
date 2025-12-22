module if_id(
    input clk,
    input [15:0] i_out_f,
    output reg [15:0] i_out_d
);
    always @(posedge clk)
        i_out_d <= i_out_f;
endmodule