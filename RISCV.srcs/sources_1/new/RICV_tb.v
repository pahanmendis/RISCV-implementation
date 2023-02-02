`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 09:55:29 AM
// Design Name: 
// Module Name: RICV_tb
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


module RICV_tb(    );

reg clk;
reg reset;

//wire declaration for the specific module
reg [31:0] A;                       //identify input signals
reg [31:0] B;                       //identify input signals
reg [4:0] ALU_op;                   //identify the control signals
wire  z_flag,     p_flag,     n_flag;
wire [31:0] out; 



//dut instantiation -> look at the input ports and declare reg to give inputs,  declare wires for the output ports
//then give those wires to the input and output ports
//ALU(    input EX_clk,    input [31:0] A,    input [31:0] B,    input [4:0] ALU_op,    output reg z_flag,    output reg p_flag,    output reg n_flag,    output reg [31:0] out    );
ALU ALU_dt(    .EX_clk(clk),    .A(A),    .B(B),    .ALU_op(ALU_op),    .z_flag(z_flag),    .p_flag(p_flag),    .n_flag(n_flag),    .out(out)    );

//clk generation
initial 
    begin
    clk = 1'b0;
    forever #1 clk = ~clk;
    end

//generate reset
initial
    begin
        reset=1'b1;
        #10   //wait for 10 time units
        reset=1'b0;
    end

// giving inputs and testing the module    

initial
    begin
        $monitor("time=%3d, A=%b, B=%b,ALU_op=%b, OUT=%b \n",$time, A, B,ALU_op, out); //using this function you can view outputs on the console
        A=32'd0;            //inital values
        B=32'd0;
        ALU_op=32'd0;
        
        
        #20                //wait 20 time units
        ALU_op=32'd0;       //set to the require operation
        A=32'd1;            //required values
        B=32'd1;
        
        
        #20                //wait 20 time units
        ALU_op=32'd2;       //set to the require operation
        A=32'd5;            //required values
        B=32'd6;
        
        
        

    end    

     

endmodule
