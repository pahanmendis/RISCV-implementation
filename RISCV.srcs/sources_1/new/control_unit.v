`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 12:39:44 AM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input ID_clk,
    input [6:0] func7,
    input [2:0] func3,
    output [2:0] im_slice,
    output [1:0] extend,
    output alu_source,
    output [1:0] branch,
    output [2:0] to_reg,
    output [1:0] mem_read,
    output [1:0] mem_write,
    output reg_write
    );
    
    //write control unit
    parameter  control_signal_length=15; //36-1=35
    reg [control_signal_length:0] control_store[1023:0];
    reg [15:0] control_out;
        
    
    initial 
    begin
    
        control_store[0]  = 16'b0011000001100001;  //LUI
        control_store[1]  = 16'b0011000001100001;  //insert control signals
    
    end
    
    always @(*)
        begin
        control_out<=control_store[{func3,func7}];
        end

    
    assign im_slice = control_out[15:13];
    assign extend = control_out[12:11];
    assign alu_source = control_out[10];
    assign branch = control_out[9:8];
    assign to_reg = control_out[7:5];
    assign mem_read = control_out[4:3];
    assign mem_write = control_out[2:1];
    assign reg_write = control_out[0];
endmodule
