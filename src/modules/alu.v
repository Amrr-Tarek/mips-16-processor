/*
    Implemented Operations:
    ALUCtrl         Operation
    000             AND
    001             OR
    010             ADD
    011             XOR
    100             NOR
    101             (Reserved for future use)
    110             SUBTRACT
    111             SLT
*/

module alu(
    input [15:0] a, b,
    input [2:0] ALUCtrl,
    output zero,
    output reg [15:0] out
);

    always @(*) begin
        case (ALUCtrl)
            3'b000: out = a & b;
            3'b001: out = a | b;
            3'b010: out = a + b;
            3'b011: out = a ^ b;
            3'b100: out = ~(a | b);
            // 101 is left for future use
            3'b110: out = a - b;
            3'b111: out = ($signed(a) < $signed(b)) ? 16'b1 : 16'b0;
            default: out = 0;
        endcase
    end

    assign zero = (out == 16'b0);
endmodule

// module alu_ctrl(
//     input [2:0] funct,
//     input [1:0] ALUOp,
//     output reg [2:0] ALUCtrl
// );

//     always @(*) begin
//         case (ALUOp)
//             2'b00: ALUCtrl = 3'b010; // Add
//             2'b01: ALUCtrl = 3'b110; // Sub
//             2'b10: ALUCtrl = funct; // R-Type
//             default: ALUCtrl = 3'b010; // Default to Add
//         endcase
//     end
// endmodule