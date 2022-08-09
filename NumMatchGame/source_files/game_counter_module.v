`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 11:08:30 AM
// Design Name: 
// Module Name: countUD4L
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


module game_counter_module(
    //input [7:0] x,
    //input w,
    input clk,
    input R,
    input CE,
    output [7:0] Q
    //,output y
    );
    
    wire [5:0] D;
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .R(R), .CE(CE), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .R(R), .CE(CE), .D(D[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .R(R), .CE(CE), .D(D[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .R(R), .CE(CE), .D(D[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .R(R), .CE(CE), .D(D[4]), .Q(Q[4]));
    FDRE #(.INIT(1'b0)) Q5_FF (.C(clk), .R(R), .CE(CE), .D(D[5]), .Q(Q[5]));
    assign D[0] = Q[0] ^ CE;
    assign D[1] = Q[1] ^ (CE&Q[0]);
    assign D[2] = Q[2] ^ (CE&Q[0]&Q[1]);
    assign D[3] = Q[3] ^ (CE&Q[0]&Q[1]&Q[2]);
    assign D[4] = Q[4] ^ (CE&Q[0]&Q[1]&Q[2]&Q[3]);
    assign D[5] = Q[5] ^ (CE&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]);
    assign Q[7] = 1'b0;
    assign Q[6] = 1'b0;
    //assign y = ((x[7:0] & Q[7:0]) | (~x[7:0] & ~Q[7:0]));
endmodule