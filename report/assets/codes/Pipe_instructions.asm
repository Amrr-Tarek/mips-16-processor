// Initialize Registers
lw   $t0, 0($0)      // 1. t0 = 0x0212
lw   $t1, 2($0)      // 2. t1 = 0x2022
nop
nop
nop
// Perform Arithmetic and Logical Operations
add  $s0, $t0, $t1   // 3. s0 = 0x2234
or   $s1, $t0, $t1   // 4. s1 = 0x2232
// Pipeline RAW Hazards
nop
nop
// Store Results Back to Memory
sw   $s0, 5($0)     // 5. Memory[0x05, 0x06] = 0x2234
sw   $s1, 7($0)     // 6. Memory[0x07, 0x08] = 0x2232