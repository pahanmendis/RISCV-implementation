`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 12:29:40 AM
// Design Name: 
// Module Name: immediate_data_gen
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


module immediate_data_gen(
    input ID_clk,
    input [1:0] extend,
    input [2:0] im_slice,
    input [31:0] instruction_in,
    output reg [31:0] imm_data
    );
    
    always @(posedge ID_clk)
        begin
            case ({extend,im_slice})
            5'b10001:
                imm_data<={instruction_in[31:12],12'd0};
            5'b01010:
                imm_data<={{13{instruction_in[31]}},instruction_in[19:12],instruction_in[20],instruction_in[30:21]};
            5'b01011:
                imm_data<={{20{instruction_in[31]}},instruction_in[31:20]};
            5'b10011:
                imm_data<={20'd0,instruction_in[31:20]};
            5'b10100:
                imm_data<={18'd0, instruction_in[31], instruction_in[7], instruction_in[30:25], instruction_in[11:8],2'd0};
            5'b01101:
                imm_data<={{20{instruction_in[31]}}, instruction_in[31:25], instruction_in[ 11:7]};
            5'b00110:
                imm_data<={27'd0, instruction_in[24:20]};
            default:
                imm_data<=32'd0;
            endcase
                
        end
        
endmodule
