`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
The PC update module, triggered by the positive edge of the MEM clock
Functions:  Updates the PC according to various branching instructions
Inputs:     Current program counter 
            Immediate data from instruction 
            ALU output 
            Control signals on how to update the PC, including the flags
Outputs:    The updated PC
*/ 
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
    
    initial
    begin
        pc_update_out <= 32'b0;
    end
    
     always @(posedge MEM_clk)
        begin
            casez ({branch,z_flag, p_flag, n_flag})
            5'b01000:
                pc_update_out <= program_counter + immediate_data;
            5'b10000:
                pc_update_out <= c_bus;
            5'b11100:
                pc_update_out <= program_counter + immediate_data;
            5'b10011:
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
