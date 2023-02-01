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
    input EX_clk,
    input [31:0] A,
    input [31:0] B,
    input [4:0] ALU_op,
    output reg z_flag,
    output reg p_flag,
    output reg n_flag,
    output reg [31:0] out
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
    
    reg [31:0] temp;
    
    initial 
        begin
            out = 24'b0;
            z_flag = 1'b0;
            p_flag = 1'b0;
            n_flag = 1'b0;
        end
    
    // writing ALU functions
    always @(posedge EX_clk) 
    begin
        case(ALU_op)
        ADDITION:
            out <= A + B;
            
        SUBTRACTION:
            begin
            out <= A - B;
            if (out == 32'b0)
                z_flag = 1'b1;
            else
                z_flag = 1'b0;
            end
            
        L_SHIFT_RIGHT:
            out <= A >> B[4:0];
            
        A_SHIFT_RIGHT:
            begin
            temp <= A >> B[4:0];
            out <= {A[31], temp[30:0]};
            end
            
        L_SHIFT_LEFT:
            out <= A << B[4:0];
            
        XOR:
            out <= A ^ B;
            
        AND:
            out <= A & B;
        OR:
            out <= A | B; 
              
        CHECK_EQUAL:
            begin
            if (A == B)
                begin
                z_flag = 1'b1;
                p_flag = 1'b0;
                n_flag = 1'b0;
                end
            else
                begin
                z_flag = 1'b0;
                p_flag = 1'b1;
                n_flag = 1'b1;
                end
            end
            
        CHECK_LESS_S:
            begin
            if (A < B)
                begin
                z_flag = 1'b0;
                p_flag = 1'b0;
                n_flag = 1'b1;
                end
            else
                begin
                z_flag = 1'b1;
                p_flag = 1'b1;
                n_flag = 1'b0;
                end
            end
            
        CHECK_GREATER_S:
            begin
            if (A > B)
                begin
                z_flag = 1'b0;
                p_flag = 1'b1;
                n_flag = 1'b0;
                end
            else
                begin
                z_flag = 1'b1;
                p_flag = 1'b0;
                n_flag = 1'b1;
                end
            end
            
        SET_LESS:
            begin
            temp <= A - B;
            if (temp < 32'b0)
                out <= 1;
            else
                out <= 0;
            end
        
        ////////// check the unsigned functions//////////   
        SET_LESS_U:
            begin
            if (A < B)
                out <= 1;
            else
                out <= 0;
            end
            
        JUMP_LINK:
            out <= {A[31:1]+B[31:1], 1'b0};
            
        ADDI:
            out <= A + B;
            
        ////////// check the unsigned functions//////////
        CHECK_LESS_U:
            begin
            if (A < B)
                begin
                z_flag = 1'b0;
                p_flag = 1'b0;
                n_flag = 1'b1;
                end
            else
                begin
                z_flag = 1'b1;
                p_flag = 1'b1;
                n_flag = 1'b0;
                end
            end
            
        ////////// check the unsigned functions//////////
        CHECK_GREATER_U:
            begin
            if (A > B)
                begin
                z_flag = 1'b0;
                p_flag = 1'b1;
                n_flag = 1'b0;
                end
            else
                begin
                z_flag = 1'b1;
                p_flag = 1'b0;
                n_flag = 1'b1;
                end
            end
            
        default:
            out <= 32'b0;
            
        endcase       
    end    

endmodule
