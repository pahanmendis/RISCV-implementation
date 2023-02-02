`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 03:22:16 PM
// Design Name: 
// Module Name: ins_mem_tb
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


module ins_mem_tb( );

    reg IF_clk;
    reg [31:0] instruction_address;
    wire [31:0] instruction;
    
    instruction_mem ins_mem_dut(.IF_clk(IF_clk), .instruction_address(instruction_address), .instruction(instruction));
    
    //clk generation
    initial 
    begin
        IF_clk = 1'b0;
        forever #1 IF_clk = ~IF_clk;
    end
    
    initial
    begin
        
        
               
    end

endmodule
