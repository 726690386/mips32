`timescale 1ns / 1ps
`include "../include/bus.v"
`include "../include/pcdef.v"
`include "../include/sim.v"

module ROM(
  input                       clk,
  input                       rom_en,
  input       [`MEM_SEL_BUS]  rom_write_en,
  input       [`ADDR_BUS]     rom_addr,
  input       [`DATA_BUS]     rom_write_data,
  output  reg [`DATA_BUS]     rom_read_data
);
  //`INST_MEM_BUS 1023:0    ROM总大小8*1KB
  reg[7:0] inst_mem[`INST_MEM_BUS];

  // initialize with program
  initial begin
    $readmemh("inst_rom.bin", inst_mem);
  end

  wire[`ADDR_BUS] addr = rom_addr - `INIT_PC;

  always @(posedge clk) begin
    if (!rom_en) begin
      rom_read_data <= 0;
    end
    else begin
      rom_read_data <= {
        inst_mem[addr[`INST_MEM_ADDR_WIDTH - 1:0] + 0],
        inst_mem[addr[`INST_MEM_ADDR_WIDTH - 1:0] + 1],
        inst_mem[addr[`INST_MEM_ADDR_WIDTH - 1:0] + 2],
        inst_mem[addr[`INST_MEM_ADDR_WIDTH - 1:0] + 3]
      };
    end
  end

endmodule // ROM
