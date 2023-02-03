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
    reg [29:0] line_address;
    reg [1:0] block_address;   
    
    initial   //if required to store initial values
        begin
            data_ram[0] = {32'b00000000000000001000000000000000}; 
            data_ram[1] = {32'b00000000100000000000000000000000}; 
        end 
        
    always@(data_address)
        begin
            line_address<=data_address[31:2];
            block_address<=data_address[1:0];
        end   
    
    always@(posedge MEM_clk)                    //output data
        begin
        if (mem_read==2'b01) // byte
            read_data<={{24{data_ram[line_address][7]}},data_ram[line_address][8*block_address + 7:8*block_address]};
        else if (mem_read==2'b10) // halfword
            read_data<={{16{data_ram[line_address][15]}},data_ram[line_address][16*block_address[1]+15:16*block_address[1]]};
        else if (mem_read==2'b11)
            read_data<=data_ram[line_address];  
        else 
            read_data<=32'b0;          
        end

    always@(posedge MEM_clk)    //output data
        begin
        if (mem_write == 2'b01)      // byte
            case (block_address)
            2'd0:
                data_ram[line_address] <= {data_ram[line_address][31:8], write_data[7:0]};
            2'd1:
                data_ram[line_address] <= {data_ram[line_address][31:16], write_data[7:0], data_ram[line_address][7:0]};
            2'd2:
                data_ram[line_address] <= {data_ram[line_address][31:24], write_data[7:0], data_ram[line_address][15:0]};
            2'd3:
                data_ram[line_address] <= {write_data[7:0], data_ram[line_address][23:0]};
            endcase
            
        else if (mem_write==2'b10)      // half-word
            case (block_address)
            2'd0:
                data_ram[line_address] <= {data_ram[line_address][31:16], write_data[15:0]};
            2'd2:
                data_ram[line_address] <= {write_data[15:0], data_ram[line_address][15:0]};
            endcase
        
        else if (mem_write==2'b11)      // word
            data_ram[line_address]<=write_data;
            
        end
    
endmodule
