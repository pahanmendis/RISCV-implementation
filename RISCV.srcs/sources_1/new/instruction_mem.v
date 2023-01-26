`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2023 11:42:34 PM
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(
    input clk,
    input [31:0] read_address,
    output reg [31:0] instruction
    );
    parameter instruction_count = 200;         //set instruction count
    reg [31:0] instruction_rom [instruction_count:0]; //creating memory
    
    //define instructions
    parameter FETCH = 8'd0;
    parameter NOOP = 8'd3;
    parameter LDX1R1 = 8'd9;   
       
    always @(posedge clk)
        begin
         instruction<=instruction_rom[read_address]; 
        end
        
    initial 
        begin
            //inst_ram[0] = instruction  //put instructions 174
                           //{opcode(8bits),immediate_data(24bits)}   should match 24 bits
            instruction_rom[0] = {FETCH,24'b0}; //AC <— 0 
            instruction_rom[1] = {NOOP,24'b0}; //MAR <— AC 
    
        
        
        end
    
endmodule
