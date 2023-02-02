`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 12:15:51 PM
// Design Name: 
// Module Name: cu_tb
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


module cu_tb();

    reg ID_clk;
    reg [6:0] opcode;
    reg [2:0] func3;
    wire [2:0] im_slice;
    wire [1:0] extend;
    wire alu_source;
    wire [1:0] branch;
    wire [1:0] to_reg;
    wire [1:0] mem_read;
    wire [1:0] mem_write;
    wire reg_write;
    
    control_unit CU_dt(.ID_clk(ID_clk), .opcode(opcode), .func3(func3), .im_slice(im_slice), .extend(extend), .alu_source(alu_source), .branch(branch), .to_reg(to_reg), .mem_read(mem_read), .mem_write(mem_write), .reg_write(reg_write));
    
    //clk generation
    initial 
    begin
        ID_clk = 1'b0;
        forever #1 ID_clk = ~ID_clk;
    end
    
    initial
    begin
//        $monitor("time=%3d, opcode=%b, func3=%b \n",$time, instruction, ALU_op); //using this function you can view outputs on the console
        
        #10 opcode = 7'b1100011; //BEQ
            func3 = 3'b000;
            
        #10 opcode = 7'b0010011; //BEQ
            func3 = 3'b000;
        
        #20 $finish;

    end    

endmodule
