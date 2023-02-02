`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 11:40:55 AM
// Design Name: 
// Module Name: ALU_control_tb
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


module ALU_control_tb( );
    reg [31:0] instruction;
    wire [4:0] ALU_op;
    
    ALU_control_gen ALU_control_dut(.instruction(instruction), .ALU_op(ALU_op));
    
    initial
    begin
        $monitor("time=%3d, instruction=%b, opcode=%b \n",$time, instruction, ALU_op); //using this function you can view outputs on the console
        
        #10 instruction = 32'b10011001010100101_000_00000_1100011; //BEQ
        
        #10 instruction = 32'b10011001010100101_000_00000_0110011; //ADD
        #10 instruction = 32'b11011001010100101_000_00000_0110011; //SUB
        
        #10 instruction = 32'b10011001010100101_101_00000_0110011; //SRA
        #10 instruction = 32'b10011001010100101_101_00000_0010011; //SRLI
        #10 instruction = 32'b11011001010100101_101_00000_0110011; //SRAI
        #10 instruction = 32'b10011001010100101_001_00000_0010011; //SLLI
        
        #10 instruction = 32'b10011001010100101_111_00000_0110011; //AND
        #10 instruction = 32'b11011001010100101_111_00000_0110011; //AND
        
        #10 instruction = 32'b10011001010100101_010_00000_0010011; //SLTI

    end    
    
endmodule
