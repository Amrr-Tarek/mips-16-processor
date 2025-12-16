module branch_adder (
    input [15:0] next_pc,
    input [15:0] imm,
    output [15:0] branch_addr
);
    assign branch_addr = next_pc + (imm << 1);
endmodule