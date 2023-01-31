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
        if (mem_read==2'b01)
            read_data<={24'd0,data_ram[data_address][7:0]};
        else if (mem_read==2'b10)
            read_data<={16'd0,data_ram[data_address][15:0]};
        else if (mem_read==2'b11)
            read_data<=data_ram[data_address];  
        else 
            read_data<=read_data;          
        end

    always@(posedge MEM_clk)                    //output data
        begin
        if (mem_write==2'b01)      //check logic to write to data mem
                data_ram[data_address]<={24'd0,write_data[7:0]};
        else if (mem_write==2'b10)      //check logic to write to data mem
                data_ram[data_address]<={16'd0,write_data[15:0]};
        else if (mem_write==2'b11)      //check logic to write to data mem
                data_ram[data_address]<=write_data;
        end
    
endmodule
