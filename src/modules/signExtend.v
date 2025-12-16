/*
    Performs sign extension on 6-bit input to produce a 16-bit output.
    If the most significant bit (MSB) of the input is 1, the output is filled with 1's in the upper bits.
    If the MSB is 0, the output is filled with 0's in the upper bits.
*/

module sign_extend(
    input [5:0] in,
    output [15:0] out
);
    assign out = {{10{in[5]}}, in};
endmodule