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
    
        casez ({instruction[30], instruction[14:12], instruction [6:0]})
        
        11'b00000110011:
            ALU_op <= 5'b00000;
        11'b10000110011:
            ALU_op <= 5'b00001;
        11'b01010?10011:
            ALU_op <= 5'b00010;
        11'b11010?10011:
            ALU_op <= 5'b00011;
        11'b00010?10011:
            ALU_op <= 5'b00100;
        11'b?1000?10011:
            ALU_op <= 5'b00101;
        11'b?1110?10011:
            ALU_op <= 5'b00110;
        11'b?1100?10011:
            ALU_op <= 5'b00111;
        11'b?0001100011:
            ALU_op <= 5'b01000;
        11'b?1001100011:
            ALU_op <= 5'b01001;
        11'b?1011100011:
            ALU_op <= 5'b01010;
        11'b?0100010011:
            ALU_op <= 5'b01011;
        11'b?0110010011:
            ALU_op <= 5'b01100;
        11'b?0001100111:
            ALU_op <= 5'b01101;
        11'b?0000010011:
            ALU_op <= 5'b01110;
        11'b?1101100011:
            ALU_op <= 5'b01111;
        11'b?1111100011:
            ALU_op <= 5'b10000;
            
        default:
            ALU_op <= 5'b11111;
            
        endcase
    end
endmodule
