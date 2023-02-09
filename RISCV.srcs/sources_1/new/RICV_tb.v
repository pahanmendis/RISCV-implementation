`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 09:55:29 AM
// Design Name: 
// Module Name: RICV_tb
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


module RICV_tb(    );
    reg IF_clk;
    reg ID_clk;
    reg EX_clk;
    reg MEM_clk;
    reg WB_clk;

    RISCV_top dut (.IF_clk(IF_clk), .ID_clk(ID_clk), .EX_clk(EX_clk), .MEM_clk(MEM_clk), .WB_clk(WB_clk));

    //clk generation
    initial 
        begin
        IF_clk = 1'b0;
        forever #10 IF_clk = ~IF_clk;
        end
        
    initial 
        begin
        ID_clk = 1'b0;
        #4
        forever #10 ID_clk = ~ID_clk;
        end
        
    initial 
        begin
        EX_clk = 1'b0;
        #8
        forever #10 EX_clk = ~EX_clk;
        end
        
    initial 
        begin
        MEM_clk = 1'b0;
        #12
        forever #10 MEM_clk = ~MEM_clk;
        end   
        
    initial 
        begin
        WB_clk = 1'b0;
        #16
        forever #10 WB_clk = ~WB_clk;
        end

endmodule
