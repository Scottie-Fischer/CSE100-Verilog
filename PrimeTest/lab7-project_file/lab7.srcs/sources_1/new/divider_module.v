`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 08:19:03 PM
// Design Name: 
// Module Name: divider_module
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


module divider_module(
    input [15:0] A,
    input [15:0] B,
    input clk,
    input reset,
    input btn,
    
    output [15:0] Q,
    output [15:0] R,
    output finished,
    //testing outputs
    output D0,
    output D1,
    output D2,
    output REEEEE,          
    output timeUp,
    output [7:0] timer,
    output first_loadO,
    output LOADMORE,
    output [15:0] RO,
    output [15:0] AO
    
//    output [15:0] SO,
//    output LTO
    );  
    
    wire [15:0]sub_out;
    wire LT;
    wire GR;
    wire EQ;
    wire [15:0] A_out;
    wire [15:0] R_out;
    wire RESET;
    wire timesUp;
    wire loadmore;
    wire first_shift;
    assign first_loadO = first_shift;
    assign timeUp = timesUp;    //testing purposes
    assign REEEEE = RESET;
    assign AO = A_out;
    assign RO = R_out;
    
    wire last_shift;
    assign LOADMORE = last_shift;
    
    divider_statemachine d_s(.timer(timer),.D4(D0),.D5(D1), .D6(D2), .clk(clk), .btn(btn), .reset(RESET),.first_shift(first_shift),.last_shift(last_shift), .loadmore(loadmore), .timeUp(timesUp),.finished(finished));
    
    LSR_module Reg_A(.clk(clk), .D(A[15:0]), .LD(RESET), .R(reset), .SHL(~timesUp|first_shift), .SHin(1'b0), .q(A_out[15:0]));
    
    LSR_module Reg_R(.clk(clk), .D(sub_out[15:0]), .LD( (~sub_out[15]) & (~timesUp|loadmore)), .R(reset|(D0 & btn)), .SHL((first_shift|(RESET)) | (~timesUp & ~last_shift & D2)), .SHin(A_out[15] | (RESET & A[15])), .q(R_out[15:0]));
    
    LSR_module Reg_Q(.clk(clk), .D(16'd0), .LD(1'b0), .R(reset|RESET), .SHL((~timesUp & D2 & ~first_shift)), .SHin(~sub_out[15]), .q(Q[15:0]));
    
    comparator_module compare(.A(R_out[15:0]), .B(B[15:0]), .LT(LT), .GR(GR), .EQ(EQ));
    subtractor_module subtract(.A(R_out[15:0]), .B(B[15:0]), .C_in(1'b1), .D(sub_out[15:0]));
    
    assign R[15:0] = R_out[15:0]; //& time_counter;
endmodule
