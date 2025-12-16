/*
    Byte-Addressable Memory
    Little Endian
*/
module dm(
    input clk, we, // Note that no 're' signal is needed for synchronous read
    input [15:0] addr,
    input [15:0] d_in,
    output [15:0] d_out
);
    reg [7:0] mem [0:63];
    
    integer i;
    initial begin
        // ID: 1 20 22 02 12
        mem[0] = 8'h12;
        mem[1] = 8'h02;
        mem[2] = 8'h22;
        mem[3] = 8'h20;
        mem[4] = 8'h01;

        for (i = 5; i < 64; i = i + 1)
            mem[i] = 8'h00;
    end

    always @(posedge clk) begin
        if (we) begin
            if (addr > 16'h4 && addr < 16'h003F) begin
                mem[addr] <= d_in[7:0];
                mem[addr+1] <= d_in[15:8];
            end
        end
    end
    
    assign d_out = (addr < 16'h003F) ? {mem[addr+1], mem[addr]} : 16'h0;
endmodule