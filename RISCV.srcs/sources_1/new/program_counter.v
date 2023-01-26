`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 01:11:52 AM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input clk,
    input [63:0] pc_input,
    output reg [63:0] pc_output
    );
    
    always @(posedge clk)
        begin
        pc_output<=pc_input;  //might have to include additional logic
        end
endmodule

//module ProgamCounter(
//    input clk,
//    input en,
//    input w_en,
//    input complete,
//    input inc,
//    input [27:0] data_in,
//    output reg [7:0] instruction_address //input to instruction register and B bus mux
//    );
//    reg start=1'b0;
    
//    always @(posedge en)
//        start<=1'b1;  //check the logic
    
    
//    always @(posedge clk)
//        begin
//            if (complete==1)
//                begin
//                instruction_address <= instruction_address;
//                end
//            else if (start) 
//                begin
//                    if(w_en==1)
//                        begin
//                            instruction_address <= data_in[7:0];
//                        end
//                     else if (inc==1)
//                         begin
//                            instruction_address <= instruction_address+1;
//                         end
//                     else
//                         begin
//                            instruction_address<=instruction_address;
//                         end
//                 end   
//        end  
//endmodule