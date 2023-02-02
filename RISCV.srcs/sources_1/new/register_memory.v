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
    input ID_clk,
    input WB_clk,
    input reg_write,
    input [4:0] rs1_addr,
    input [4:0] rs2_addr,
    input [4:0] rd_addr,
    input [31:0] write_data,
    output reg [31:0] rs1_data,
    output reg [31:0] rs2_data
    );
    
    parameter reg_count = 31; // n-1
    reg [31:0] reg_ram [reg_count:0];
    
    always @(posedge ID_clk)    //output reg data to port 1 and port 2
        begin
            rs1_data<=reg_ram[rs1_addr];
            rs2_data<=reg_ram[rs2_addr];  
        end
    
    always @(posedge WB_clk)
        begin
            if(reg_write==1'b1)     //writing to destination reg ***check the logic is 1 or 0 to write
                begin
                    reg_ram[rd_addr] <= write_data;
                end
        end
endmodule
