module pc (
    input clk, reset,
    input [15:0] pc_in,
    output reg [15:0] pc_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 16'b0;
        else
            pc_out <= pc_in;
    end
endmodule

module pc_adder (
    input [15:0] pc_out,
    output [15:0] pc_in
);
    assign pc_in = ((pc_out + 16'd2) % 16'd64); // Increment by 2 bytes, modulo 64
endmodule