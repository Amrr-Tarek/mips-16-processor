/*
    Byte-Addressable Memory
    Little Endian
*/
module im(
    input [15:0] addr,
    output [15:0] i_out
);
    reg [7:0] mem [0:63];

    integer i;
    // initial begin
    //     $readmemh("../../sim/machine_code.hex", mem, 0, 11); // Initialize the memory

    //     for (i = 12; i < 64; i = i + 1)
    //         mem[i] = 8'h00;
    // end
    initial begin
        $readmemh("../../sim/machine_code_pipe.hex", mem, 0, 21); // Initialize the memory

        for (i = 22; i < 64; i = i + 1)
            mem[i] = 8'h00;
    end
    
    assign i_out = {mem[addr+1], mem[addr]};
endmodule