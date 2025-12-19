// 1. Load Instruction 1: Load a value from memory, last 4 ID numbers (120220011 , in which
// ”0011” represents the numbers we load in Hexadecimal).
// 2. Load Instruction 2: Load a second value, (120220011 , in which ”2022” represents the numbers
// we load in Hexadecimal).
// 3. R-Type (ADD): Add the two loaded values.
// 4. R-Type (OR): Perform bitwise OR on the two loaded values.
// 5. Store Instruction 1: Store the ADD result back to memory (In address location 0x05&0x06).
// 6. Store Instruction 2: Store the OR result back to memory (In address location 0x07&0x08)

// 1.
// 1000 000 100 000000 => 0x8100
lw $t0, 0($0) //t0 = 0x0212
// 2.
// 1000 000 101 000010 => 0x8142
lw $t1, 2($0) //t1 = 0x2022

// Stall: Load-use hazard - wait for $t1 to be written
// 0000 000 000 000 000 => 0x0000
nop
// 0000 000 000 000 000 => 0x0000
nop
// 0000 000 000 000 000 => 0x0000
nop

// 3.
// 0000 100 101 110 010 => 0x0972
add $s0, $t0, $t1 // s0 = t0 + t1 = 0x0212 + 0x2022 = 0x2234

// 4.
// 0000 100 101 111 001 => 0x0979
or $s1, $t0, $t1 // s1 = t0 | t1 = 0x0212 | 0x2022 = 0x2232

// 5.
// 1010 000 110 000101 => 0xA185
sw $s0, 5($0) // Memory[0x05, 0x06] = 0x2234

// 6.
// 1010 000 111 000111 => 0xA1C7
sw $s1, 7($0) // Memory[0x07, 0x08] = 0x2232


// Pipelining Hazards

/*
Load-Use Hazard:
Problem: In instruction 3, the ADD instruction uses the values loaded in instructions 1 and 2.
Solution: Introduce a stall (NOP) between the load and the ADD instruction to allow time for the data to be loaded.
*/