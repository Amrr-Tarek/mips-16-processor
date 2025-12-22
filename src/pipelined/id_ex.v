module id_ex(
    input clk,
    input [2:0] ALUCtrl_d,
    input reg_dst_d, mem_to_reg_d, mem_write_d, alu_src_d, reg_write_d,
    input [15:0] rdata1_d, rdata2_d, sign_ext_imm_d,
    input [2:0] rt_d, rd_d,

    output reg [2:0] ALUCtrl_x,
    output reg reg_dst_x, mem_to_reg_x, mem_write_x, alu_src_x, reg_write_x,
    output reg [15:0] rdata1_x, rdata2_x, sign_ext_imm_x,
    output reg [2:0] rt_x, rd_x
);
    always @(posedge clk) begin
        // Control Signals
        ALUCtrl_x <= ALUCtrl_d;
        reg_dst_x <= reg_dst_d;
        mem_to_reg_x <= mem_to_reg_d;
        mem_write_x <= mem_write_d;
        alu_src_x <= alu_src_d;
        reg_write_x <= reg_write_d;

        // Data Signals
        rdata1_x <= rdata1_d;
        rdata2_x <= rdata2_d;
        sign_ext_imm_x <= sign_ext_imm_d;

        // PC and Registers' indices
        rt_x <= rt_d;
        rd_x <= rd_d;
    end
endmodule