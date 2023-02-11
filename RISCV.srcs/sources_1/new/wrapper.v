`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2023 01:40:03 AM
// Design Name: 
// Module Name: wrapper
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


module wrapper(    );
    reg clk;
//    //reg ID_clk;
//    //reg EX_clk;
//    //reg MEM_clk;
//    //reg WB_clk;
    
    wire [29:0] program_counter_ext;
    wire [31:0] instruction, C_bus_ext,rs2_ext,read_data;
    wire [1:0] mem_write, mem_read;
    wire dmem_r_ready,dmem_w_ready,ins_ready,MEM_clk;

//    //RISCV_processor dut (.IF_clk(IF_clk), .ID_clk(ID_clk), .EX_clk(EX_clk), .MEM_clk(MEM_clk), .WB_clk(WB_clk));

    RISCV_processor proc_inst(    .clk(clk),    .program_counter_external(program_counter_ext),    .instruction(instruction),    
    .ins_ready(ins_ready),      .MEM_clk(MEM_clk), .mem_write(mem_write),    
    .mem_read(mem_read),       .C_bus_external(C_bus_ext),      .rs2_data_external(rs2_ext),       .read_data(read_data),   .mem_r_ready(dmem_r_ready),     .mem_w_ready(dmem_w_ready)      );
    
    
    //RISCV_processor(    input clk,    output [29:0] program_counter_external,    input [31:0] instruction,    
    //input ins_ready,       output MEM_clk,    output [1:0] mem_write,  
    //output [1:0] mem_read,        output [31:0] C_bus_external, output [31:0] rs2_data_external,  input [31:0] read_data,input mem_r_ready,input mem_w_ready );
    
    
    
    instruction_mem intruction_memory   (    .IF_clk(clk),    .instruction_address(program_counter_ext),    .instruction_out(instruction), .ins_ready(ins_ready)    );
    //instruction_mem                     (    input clk,    input [29:0] instruction_address,    output reg [31:0] instruction_out,    output reg ins_ready );

    data_mem            data_memory     (   .MEM_clk(MEM_clk),  .mem_write(mem_write),    .mem_read(mem_read),    .data_address(C_bus_ext),    .write_data(rs2_ext),    .read_data(read_data),    .dmem_r_ready(dmem_r_ready),    .dmem_w_ready(dmem_w_ready)  ); 
    //data_mem                          (    input MEM_clk,    input [1:0] mem_write,    input [1:0] mem_read,    input [31:0] data_address,    input [31:0] write_data,    output reg [31:0] read_data,    output reg dmem_r_ready,    output reg dmem_w_ready    );

    //clk generation
    initial 
        begin
        clk = 1'b0;
        forever #10 clk = ~clk;
        end
        
////    initial 
////        begin
////        ID_clk = 1'b0;
////        #4
////        forever #10 ID_clk = ~ID_clk;
////        end
        
////    initial 
////        begin
////        EX_clk = 1'b0;
////        #8
////        forever #10 EX_clk = ~EX_clk;
////        end
        
////    initial 
////        begin
////        MEM_clk = 1'b0;
////        #12
////        forever #10 MEM_clk = ~MEM_clk;
////        end   
        
////    initial 
////        begin
////        WB_clk = 1'b0;
////        #16
////        forever #10 WB_clk = ~WB_clk;
////        end
        


endmodule
