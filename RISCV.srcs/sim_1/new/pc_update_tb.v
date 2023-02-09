`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2023 03:14:54 AM
// Design Name: 
// Module Name: pc_update_tb
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


module pc_update_tb( );

    reg MEM_clk;
    reg [31:0] program_counter;
    reg [31:0] immediate_data;
    reg [31:0] c_bus;
    wire [31:0] pc_update_out;
    reg [1:0] branch;
    reg  z_flag;
    reg p_flag;
    reg n_flag;
    
    pc_update pc_dut(.MEM_clk(MEM_clk), .program_counter(program_counter), .immediate_data(immediate_data), .c_bus(c_bus), .pc_update_out(pc_update_out), .branch(branch), .z_flag(z_flag), .p_flag(p_flag), .n_flag(n_flag));
    
    //clk generation
    initial 
    begin
        MEM_clk = 1'b0;
        forever #1 MEM_clk = ~MEM_clk;
    end
    
    initial
    begin
        program_counter <= 32'd1024;
        immediate_data <= 32'd9;
        c_bus <= 32'd100;
        
        #10 branch = 2'b01; z_flag = 0; n_flag = 0; p_flag = 0;
        #10 branch = 2'b10; z_flag = 0; n_flag = 0; p_flag = 0;
        #10 branch = 2'b00; z_flag = 0; n_flag = 0; p_flag = 0;
        
        #20 $finish;
               
    end

endmodule
