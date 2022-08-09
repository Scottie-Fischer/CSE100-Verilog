`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 08:05:37 PM
// Design Name: 
// Module Name: testbench_comparator
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


module testbench_comparator();
    reg [15:0] A;
    reg [15:0] B;
    wire LT;     
    wire EQ;     
    wire GR; 
    

    comparator_module comp(
    .A(A),
    .B(B),
    .LT(LT),
    .EQ(EQ),
    .GR(GR)
    );
    
    initial
    begin
    A = 16'b0000000000000000;
    B = 16'b0000000000000000;
    #100;
    A = 16'b0000000000000001;
    B = 16'b0000000000000000;
    #100;
    A = 16'b0000000100000100;
    B = 16'b0001000000001000;
    #100;
    A = 16'h0008;
    B = 16'h0008;
    #100;
    A = 16'h0006;
    B = 16'h0005;
    end
endmodule
