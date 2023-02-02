`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 09:18:40 AM
// Design Name: 
// Module Name: pc_update
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


module pc_update(
    input MEM_clk,
    input [31:0] program_counter,
    input [31:0] immediate_data,
    input [31:0] c_bus,
    output reg [31:0] pc_update_out,
    input [1:0] branch,
    input  z_flag,
    input p_flag,
    input n_flag
    );
    
     always @(posedge MEM_clk)
        begin
            casez ({branch,z_flag, p_flag, n_flag})
            5'b01000:
                pc_update_out <= program_counter + immediate_data;
            5'b10000:
                pc_update_out <= program_counter + c_bus;
            5'b11100:
                pc_update_out <= program_counter + immediate_data;
            5'b11011:
                pc_update_out <= program_counter + immediate_data;
            5'b11001:
                pc_update_out <= program_counter + immediate_data;
            5'b11010:
                pc_update_out <= program_counter + immediate_data;
            5'b11000:
                pc_update_out <= program_counter + immediate_data;
                
            default:
                pc_update_out <= program_counter + 32'd4;
            endcase
                
        end
    
endmodule
