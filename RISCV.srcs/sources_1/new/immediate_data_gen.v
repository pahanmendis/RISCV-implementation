`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
The immediate generation module, triggered by the positive edge of the ID clock
Functions:  Reads the instruction and identifies what format of immediate extension should happen and perform it 
            Can extend with sign or zero
Inputs:     32-bit immediate_data_gen
            Control bits to indicate the fields to slice and mode of extension(sign or zero)
Outputs:    The extended immediate
*/ 
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
                imm_data<={18'd0, instruction_in[31], instruction_in[7], instruction_in[30:25], instruction_in[11:8], 2'd0};
            5'b01101:
                imm_data<={{20{instruction_in[31]}}, instruction_in[31:25], instruction_in[ 11:7]};
            5'b00110:
                imm_data<={27'd0, instruction_in[24:20]};
            default:
                imm_data<=32'd0;
            endcase
                
        end
        
endmodule
