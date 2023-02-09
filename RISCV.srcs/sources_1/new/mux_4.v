`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
The 4-input multiplexer module, continuous assignmet
Functions:  Selects one of four input according to two control signals
Inputs:     4 inputs A, B 
            2-bit selection signals
Outputs:    The selected output
*/ 
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
        if (sel==3'd3)
            out<= A;
        else if (sel==3'b1)
            out<= B;
        else if (sel==3'd7)
            out<= C;
        else if (sel == 3'd2)
            out<= D;    
    end
endmodule