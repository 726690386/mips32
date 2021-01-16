# 基于MIPS架构的简单CPU框架

2021/1/15

|
├─ bus
│  └─ AXIAdapter.v
├─ core
│  ├─ Core.v
│  ├─ pipeline
│  │  ├─ PipelineController.v
│  │  └─ PipelineDeliver.v
│  ├─ stage
│  │  ├─ ex
│  │  │  ├─ EX.v
│  │  │  └─ EXMEM.v
│  │  ├─ id
│  │  │  ├─ BranchGen.v
│  │  │  ├─ FunctGen.v
│  │  │  ├─ ID.v
│  │  │  ├─ IDEX.v
│  │  │  ├─ MemGen.v
│  │  │  ├─ OperandGen.v
│  │  │  └─ RegGen.v
│  │  ├─ if
│  │  │  ├─ IFID.v
│  │  │  └─ PC.v
│  │  ├─ mem
│  │  │  ├─ MEM.v
│  │  │  └─ MEMWB.v
│  │  └─ wb
│  │     └─ WB.v
│  └─ storage
│     ├─ RegFile.v
│     └─ RegReadProxy.v
├─ include
│  ├─ bus.v
│  ├─ debug.v
│  ├─ funct.v
│  ├─ iobuf.v
│  ├─ opcode.v
│  ├─ pcdef.v
│  ├─ segpos.v
│  └─ sim.v
├─ ip
├─ mmu
│  └─ StaticMMU.v
├─ mycpu_top.v
├─ README.md
├─ sim
│  ├─ RAM.v
│  └─ ROM.v
└─ TinyMIPS.v


# TinyMIPS

Implementation of TinyMIPS processor for USTB computer composition principle course design.

## TinyMIPS's ISA

| OpCode  | Description |
| ------- | ----------- |
| ADDU    | N/A         |
| ADDIU   | N/A         |
| SUBU    | N/A         |
| SLT     | N/A         |
| SLTU    | N/A         |
| AND     | N/A         |
| LUI     | N/A         |
| OR      | N/A         |
| XOR     | N/A         |
| SLL     | N/A         |
| SLLV    | N/A         |
| SRAV    | N/A         |
| SRLV    | N/A         |
| BEQ     | N/A         |
| BNE     | N/A         |
| JAL     | N/A         |
| JALR    | N/A         |
| LB      | N/A         |
| LBU     | N/A         |
| LW      | N/A         |
| SB      | N/A         |
| SW      | N/A         |

With no exceptions/interrupts supported.

## Recommended Implementation Order

1. Register file;
2. Basic pipeline and `ADDU` instruction;
3. `ADDIU` and `LUI` instruction;
4. Handle data dependencies;
5. Jump/Branch instructions;
6. Memory accessing instructions;
7. Handle data dependencies again (pipeline controller).

## Note

If you are using Vivado, after importing source files, you may need to do the following things:

1. Go to "Tools - Settings... - General - Verilog options", add `src\cpu\include` to search paths.
2. Select all include files in "Project Manager", then right click and click "Set Global Include".
