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
    input clk,
    input [63:0] PC_in,   //define proper bus widths
    output reg [63:0] sum
    );
    
    always@(posedge clk)
        begin
        sum<= PC_in + 64'd4; // **check if we need to include overflow failsafes
        end
endmodule
