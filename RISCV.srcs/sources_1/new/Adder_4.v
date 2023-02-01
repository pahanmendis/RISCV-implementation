`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 01:00:33 AM
// Design Name: 
// Module Name: Adder_4
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


module Adder_4(
    input MEM_clk,
    input [31:0] PC_in,   // define proper bus widths
    input [1:0] branch,
    output reg [31:0] sum
    );
    
    always@(posedge MEM_clk)
        begin
        if (branch == 2'b01 || branch == 2'b10)
            sum <= PC_in + 32'd4; // **check if we need to include overflow failsafes
        else
            sum <= PC_in;
        end
endmodule
