`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
The adder of 4 units module, triggered by the positive edge of the MEM clock
Functions:  A adder of 4 units where needed
Inputs:     The current program counter 
            The branching control signal 
Outputs:    The updated PC, 4 added for only the instructions needed
*/ 
//////////////////////////////////////////////////////////////////////////////////


module Adder_4(
    input MEM_clk,
    input [31:0] pc_in,   
    input [1:0] branch,
    output reg [31:0] pc_add_4
    );
    
    always@(*)
        begin
        if (/*branch == 2'b01 ||8*/ branch == 2'b10)
            pc_add_4 <= pc_in + 32'd4; 
        else
            pc_add_4 <= pc_in;
        end
endmodule
