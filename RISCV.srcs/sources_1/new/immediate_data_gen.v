`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 12:29:40 AM
// Design Name: 
// Module Name: immediate_data_gen
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


module immediate_data_gen(
    input ID_clk,
    input [1:0] extend,
    input [2:0] im_slice,
    input [31:0] instruction_in,
    output reg [31:0] imm_data
    );
    
    always @(posedge ID_clk)
        begin
            imm_data<= instruction_in; //set the proper bit pattern
        end
        
endmodule
