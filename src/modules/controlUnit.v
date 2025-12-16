/*
    Opcode table:
    Opcode  | Instruction | Description
    -------------------------------------------
    0000    | R-Type      | R-type instructions (add, sub, etc.)
    0001    | addi        | Add immediate
    0010    | subi        | Subtract immediate
    1000    | lw          | Load word
    1010    | sw          | Store word
    1100    | beq         | Branch if equal
*/

module ctrl_unit(
    input [3:0] opcode,
    input [2:0] funct,
    output reg [2:0] ALUCtrl,
    // output reg [1:0] alu_op,
    output reg reg_dst, branch, mem_to_reg, mem_write, alu_src, reg_write
);
    always @(*) begin
        case (opcode)
            // R-Type
            4'b0000: begin
                reg_dst = 1;
                branch = 0;
                mem_to_reg = 0;
                // alu_op = 2'b10;
                mem_write = 0;
                alu_src = 0;
                reg_write = 1;
                ALUCtrl = funct;
            end
            // addi
            4'b0001: begin
                reg_dst = 0;
                branch = 0;
                mem_to_reg = 0;
                // alu_op = 2'b00;
                mem_write = 0;
                alu_src = 1;
                reg_write = 1;
                ALUCtrl = 3'b010;
            end
            // subi
            4'b0010: begin
                reg_dst = 0;
                branch = 0;
                mem_to_reg = 0;
                // alu_op = 2'b01;
                mem_write = 0;
                alu_src = 1;
                reg_write = 1;
                ALUCtrl = 3'b110;
            end
            // lw
            4'b1000: begin
                reg_dst = 0;
                branch = 0;
                mem_to_reg = 1;
                // alu_op = 2'b00;
                mem_write = 0;
                alu_src = 1;
                reg_write = 1;
                ALUCtrl = 3'b010;
            end
            // sw
            4'b1010: begin
                reg_dst = 1'bx;
                branch = 0;
                mem_to_reg = 1'bx;
                // alu_op = 2'b00;
                mem_write = 1;
                alu_src = 1;
                reg_write = 0;
                ALUCtrl = 3'b010;
            end
            // beq
            4'b1100: begin
                reg_dst = 1'bx;
                branch = 1;
                mem_to_reg = 1'bx;
                // alu_op = 2'b01;
                mem_write = 0;
                alu_src = 0;
                reg_write = 0;
                ALUCtrl = 3'b110;
            end
            default: begin
                reg_dst = 0;
                branch = 0;
                mem_to_reg = 0;
                // alu_op = 0;
                mem_write = 0;
                alu_src = 0;
                reg_write = 0;
                ALUCtrl = 3'b010; // Default to add
            end
        endcase
    end
endmodule