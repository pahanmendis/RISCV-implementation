`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2023 01:01:12 AM
// Design Name: 
// Module Name: state_machine
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


module state_machine(
    input clk,
    input ins_ready,
    input control_unit_ready,
    input immediate_gen_ready,
    input alu_ready,
    input data_read_ready,
    input data_write_data,
    input pc_update_ready,
    output IF_clk,
    output ID_clk
    );
endmodule
