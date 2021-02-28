`timescale 1ns / 1ps
`include "../../../include/bus.v"
`include "../../../include/opcode.v"
`include "../../../include/funct.v"

module FunctGen(
  input       [`INST_OP_BUS]  op,
  input       [`FUNCT_BUS]    funct_in,
  output  reg [`FUNCT_BUS]    funct
);

  // generating FUNCT signal in order for the ALU to perform operations
  always @(*) begin
    case (op)
      `OP_SPECIAL: funct <= funct_in;
      `OP_LUI, `OP_ORI: funct <= `FUNCT_OR; //扩展指令ORI
      `OP_LB, `OP_LBU,`OP_LH, `OP_LHU, `OP_LW, //扩展指令LH、LHU、SH
      `OP_SB, `OP_SH, `OP_SW, `OP_ADDIU: funct <= `FUNCT_ADDU;
      `OP_JAL: funct <= `FUNCT_OR;
      `OP_ANDI: funct <= `FUNCT_AND;  //扩展指令ANDI
      `OP_XORI: funct <= `FUNCT_XOR;  //扩展指令XORI
      default: funct <= `FUNCT_NOP;
    endcase
  end

endmodule // FunctGen
