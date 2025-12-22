module ex_mem(
    input clk,
    input mem_to_reg_x, mem_write_x, reg_write_x,
    input [15:0] alu_result_x, rdata2_x,
    input [2:0] rd_x,

    output reg mem_to_reg_m, mem_write_m, reg_write_m,
    output reg [15:0] alu_result_m, rdata2_m,
    output reg [2:0] rd_m
);
    always @(posedge clk) begin
        // Control Signals
        mem_to_reg_m <= mem_to_reg_x;
        mem_write_m <= mem_write_x;
        reg_write_m <= reg_write_x;

        // Data Signals
        alu_result_m <= alu_result_x;
        rdata2_m <= rdata2_x;

        // Destination Register
        rd_m <= rd_x;
    end
endmodule