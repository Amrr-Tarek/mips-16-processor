module mem_wb(
    input clk,
    input mem_to_reg_m, reg_write_m,
    input [15:0] alu_result_m, mem_data_m,
    input [2:0] rd_m,
    output reg mem_to_reg_w, reg_write_w,
    output reg [15:0] alu_result_w, mem_data_w,
    output reg [2:0] rd_w
);
    always @(posedge clk) begin
        // Control Signals
        mem_to_reg_w <= mem_to_reg_m;
        reg_write_w <= reg_write_m;

        // Data Signals
        alu_result_w <= alu_result_m;
        mem_data_w <= mem_data_m;

        // Destination Register
        rd_w <= rd_m;
    end
endmodule
