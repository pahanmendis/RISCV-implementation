`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 12:48:34 PM
// Design Name: 
// Module Name: imm_gen_tb
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


module imm_gen_tb( );
    reg ID_clk;
    reg [1:0] extend;
    reg [2:0] im_slice;
    reg [31:0] instruction_in;
    wire [31:0] imm_data;

    immediate_data_gen imm_gen_dt(.ID_clk(ID_clk), .extend(extend), .im_slice(im_slice), .instruction_in(instruction_in), .imm_data(imm_data));
    
    //clk generation
    initial 
    begin
        ID_clk = 1'b0;
        forever #1 ID_clk = ~ID_clk;
    end
    
    initial
    begin
        $monitor("time=%3d, extend=%b, im_slice=%b, instruction_in=%b, immediate=%b \n",$time, extend, im_slice, instruction_in, imm_data); //using this function you can view outputs on the console
        
        #10 instruction_in = 32'b10011001010100101_000_00000_1100011; //BEQ
        
        #10 extend = 2'b0; im_slice = 3'b0;
        #10 extend = 2'd2; im_slice = 3'd1;
        #10 extend = 2'b1; im_slice = 3'd2;
        #10 extend = 2'b1; im_slice = 3'd3;
        #10 extend = 2'd2; im_slice = 3'd3;
        #10 extend = 2'd2; im_slice = 3'd4;
        #10 extend = 2'd1; im_slice = 3'd5;
        #10 extend = 2'b0; im_slice = 3'd6;
        
        #20 $finish;

    end  

endmodule
