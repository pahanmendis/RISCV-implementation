`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
The register memory module, triggered by the positive edge of the ID clock and WB clock at two point within an instruction
Functions:  Reads the operands from the register file and send tjem out to the ALU 
            Writes one of the the outputs of the ALU, data from memory or the program counter to the register file
Inputs:     5-bit source operand register numbers 
            5-bit destination register number 
            32-bit data to write to the register file
            Control bit for reg-write
Outputs:    The data from the register file, sent to the next stage, the ALU
*/ 
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
    
    parameter reg_count = 31; // number of registers - 1
    reg [31:0] reg_ram [reg_count:0]; // creating memory
    
    // initialize the value in the first register as zero
    initial 
    begin
        reg_ram[0] = 32'b0;
    end
    
    // output reg data to the output buses to send to the ALU
    always @(posedge ID_clk)    
        begin
            rs1_data<=reg_ram[rs1_addr];
            rs2_data<=reg_ram[rs2_addr];  
        end
    
    // write the data to the destination register
    always @(posedge WB_clk)
        begin
            if(reg_write==1'b1)    
                begin
                    reg_ram[rd_addr] <= write_data;
                end
        end
endmodule
