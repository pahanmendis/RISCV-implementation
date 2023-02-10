`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2023 03:16:52 AM
// Design Name: 
// Module Name: wrapper_tb
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


module wrapper_tb(
    );
    reg IF_clk;
    reg ID_clk;
    reg EX_clk;
    reg MEM_clk;
    reg WB_clk;
    
    wire [29:0] program_counter_ext;
    wire [31:0] instruction, C_bus_ext,rs2_ext,read_data;
    wire [1:0] mem_write, mem_read;

    //RISCV_processor dut (.IF_clk(IF_clk), .ID_clk(ID_clk), .EX_clk(EX_clk), .MEM_clk(MEM_clk), .WB_clk(WB_clk));
    RISCV_processor proc_inst(    .IF_clk(IF_clk), .ID_clk(ID_clk), .EX_clk(EX_clk), .MEM_clk(MEM_clk), .WB_clk(WB_clk),    .program_counter_external(program_counter_ext),    .instruction(instruction),    .mem_write(mem_write),    
    .mem_read(mem_write),       .C_bus_external(C_bus_ext),      .rs2_data_external(rs2_ext),       .read_data(read_data)     );
    
    
    instruction_mem intruction_memory   (    .IF_clk(IF_clk),    .instruction_address(program_counter_ext),    .instruction(instruction)    );

    data_mem            data_memory     (   .MEM_clk(MEM_clk),  .mem_write(mem_write),    .mem_read(mem_read),    .data_address(C_bus_ext),    .write_data(rs2_ext),    .read_data(read_data)  ); 


    //clk generation
    initial 
        begin
        IF_clk = 1'b0;
        forever #10 IF_clk = ~IF_clk;
        end
        
    initial 
        begin
        ID_clk = 1'b0;
        #4
        forever #10 ID_clk = ~ID_clk;
        end
        
    initial 
        begin
        EX_clk = 1'b0;
        #8
        forever #10 EX_clk = ~EX_clk;
        end
        
    initial 
        begin
        MEM_clk = 1'b0;
        #12
        forever #10 MEM_clk = ~MEM_clk;
        end   
        
    initial 
        begin
        WB_clk = 1'b0;
        #16
        forever #10 WB_clk = ~WB_clk;
        end
        

endmodule
