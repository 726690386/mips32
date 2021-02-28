# 基于MIPS架构的简单CPU框架

使用方法：
1. git clone https://github.com/726690386/mips32.git
2. 将CPU模块导入vivado工程

2021/1/15


## TinyMIPS

Implementation of TinyMIPS processor for USTB computer composition principle course design.

## TinyMIPS's ISA

| OpCode  | Description |
| ------- | ----------- |
| 算术运算指令           |
| ADD     |             |
| ADDI    |             |
| ADDU    | √           |
| ADDIU   | √           |
| SUB     |             |
| SUBU    | √           |
| SLT     | √           |
| SLTI    |             |
| SLTU    | √           |
| SLTIU   |             |
| DIV     |             |
| DIVU    |             |
| MULT    |             |
| MULTU   |             |
| ------- | ----------- |
| 逻辑运算指令           |
| AND     | √           |
| ANDI    | 27 √        |
| LUI     | √           |
| NOR     | 28          |
| OR      | √           |
| ORI     | 29 √        |
| XOR     | √           |
| XORI    | 31 √        |
| ------- | ----------- |
| 移位指令               |
| SLLV    | √           |
| SLL     | √           |
| SRAV    | √           |
| SRA     | 33          |
| SRLV    | √           |
| SRL     | 35          |
| ------- | ----------- |
| 分支跳转指令           |
| BEQ     | √           |
| BNE     | √           |
| BGEZ    |             |
| BGTZ    |             |
| BLEZ    |(√)          |
| BLTZ    |(√)          |
| BGEZAL  |             |
| BLTZAL  |             |
| J       |             |
| JAL     | √           |
| JR      |             |
| JALR    | √           |
| ------- | ----------- |
| 数据移动指令           |
| MFHI    |             |
| MFLO    |             |
| MTHI    |             |
| MTLO    |             |
| ------- | ----------- |
| 自陷指令               |
| BREAK   |             |
| SYSCALL |             |
| ------- | ----------- |
| 访存指令               |
| LB      | √           |
| LBU     | √           |
| LH      |(√)          |
| LHU     |(√)          |
| LW      | √           |
| SB      | √           |
| SH      |(√)          |
| SW      | √           |
| ------- | ----------- |
| 特权指令               |
| ERET    |             |
| MFC0    |             |（协处理器）
| MTC0    |             |（协处理器）

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
