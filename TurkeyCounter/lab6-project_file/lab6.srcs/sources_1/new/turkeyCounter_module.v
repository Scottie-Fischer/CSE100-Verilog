`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 02:49:51 PM
// Design Name: 
// Module Name: turkeyCounter_module
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


module turkeyCounter_module(
    input clk,
    input Up,
    input Down,
    
    output [7:0] Q
);
    wire UTC1,DTC1;
    count4bit count1(.clk(clk), .Up(Up), .Dw(Down), .Q(Q[3:0]), .DTC(DTC1), .UTC(UTC1));
    count4bit count2(.clk(clk), .Up(Up & UTC1), .Dw(Down & DTC1), .Q(Q[7:4]));
    
endmodule
