`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 03:14:11 PM
// Design Name: 
// Module Name: mux4_tb
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


module mux4_tb( );

    reg [31:0] A; //output value if sel=0
    reg [31:0] B; //output value if sel=1
    reg [31:0] C; //output value if sel=
    reg [31:0] D; //output value if sel=1
    reg [1:0] sel;
    wire [31:0] out;
    
    mux_4 mux4_dut(.A(A), .B(B), .C(C), .D(D), .sel(sel), .out(out));
    
    initial
    begin
        A = 32'd56;
        B = 32'd100;
        C = 32'd895;
        D = 32'd754;
        
        #10 sel = 2'b0;
        #10 sel = 2'd1;
        #10 sel = 2'd2;
        #10 sel = 2'd3;
        
        #20 $finish;
        
    end
    
endmodule
