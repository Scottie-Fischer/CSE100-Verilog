`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 04:08:46 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input btnL,
    input btnR,
    input btnU,
    input clkin,
    
    output [6:0] seg,
    output [3:0] an,
    output LED15,
    output LED9,
    output dp
    );
    assign dp = 1'b1;
    assign LED15 = ~btnL;
    assign LED9 = ~btnR;
    wire clk,digsel,qsec;
    wire Up,Down,ResetTimer;
    wire [7:0] turkeyCount;
    wire [7:0] timeCount;
    wire [3:0] ringCount;
    wire [15:0] selIn;
    wire [3:0] selOut;
    wire [6:0] mux;
    wire [7:0] invOut;
    lab6_clks slowit (.clkin(clkin), .greset(btnU), .clk(clk), .digsel(digsel), .qsec(qsec));
    statemachine_module fsm(.clk(clk), .btnL(btnL), .btnR(btnR), .Up(Up),.Down(Down),.ResetTimer(ResetTimer));
    
    turkeyCounter_module turkeyC(.clk(clk), .Up(Up), .Down(Down), .Q(turkeyCount[7:0]));
    time_counter_module timeC(.clk(clk), .R(ResetTimer), .CE(qsec), .Q(timeCount[7:0]));
    
    neg_inverter_module neg(.in(turkeyCount[7:0]), .invOut(invOut[7:0]));
    assign selIn[6:0] = invOut[6:0];
    assign selIn[7] = 1'b1;
    assign selIn[11:8] = 4'b0000;
    assign selIn[15:12] = timeCount[3:0]; 
    ring_counter_module ringC(.clk(clk), .Advance(digsel), .Q(ringCount[3:0]));
    selector selec(.sel(ringCount[3:0]), .N(selIn[15:0]), .H(selOut[3:0]));
    hex7seg hex(.n(selOut[3:0]), .seg(mux[6:0]));
    
    assign seg[0] = (mux[0] & ~ringCount[2]) | (ringCount[2] & 1'b1);
    assign seg[1] = (mux[1] & ~ringCount[2]) | (ringCount[2] & 1'b1);
    assign seg[2] = (mux[2] & ~ringCount[2]) | (ringCount[2] & 1'b1);
    assign seg[3] = (mux[3] & ~ringCount[2]) | (ringCount[2] & 1'b1);
    assign seg[4] = (mux[4] & ~ringCount[2]) | (ringCount[2] & 1'b1);
    assign seg[5] = (mux[5] & ~ringCount[2]) | (ringCount[2] & 1'b1);
    assign seg[6] = (mux[6] & ~ringCount[2]) | (ringCount[2] & 1'b0);
    
    assign an[0] = ~(ringCount[0] & ~ringCount[1]  & ~ringCount[2] & ~ringCount[3] );
    assign an[1] = ~(~ringCount[0] & ringCount[1]  & ~ringCount[2] & ~ringCount[3] );
    assign an[2] = ~(~ringCount[0] & ~ringCount[1] & ringCount[2] & ~ringCount[3] & turkeyCount[7]);
    assign an[3] = ~(~ringCount[0] & ~ringCount[1] & ~ringCount[2] & ringCount[3] & ~ResetTimer);
endmodule
