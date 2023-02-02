`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 11:15:09 AM
// Design Name: 
// Module Name: PC_tb
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


module PC_tb();

//reg clk,


reg clk;
reg reset;

//wire declaration for the specific module

reg [31:0] pc_input;
wire [31:0] pc_output;

//reg [31:0] A;                       //identify input signals
//reg [31:0] B;                       //identify input signals
//reg [4:0] ALU_op;                   //identify the control signals
//wire  z_flag,     p_flag,     n_flag;
//wire [31:0] out; 



//dut instantiation -> look at the input ports and declare reg to give inputs,  declare wires for the output ports
//then give those wires to the input and output ports
//ALU(    input EX_clk,    input [31:0] A,    input [31:0] B,    input [4:0] ALU_op,    output reg z_flag,    output reg p_flag,    output reg n_flag,    output reg [31:0] out    );
program_counter pc_dut(  .WB_clk(clk),  .pc_input (pc_input ),   .pc_output(pc_output));

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
        $monitor("time=%3d, pc_input=%b, pc_output=%b,n",$time, pc_input, pc_output); //using this function you can view outputs on the console
        pc_input =32'd10;            //inital values

        
        
        #20                //wait 20 time units
        pc_input =32'd20;            //inital values
        
        
        #20                //wait 20 time units
        pc_input =32'd30;            //inital values
        

    end    

     

endmodule
