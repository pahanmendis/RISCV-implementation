`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2023 01:41:21 AM
// Design Name: 
// Module Name: RISCV_processor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RISCV_processor(
    input clk,
    
    // external ports to instruction memory
    output IF_clk,
    output [29:0] program_counter_external,
    input [31:0] instruction,
    input ins_ready,
    
    // extrenal ports to data memory
    output MEM_clk,
    output [1:0] mem_write,    
    output [1:0] mem_read,    
    output [31:0] C_bus_external,           
    output [31:0] rs2_data_external,    
    input [31:0] read_data,
    input mem_r_ready,
    input mem_w_ready
    );
    
//wire declarations  
wire [31:0] program_counter, write_data, pc_update_out;

wire [31:0] rs1_data, rs2_data, immediate_data, B_bus, C_bus, pc_add4;

wire [4:0] ALU_op;

//flags
wire z_flag,p_flag,n_flag;

//control signals 
wire [1:0] extend;
wire [2:0] im_slice;
wire alu_source;
wire [1:0] branch;
wire [2:0] to_reg;
wire reg_write;  

// state transition signals 
wire pc_ready;
wire cu_ready;
wire reg_mem_ready;
wire im_gen_ready;
wire alu_ready;
wire pc_update_ready;

wire en_id;
wire en_exe;
wire en_mem;
wire en_wb;

assign IF_clk = clk;
assign rs2_data_external = rs2_data;
assign program_counter_external = program_counter[31:2];
assign C_bus_external = C_bus;

//always @(pc_ready or cu_ready or reg_mem_ready or im_gen_ready or alu_ready or pc_update_ready)
//begin
//    case (state) // define state
//    3'b000: // IF 
//    begin 
        

program_counter     pc              (    .en(en_wb),    .pc_input(pc_update_out),    .pc_output(program_counter), .pc_ready(pc_ready)    );

register_memory     reg_memory      (   .en_id(en_id), .en_wb(en_wb), .reg_write(reg_write), .rs1_addr(instruction[19:15]), .rs2_addr(instruction[24:20]), .rd_addr(instruction[11:7]),  .write_data(write_data),  .rs1_data(rs1_data),    .rs2_data(rs2_data), .reg_mem_ready(reg_mem_ready)    );

immediate_data_gen  immediate_data_generator( .en(en_id),   .extend(extend),    .im_slice(im_slice),    .instruction_in(instruction),    .imm_data(immediate_data), .im_gen_ready(im_gen_ready)    );

control_unit        CU              (   .en(en_id),   .opcode(instruction[6:0]),   .func3(instruction[14:12]),  .im_slice(im_slice),  .extend(extend),
                                        .alu_source(alu_source),   .branch(branch),    .to_reg(to_reg),  .mem_read(mem_read),    .mem_write(mem_write),  .reg_write(reg_write), .cu_ready(cu_ready)    );

ALU_control_gen     ALU_controls    (    .instruction(instruction),    .ALU_op(ALU_op)    );

mux_2               mux2            (    .A(rs2_data), .B(immediate_data),     .sel(alu_source),    .out(B_bus)    );                

ALU                 ALU1            (   .en(en_exe),    .A(rs1_data),    .B(B_bus),    .ALU_op(ALU_op),    .z_flag(z_flag),    .p_flag(p_flag),    .n_flag(n_flag),    .out(C_bus), .alu_ready(alu_ready)    );

mux_4               mux4            (    .A(immediate_data),     .B(C_bus),     .C(read_data),     .D(pc_add4),     .sel(to_reg),   .out(write_data)    );         

pc_update           pc_update1      (    .en(en_mem), .program_counter(program_counter),    .immediate_data(immediate_data),    .c_bus(C_bus),    .pc_update_out(pc_update_out),    .branch(branch),    .z_flag(z_flag),    .p_flag(p_flag),    .n_flag(n_flag), .pc_update_ready(pc_update_ready)    );

Adder_4             add4            (    .pc_in(pc_update_out),      .branch(branch),    .pc_add_4(pc_add4)    );

endmodule
