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
    input [3:0] Opcode,
    output reg z_flag,
    output reg [63:0] out
    );
    
    // define the control signal pattern as parameters
    parameter ADDITION = 5'b00000;          // A+B
    parameter SUBTRACTION = 5'b00001;       // A-B
    parameter L_SHIFT_RIGHT = 5'b00010;     // Right shift A by LSB 5 bits of B
    parameter A_SHIFT_RIGHT = 5'b00011;     // Right shift A by LSB 5 bits OF B -> Keep MSB intact
    parameter L_SHIFT_LEFT = 5'b00100;      // Left shift A by LSB 5 bits of B
    parameter XOR = 5'b00101;               // A XOR B
    parameter AND = 5'b00110;               // A AND B
    parameter OR = 5'b00111;                // A OR B
    parameter CHECK_EQUAL = 5'b01000;       // A == B?  Z = 1 : P = 1, N = 1
    parameter CHECK_LESS_S = 5'b01001;      // A < B? N = 1 : P = 0, N = 0, signed
    parameter CHECK_GREATER_S = 5'b01010;   // A > B? N = 1 : P = 0, N = 0, signed
    parameter SET_LESS = 5'b01011;          // A < B? Out = 1 : Out = 0, signed
    parameter SET_LESS_U = 5'b01100;        // A < B? Out = 1 : Out = 0, signed
    parameter JUMP_LINK = 5'b01101;         // A+B; set LSB to 0
    parameter ADDI = 5'b01110;              // A+B
    parameter CHECK_LESS_U = 5'b01111;      // A < B? N = 1 : P = 0, N = 0, unsigned
    parameter CHECK_GREATER_U = 5'b10000;   // A > B? N = 1 : P = 0, N = 0, unsigned

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
