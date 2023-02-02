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
    input [31:0] program_counter,
    input [31:0] immediate_data,
    input [31:0] c_bus,
    output [31:0] pc_update_out,
    input [1:0] branch,
    input  z_flag,
    input p_flag,
    input n_flag
    );
endmodule
