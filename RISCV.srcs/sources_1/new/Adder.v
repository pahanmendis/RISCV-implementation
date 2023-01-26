`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 01:03:53 AM
// Design Name: 
// Module Name: Adder
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


module Adder(
    input clk,
    input [63:0] PC_in,
    input [63:0] shift_in,
    output reg [63:0] sum
    );
    always@(posedge clk)
        begin
        sum<= PC_in + shift_in;   // **check if we need to include overflow failsafes
        end
endmodule
