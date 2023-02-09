`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
The 2-input multiplexer module, continuous assignmet
Functions:  Selects one of two input according to a control signal
Inputs:     2 inputs A, B 
            selection bit
Outputs:    The selected output
*/ 
//////////////////////////////////////////////////////////////////////////////////


module mux_2(
    input [31:0] A, // output value if sel = 1
    input [31:0] B, // output value if sel = 0
    input sel,
    output reg [31:0] out
    );
    
    always @(*)
    begin
        if (sel == 1'b1)
            out <= A;
        else
            out <= B;    
    end
endmodule