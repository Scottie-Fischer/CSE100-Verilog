`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 02:44:14 PM
// Design Name: 
// Module Name: countUD16L
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


module countUD16L(
    input [15:0] Din,
    input LD,
    input Up,
    input Dw,
    input clk,
    output [15:0] Q,
    output UTC,
    output DTC
    );
    wire UTC0,UTC1,UTC2,UTC3;
    wire DTC0,DTC1,DTC2,DTC3;
    countUD4L count0(.clk(clk), .LD(LD), .Din(Din[3:0]), .Q(Q[3:0]), .Up(Up), .UTC(UTC0), .Dw(Dw), .DTC(DTC0));
    countUD4L count1(.clk(clk), .LD(LD), .Din(Din[7:4]), .Q(Q[7:4]), .Up((Up & UTC0)), .UTC(UTC1), .Dw(Dw & DTC0), .DTC(DTC1));
    countUD4L count2(.clk(clk), .LD(LD), .Din(Din[11:8]), .Q(Q[11:8]), .Up(Up & UTC0 & UTC1), .UTC(UTC2), .Dw(Dw & DTC0 & DTC1), .DTC(DTC2));
    countUD4L count3(.clk(clk), .LD(LD), .Din(Din[15:12]), .Q(Q[15:12]), .Up(Up& UTC0 & UTC1 & UTC2), .UTC(UTC3), .Dw(Dw & DTC0 & DTC1 & DTC2), .DTC(DTC3));
    
    assign UTC = UTC0 & UTC1 & UTC2 & UTC3;
    assign DTC = DTC0 & DTC1 & DTC2 & DTC3;
endmodule
