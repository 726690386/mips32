`timescale 1ns / 1ps
`include "../../../include/bus.v"
`include "../../../include/opcode.v"

module MemGen(
  input       [`INST_OP_BUS]  op,
  input       [`DATA_BUS]     reg_data_2,
  output  reg                 mem_read_flag,
  output  reg                 mem_write_flag,
  output  reg                 mem_sign_ext_flag,
  output  reg [`MEM_SEL_BUS]  mem_sel,
  output  reg [`DATA_BUS]     mem_write_data
);

  // generate control signal of memory accessing
  always @(*) begin
    case (op)
      `OP_SB, `OP_SH, `OP_SW: mem_write_flag <= 1; //扩展指令SH 写
      default: mem_write_flag <= 0;
    endcase
  end
  
  always @(*) begin
    case (op)
      `OP_LB, `OP_LBU, `OP_LH, `OP_LHU, `OP_LW: mem_read_flag <= 1; //扩展指令LH、LHU 读
      default: mem_read_flag <= 0;
    endcase
  end
  
  always @(*) begin
    case (op)
      `OP_LB, `OP_LW, `OP_LH, `OP_SH: mem_sign_ext_flag <= 1; //扩展指令LH、SH 符号扩展
      default: mem_sign_ext_flag <= 0;
    endcase
  end

  // mem_sel: lb & sb -> 1, lw & sw -> 1111
  always @(*) begin
    case (op)
      `OP_LB, `OP_LBU, `OP_SB: mem_sel <= 4'b0001;
      `OP_LH, `OP_LHU, `OP_SH: mem_sel <= 4'b0011;  //扩展指令LH、LHU、SH 两个字节
      `OP_LW, `OP_SW: mem_sel <= 4'b1111;
      default: mem_sel <= 4'b0000;
    endcase
  end

  // generate data to be written to memory
  always @(*) begin
    case (op)
      `OP_SB, `OP_SH,`OP_SW: mem_write_data <= reg_data_2; //扩展指令SH
      default: mem_write_data <= 0;
    endcase
  end

endmodule // MemGen
