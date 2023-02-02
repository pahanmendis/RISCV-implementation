`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 12:07:08 PM
// Design Name: 
// Module Name: register_memory_tb
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


module register_memory_tb();
//reg clk;
//reg reset;

//wire declaration for the specific module
reg ID_clk;
reg WB_clk;
reg reg_write;
reg [4:0] rs1_addr;
reg [4:0] rs2_addr;
reg [4:0] rd_addr;
reg [31:0] write_data;
wire [31:0] rs1_data;
wire [31:0] rs2_data;



//dut instantiation -> look at the input ports and declare reg to give inputs,  declare wires for the output ports
//then give those wires to the input and output ports
//ALU(    input EX_clk,    input [31:0] A,    input [31:0] B,    input [4:0] ALU_op,    output reg z_flag,    output reg p_flag,    output reg n_flag,    output reg [31:0] out    );
register_memory reg_mem_dut(  .ID_clk(ID_clk),  .WB_clk(WB_clk),  .reg_write(reg_write),
  .rs1_addr(rs1_addr),  .rs2_addr(rs2_addr), .rd_addr(rd_addr), 
  .write_data(write_data),  .rs1_data(rs1_data), .rs2_data(rs2_data));

//clk generation
initial 
    begin
    ID_clk = 1'b0;
    forever #5 ID_clk = ~ID_clk;
    end
    
initial 
    begin
    WB_clk = 1'b0;
    #3
    forever #5 WB_clk = ~WB_clk;
    end

//generate reset
//initial
//    begin
//        reset=1'b1;
//        #10   //wait for 10 time units
//        reset=1'b0;
//    end

// giving inputs and testing the module    

initial
    begin
        $monitor("time=%3d,reg_write=%b , rs1_addr=%b, rs2_addr=%b, rd_addr=%b, write_data=%b, rs1_data=%b, rs2_data=%b \n",$time,reg_write , rs1_addr, rs2_addr, rd_addr, write_data, rs1_data, rs2_data); //using this function you can view outputs on the constraint_mode
        
        reg_write = 1'b1; //write on
        rs1_addr = 5'd12;
        rs2_addr = 5'd20;
        rd_addr = 5'd12;
        write_data = 32'd100;
        
        
        #20                //wait 20 time units
        reg_write = 1'b1;
        rs1_addr = 5'd12;
        rs2_addr = 5'd10;
        rd_addr = 5'd20;
        write_data = 32'd255;
        
        
        #20                //wait 20 time units
        reg_write = 1'b1;
        rs1_addr = 5'd12;
        rs2_addr = 5'd20;
        rd_addr = 5'd15;
        write_data = 32'd2000;
        
    end 

endmodule
