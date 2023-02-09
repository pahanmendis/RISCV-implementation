`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
The program counter register, triggered by the positive edge of the WB clock of the previous instruction
Function:   Passes the program counter to the instruction memory to begin the next instruction 
Inputs:     32-bit program counter
Outputs:    32-bit program counter
*/
//////////////////////////////////////////////////////////////////////////////////


module program_counter(
    input WB_clk,
    input [31:0] pc_input,
    output reg [31:0] pc_output
    );
    
    // set default PC to 0 at the start
    initial
    begin
        pc_output<=32'd0;
    end
    
    always @(posedge WB_clk)
        begin
        pc_output <= pc_input;  // passes the PC to the output
        end
endmodule
