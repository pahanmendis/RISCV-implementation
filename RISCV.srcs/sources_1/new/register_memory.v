`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2023 11:56:01 PM
// Design Name: 
// Module Name: register_memory
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


module register_memory(
    input clk,
    input reg_write,
    input [5:0] read_reg1_addr,
    input [5:0] read_reg2_addr,
    input [5:0] write_reg_addr,
    input [63:0] write_data,
    output reg [63:0] reg1_out,
    output reg [63:0] reg2_out
    );
    
    parameter reg_count = 31; //n-1
    reg [63:0] reg_ram [reg_count:0];
    
    always @(posedge clk)    //output reg data to port 1 and port 2
        begin
            reg1_out<=reg_ram[read_reg1_addr];
            reg2_out<=reg_ram[read_reg2_addr];  
        end
    
    always @(posedge clk)
        begin
            if(reg_write==1'b1)     //writing to destination reg ***check the logic is 1 or 0 to write
                begin
                    reg_ram[write_reg_addr] <=write_data;
                end
        end
endmodule
