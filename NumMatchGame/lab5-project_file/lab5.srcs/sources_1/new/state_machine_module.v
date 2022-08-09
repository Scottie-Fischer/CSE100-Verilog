`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 11:29:04 AM
// Design Name: 
// Module Name: state_machine_module
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


module state_machine_module(
    input btnC,
    input btnU,
    input clk,
    input FourSec,
    input TwoSec,
    input Match,
    
    output showNum,
    output ResetTimer,
    output RunGame,
    output Scored,
    output FlashBoth,
    output FlashAlt,
    output Play,
    output [4:0] State
    );
    
    wire [4:0] D;
    wire [4:0] Q;
    assign D[0] = (~btnC & Q[0]) | (FourSec & (Q[3] | Q[4]));           //Start State
    assign D[1] = (btnC & Q[0]) | (~TwoSec & Q[1]);                     //Play State
    assign D[2] = (TwoSec & Q[1]) | (~btnU & Q[2]) | (Q[2] & btnC);                     //RunGame State
    assign D[3] = (btnU & Match) | (~FourSec & Q[3]);            //Win State
    assign D[4] = (btnU & ~Match) | (~FourSec & Q[4]);           //Lose State
    
    
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(D[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(1'b1), .D(D[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(1'b1), .D(D[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .CE(1'b1), .D(D[4]), .Q(Q[4]));
    assign State[4:0] = Q[4:0];
    assign showNum      = (Q[0]&btnC) | Q[1] | Q[2] | Q[3] | Q[4];       //Shitfing the Number
    assign ResetTimer   = Q[0] & btnC;
    assign RunGame      = Q[2];
    assign Scored       = Match & btnU & Q[2];
    assign FlashBoth    = Q[3] & Match;
    assign FlashAlt     = Q[4] & ~Match;  
    assign Play         = Q[0] & btnC;
endmodule
