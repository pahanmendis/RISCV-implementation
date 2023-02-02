`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2023 08:54:05 PM
// Design Name: 
// Module Name: mux_4
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


module mux_4(
    input [31:0] A, //output value if sel=0
    input [31:0] B, //output value if sel=1
    input [31:0] C, //output value if sel=
    input [31:0] D, //output value if sel=1
    input [2:0] sel,
    output reg [31:0] out
    );
    
    always @(*)
    begin
        if (sel==2'b0)
            out<= A;
        else if (sel==2'b01)
            out<= B;
        else if (sel==2'b10)
            out<= C;
        else
            out<= D;    
    end
endmodule