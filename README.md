# MIPS-16 Processor Design

A 16-bit MIPS processor implementation in Verilog, supporting both single-cycle and pipelined architectures. This project was developed using Altera Quartus 13.1 Web Edition for FPGA implementation.

## Overview

This project implements a simplified 16-bit MIPS processor with support for basic instructions including:

- R-Type instructions (ADD, SUB, AND, OR, XOR, NOR, SLT)
- I-Type instructions (ADDI, SUBI, LW, SW, BEQ)

The implementation includes both architectural variants:

- **Single-cycle processor** - Each instruction completes in one clock cycle
- **Pipelined processor** - 5-stage pipeline (IF, ID, EX, MEM, WB) for improved throughput

## Project Structure

```plaintext
mips-16/
├── src/
│   ├── modules/              # Core processor components (Verilog)
│   │   ├── alu.v             # Arithmetic Logic Unit
│   │   ├── controlUnit.v     # Main control unit
│   │   ├── registerFile.v    # Register file (8 registers)
│   │   ├── instruction_memory.v  # Instruction memory
│   │   ├── data_memory.v     # Data memory
│   │   ├── pc.v              # Program counter and adder
│   │   ├── branch_adder.v    # Branch target calculator
│   │   └── signExtend.v      # Sign extension unit
│   ├── single_cycle/         # Single-cycle implementation
│   │   └── processorSC.bdf   # Block diagram file
│   └── pipelined/            # Pipelined implementation
│       ├── if_id.v           # IF/ID pipeline register
│       ├── id_ex.v           # ID/EX pipeline register
│       ├── ex_mem.v          # EX/MEM pipeline register
│       ├── mem_wb.v          # MEM/WB pipeline register
│       └── processorPipe.bdf # Block diagram file
├── sim/
│   ├── instructions.asm      # Test assembly program
│   ├── waveform_sc.vwf       # Single-cycle waveform
│   └── waveform_pipe.vwf     # Pipelined waveform
├── report/                   # Technical documentation (LaTeX)
├── machine_code.hex          # Hex code converted from instructions.asm (single-cycle)
├── machine_code_pipe.hex     # Hex code converted from instructions.asm (pipelined)
├── *.bsf                     # Block symbol files
├── *.qpf                     # Quartus project file
└── *.qsf                     # Quartus settings file

```

## Features

### Instruction Set Architecture

- **16-bit instruction format**
- **8 general-purpose registers** (3-bit addressing)
- **16-bit data path**

### Supported Instructions

| Opcode | Type   | Instruction | Description              |
|--------|--------|-------------|--------------------------|
| 0000   | R-Type | ADD/SUB/etc | Register operations      |
| 0001   | I-Type | ADDI        | Add immediate            |
| 0010   | I-Type | SUBI        | Subtract immediate       |
| 1000   | I-Type | LW          | Load word from memory    |
| 1010   | I-Type | SW          | Store word to memory     |
| 1100   | I-Type | BEQ         | Branch if equal          |

### ALU Operations

- AND (000)
- OR (001)
- ADD (010)
- XOR (011)
- NOR (100)
- SUB (110)
- SLT (111) - Set on less than

## Getting Started

### Prerequisites

- Altera Quartus II 13.1 Web Edition or later
- ModelSim or similar simulator (for waveform simulation)

### Opening the Project

1. Open Altera Quartus II Web Edition
2. File → Open Project → Select `mips-16.qpf`
3. The project will load with all necessary files

### Compilation

1. Processing → Start Compilation (or Ctrl+L)
2. Check compilation reports in `output_files/` directory

### Simulation

1. Open waveform files:
   - `sim/waveform_sc.vwf` for single-cycle
   - `sim/waveform_pipe.vwf` for pipelined
2. Processing → Start Simulation
3. Verify results against expected outputs

### Test Program

The test program in `sim/instructions.asm` demonstrates:

1. Loading values from memory (LW)
2. Arithmetic operations (ADD, OR)
3. Storing results back to memory (SW)
4. Pipeline hazard handling (NOPs for stalls)

## Architecture

### Single-Cycle Design

- All instructions complete in one clock cycle
- Simple control logic
- Lower clock frequency due to critical path

### Pipelined Design

- 5-stage pipeline: IF → ID → EX → MEM → WB
- Hazard detection and stalling for load-use dependencies
- Pipeline registers between each stage
- Improved throughput

## Development

### Course Information

- **Course**: CSE 431 - Advanced Computer Architecture
- **Project**: 16-bit MIPS Processor Design

### File Formats

- `.v` - Verilog HDL source files
- `.bdf` - Block Diagram Files (Quartus schematic)
- `.bsf` - Block Symbol Files (component symbols)
- `.vwf` - Vector Waveform Files (testbenches)
- `.hex` - Machine code files (converted from assembly)
- `.qpf/.qsf` - Quartus project and settings

## Documentation

Detailed technical documentation is available in the `report/` directory, including:

- Design methodology
- Architecture diagrams
- Implementation details
- Simulation results
- Performance analysis

## License

This is an academic project developed for educational purposes.

## Notes

- The processor uses a simplified 16-bit architecture for educational demonstration
- Memory addressing is limited by the 16-bit address space
- Pipeline hazards are handled with stalls (NOP insertion)
- No forwarding/bypassing is implemented in the current version
