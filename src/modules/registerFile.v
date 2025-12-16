/*
    rs, rt, rd are 3 bits, which means the register file has 2^3 = 8 registers
    Designed Registers:
    idx             name
    000             $zero (constant 0)
    
    001             $v0
    010             $a0
    011             $a1

    100             $t0
    101             $t1

    110             $s0
    111             $s1

    rs -> read regsiter 1
    rt -> read regsiter 2
    rd -> write register
*/
module rf(
    input clk, reg_write,
    input [2:0] rs, rt, rd,
    input [15:0] write_data,
    output reg [15:0] read_rs, read_rt
);

    reg [15:0] v0;
    reg [15:0] a0;
    reg [15:0] a1;
    reg [15:0] t0;
    reg [15:0] t1;
    reg [15:0] s0;
    reg [15:0] s1;

    initial begin
        v0 = 16'h0000;
        a0 = 16'h0000;
        a1 = 16'h0000;
        t0 = 16'h0000;
        t1 = 16'h0000;
        s0 = 16'h0000;
        s1 = 16'h0000;
    end

    always @(posedge clk) begin
        if (reg_write) begin
            case (rd)
                3'b000: ; // Read-Only
                3'b001: v0 <= write_data;
                3'b010: a0 <= write_data;
                3'b011: a1 <= write_data;
                3'b100: t0 <= write_data;
                3'b101: t1 <= write_data;
                3'b110: s0 <= write_data;
                3'b111: s1 <= write_data;
            endcase
        end
    end

    always @(*) begin
        case (rs)
            3'b001: read_rs = v0;
            3'b010: read_rs = a0;
            3'b011: read_rs = a1;
            3'b100: read_rs = t0;
            3'b101: read_rs = t1;
            3'b110: read_rs = s0;
            3'b111: read_rs = s1;
            default: read_rs = 16'h0000;
        endcase

        case (rt)
            3'b001: read_rt = v0;
            3'b010: read_rt = a0;
            3'b011: read_rt = a1;
            3'b100: read_rt = t0;
            3'b101: read_rt = t1;
            3'b110: read_rt = s0;
            3'b111: read_rt = s1;
            default: read_rt = 16'h0000;
        endcase
    end
endmodule