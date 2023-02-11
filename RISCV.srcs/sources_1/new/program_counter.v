`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
The program counter register, triggered by the positive edge of the WB clock of the previous instruction
Function:   Passes the program counter to the instruction memory to begin the next instruction 
Inputs:     32-bit program counter
Outputs:    32-bit program counter
*/
//////////////////////////////////////////////////////////////////////////////////


module program_counter(
    input en,
    input [31:0] pc_input,
    output reg [31:0] pc_output,
    output pc_ready
    );
    
    // set default PC to 0 at the start
    initial
    begin
        pc_output<=32'd0;
    end
    
    always @(posedge en)
        begin
            pc_ready <= 1'b0;
            pc_output <= pc_input;  // passes the PC to the output
            pc_ready <= 1'b1;
        end
endmodule
