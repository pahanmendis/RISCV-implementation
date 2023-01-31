`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 01:07:43 AM
// Design Name: 
// Module Name: mux_64
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


module mux_64(
    input [31:0] A, //output value if sel=0
    input [31:0] B, //output value if sel=1
    input sel,
    output reg [31:0] out
    );
    
    always @(*)
    begin
        if (sel==1'b0)
            out<= A;
        else
            out<=B;    
    end
endmodule
