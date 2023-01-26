`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 12:42:31 AM
// Design Name: 
// Module Name: shift_left
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


module shift_left(
    input clk,
    input [63:0] immediate_data_in,
    output reg [63:0] out   // adjust the output width
    );
    
    always@(posedge clk)
        begin
        //out <= write the logic here  ; 
        end
endmodule
