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
        forever #100 IF_clk = ~IF_clk;
        end
        
    initial 
        begin
        ID_clk = 1'b0;
        #25
        forever #100 ID_clk = ~ID_clk;
        end
        
    initial 
        begin
        EX_clk = 1'b0;
        #50
        forever #100 EX_clk = ~EX_clk;
        end
        
    initial 
        begin
        MEM_clk = 1'b0;
        #75
        forever #100 MEM_clk = ~MEM_clk;
        end   
        
    initial 
        begin
        WB_clk = 1'b0;
        #100
        forever #100 WB_clk = ~WB_clk;
        end

endmodule
