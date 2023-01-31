`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 12:54:28 AM
// Design Name: 
// Module Name: ALU_control_gen
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


module ALU_control_gen(
    input [31:0] instruction,
    output reg [4:0] ALU_op
    );
    
    always @(*)
    begin
    
    case ({instruction[30], instruction[14:12], instruction [6:0]})
    
    11'b00000110011:
        ALU_op<=5'b00000;
    11'b10000110011:
        ALU_op<=5'b00001;
    
    //add remaining logic from spreadsheet
        
    endcase
    end
endmodule
