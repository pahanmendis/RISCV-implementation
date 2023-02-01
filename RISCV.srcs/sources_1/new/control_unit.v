`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 12:39:44 AM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input ID_clk,
    input [6:0] opcode,
    input [2:0] func3,
    output [2:0] im_slice,
    output [1:0] extend,
    output alu_source,
    output [1:0] branch,
    output [2:0] to_reg,
    output [1:0] mem_read,
    output [1:0] mem_write,
    output reg_write
    );
    
    //write control unit
    parameter  control_signal_length = 15; // 16-1=15
    reg [control_signal_length:0] control_store[1023:0];
    reg [15:0] control_out;
    
    initial 
    begin
    
        control_store[55]  = 16'b0011000001100001;  //LUI
        control_store[23]  = 16'b0011001101000001;  // AUIPC
        control_store[111]  = 16'b0100100101000001; // JAL
        control_store[103]  = 16'b0110101001000001; // JALR
        control_store[99]  = 16'b1001011100000000;  // BEQ
        control_store[227]  = 16'b1001011100000000; // BNE
        control_store[611]  = 16'b1001011100000000; // BLT
        control_store[739]  = 16'b1001011100000000; // BGE
        control_store[867]  = 16'b1001011100000000; // BLTU
        control_store[995]  = 16'b1001011100000000; // BGEU
        control_store[3]  = 16'b0110100011101001;   // LB
        control_store[131]  = 16'b0110100011110001; // LH
        control_store[259]  = 16'b0110100011111001; // LW
        control_store[515]  = 16'b0111000011101001; // LBU
        control_store[643]  = 16'b0111000011110001; // LHU
        control_store[35]  = 16'b1010100000000010;  // SB
        control_store[163]  = 16'b1010100000000100; // SH
        control_store[291]  = 16'b1010100000000110; // SW
        control_store[19]  = 16'b0110100000100001;  // ADDI
        control_store[275]  = 16'b0110100000100001; // SLTI
        control_store[403]  = 16'b0111000000100001; // SLTIU
        control_store[531]  = 16'b0110100000100001; // XORI
        control_store[787]  = 16'b0110100000100001; // ORI
        control_store[915]  = 16'b0110100000100001; // ANDI
        control_store[147]  = 16'b1100000000100001; // SLLI
        control_store[659]  = 16'b1100000000100001; // SRLI, SRAI
        control_store[15]  = 16'b0000010000100001;  // ADD, SUB
        control_store[179]  = 16'b0000010000100001; // SLL
        control_store[307]  = 16'b0000010000100001; // SLT
        control_store[435]  = 16'b0000010000100001; // SLTU
        control_store[563]  = 16'b0000010000100001; // XOR
        control_store[691]  = 16'b0000010000100001; // SRL, SRA
        control_store[819]  = 16'b0000010000100001; // OR
        control_store[947]  = 16'b0000010000100001; // AND
    
    end
    
    always @(*)
    begin
        if (opcode == 7'd55 || opcode == 7'd23 || opcode == 7'd111)
            control_out <= control_store[{3'b0,opcode}];
        else
            control_out <= control_store[{func3,opcode}];
    end
    
    assign im_slice = control_out[15:13];
    assign extend = control_out[12:11];
    assign alu_source = control_out[10];
    assign branch = control_out[9:8];
    assign to_reg = control_out[7:5];
    assign mem_read = control_out[4:3];
    assign mem_write = control_out[2:1];
    assign reg_write = control_out[0];
endmodule
