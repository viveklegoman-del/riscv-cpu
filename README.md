# RISC-V CPU Processor Core

A 32-bit RISC-V processor built from the ground up using **SystemVerilog**, with simulation, verification, and synthesis using Icarus Verilog and Yosys. The goal is to develop a working single-cycle CPU and eventually deploy it on an FPGA.

## Project Overview

This project focuses on understanding how a processor works at the hardware level by implementing its core components in RTL (Register-Transfer Level) design.

Rather than using a prebuilt processor, I am building the datapath and control logic from individual hardware modules, starting with the Arithmetic Logic Unit (ALU) and expanding toward a complete RISC-V processor.

## Current Progress

- [x] Set up the development environment on macOS
- [x] Begin implementing the ALU in SystemVerilog
- [x] Use Icarus Verilog to compile and simulate RTL
- [x] Explore Yosys synthesis and generate a logic diagram for the ALU
- [ ] Complete and verify a 32-entry register file
- [ ] Implement an immediate generator
- [ ] Build the processor control unit and instruction decoder
- [ ] Integrate the modules into a complete single-cycle CPU
- [ ] Test supported instructions using self-checking testbenches
- [ ] Run RISC-V instruction tests
- [ ] Synthesize the complete processor with Yosys
- [ ] Deploy the processor to an FPGA

*Progress reflects the development work completed so far; individual module verification and integration remain ongoing.*

## Hardware Architecture

The target design is a **32-bit single-cycle RISC-V processor** implementing the RV32I base instruction set.

The planned processor will contain the following components:

### 1. Arithmetic Logic Unit (ALU)

The ALU performs arithmetic and logical operations on 32-bit operands. It is one of the first modules implemented in this project.

Its purpose is to execute the calculations requested by processor instructions, including arithmetic, bitwise logic, and comparisons as required by the instruction set.

**Implementation:** SystemVerilog (`rtl/ALU.sv`)

### 2. Register File

The register file stores the processor's working data. The planned design contains 32 architectural registers, each 32 bits wide.

It will provide register operands to the ALU and accept results written back by instructions. The RISC-V `x0` register must always read as zero.

**Status:** Planned / in progress.

## Development Tools

| Tool | Purpose |
|---|---|
| SystemVerilog | Describe the processor hardware at RTL |
| Icarus Verilog | Compile and simulate SystemVerilog modules |
| Yosys | Synthesize RTL and inspect the resulting logic |
| GTKWave | Inspect simulation waveforms, if installed |
| macOS Terminal | Compile, run tests, and execute synthesis commands |

## Simulation and Synthesis

### Simulation with Icarus Verilog

I use Icarus Verilog to compile RTL modules and test their behavior before integrating them into the processor.

Example compilation command for the ALU:

```bash
iverilog -o build/alutest rtl/ALU.sv tb/ALUtb.sv
```

Run the compiled simulation:

```bash
vvp build/alutest
```

The testbench path above is an example and should match the actual filename in the repository.

### Synthesis with Yosys

Yosys is used to process the SystemVerilog design, optimize the logic, and inspect the resulting hardware structure.

Example ALU synthesis and logic visualization command:

```bash
yosys -p 'read_verilog -sv rtl/ALU.sv; hierarchy -top alu; proc; opt; show -format dot -prefix build/alu alu'
```

The top-module name must match the module declaration in `ALU.sv`. The generated logic diagram helps connect the RTL code to the hardware structure inferred by synthesis.

## Planned Verification Strategy

As the processor develops, I plan to verify each module independently before testing the integrated CPU.

- **Unit testing:** Test individual modules with different input combinations and expected outputs.
- **Instruction testing:** Check that each supported instruction produces the correct result and updates the correct architectural state.
- **Waveform analysis:** Inspect signal transitions and internal values to debug failures.
- **Regression testing:** Rerun previously passing tests after modifying the RTL.
- **Synthesis checks:** Confirm that the design can be processed by Yosys and inspect the inferred hardware.

The eventual goal is to test the supported RV32I instructions against expected behavior and use the results to identify and fix bugs.

## Repository Structure

The repository is expected to follow a structure similar to this:

```text
riscv-cpu/
├── rtl/
│   ├── ALU.sv
│   ├── register_file.sv
├── tb/
│   ├── ALU_tb.sv
├── build/
├── README.md
└── .gitignore
```

This is a proposed structure; filenames should be updated to reflect the actual files in the repository.

## Learning Objectives

Through this project, I am developing practical experience with:

- RTL design and SystemVerilog hardware description
- Combinational and sequential logic
- Arithmetic circuits and ALU design
- Register files, multiplexers, and datapath organization
- Instruction encoding and RISC-V architecture
- Simulation, debugging, and waveform analysis
- Logic synthesis and hardware resource inspection
- Processor integration and FPGA-oriented design
