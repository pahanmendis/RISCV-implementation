`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 12:16:04 AM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input MEM_clk,
    input [1:0] mem_write,
    input [1:0] mem_read,
    input [31:0] data_address,
    input [31:0] write_data,
    output reg [31:0] read_data
    );
    parameter mem_depth = 199; //depth-1
    reg [31:0] data_ram [mem_depth:0];    
    
    initial   //if required to store initial values
        begin
            data_ram[0] = {31'b0}; //AC <- 0 
            data_ram[1] = {31'b0}; //MAR <- AC 
        end    
    
    always@(posedge MEM_clk)                    //output data
        begin
        read_data<=data_ram[data_address];
        end

    always@(posedge MEM_clk)                    //output data
        begin
        if (mem_write==2'b11)      //check logic to write to data mem
            begin
                data_ram[data_address]<=write_data;
                read_data<=31'd0;
            end
        end
    
endmodule
