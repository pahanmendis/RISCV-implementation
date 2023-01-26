`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 12:47:23 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input clk,
    input [63:0] A,
    input [63:0] B,
    input [3:0] ALU_control,
    output reg z_flag,
    output reg [63:0] out
    );
    
    //define the control signal pattern as parameters
    parameter ADD = 4'b0001;
    parameter LSHIFT1 = 4'b0010;
    parameter RSHIFT1 = 4'b0011;
    parameter LSHIFT8 = 4'b0100;
    parameter DEAC = 4'b0101;
    parameter RESET = 4'b0110;
    parameter PASS_B = 4'b0111;
    parameter PASS_A = 4'b1000;
    parameter SUB = 4'b1001;
    parameter INCAC = 4'b1011;

    //events performed at positive edge
    
    initial 
        begin
            out = 24'b0;
            z_flag = 1'b0;
        end
    
    //writing ALU functions
    always @(posedge clk) 
    begin
        case(ALU_control)
        ADD:
            out<=A+B;
        SUB:
            begin
            out<=A-B;
            if (out==28'b0)
                z_flag = 1'b1;
            else
                z_flag = 1'b0;
             end
        PASS_A:
            out<=A;
        PASS_B:
            out<=B;
        INCAC:
            out<=A+1;
        DEAC:
            out<=A-1;
        LSHIFT1:
            out<=A<<1;
        LSHIFT8:
            out<=A<<8;   
        RSHIFT1:
            out<=A>>1;
        RESET:
            out<=24'b0;
        default:
            out<=24'b0;
            
            
        endcase       
    end    

endmodule
