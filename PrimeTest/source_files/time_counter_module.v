`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 03:36:02 PM
// Design Name: 
// Module Name: time_counter_module
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


module time_counter_module(
    input clk,
    input R,
    input CE,       //this is set as qsec
    output [7:0] Q, 
    output utc,
    output utcF,
    output last
    );
    wire [7:0] D;
    wire [7:0] out;
    wire ce = CE & ~(~Q[0] & ~Q[1] & ~Q[2] & ~Q[3] & Q[4]); //stops timer at 010000 or hex: 0010 or dec: 16
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .R(R), .CE(ce), .D(D[0]), .Q(out[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .R(R), .CE(ce), .D(D[1]), .Q(out[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .R(R), .CE(ce), .D(D[2]), .Q(out[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .R(R), .CE(ce), .D(D[3]), .Q(out[3]));
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .R(R), .CE(ce), .D(D[4]),  .Q(out[4]));
    //FDRE #(.INIT(1'b0)) Q5_FF (.C(clk), .R(R), .CE(ce), .D(D[5]), .Q(out[5]));
    //FDRE #(.INIT(1'b0)) Q6_FF (.C(clk), .R(R), .CE(ce), .D(D[6]), .Q(out[6]));
    //FDRE #(.INIT(1'b0)) Q7_FF (.C(clk), .R(R), .CE(ce), .D(D[7]), .Q(out[7]));
    assign D[0] = out[0] ^ CE;
    assign D[1] = out[1] ^ (CE&out[0]);
    assign D[2] = out[2] ^ (CE&out[0]&out[1]);
    assign D[3] = out[3] ^ (CE&out[0]&out[1]&out[2]);
    assign D[4] = out[4] ^ (CE&out[0]&out[1]&out[2]&out[3]);
   
    assign Q[4:0] = out[4:0]; 
    //assign Q[4] = utcF;
    assign Q[7:5] = 3'b000;
    assign utc = (~Q[0] & ~Q[1] & ~Q[2] & ~Q[3] & Q[4]); //outputs at 010000 or hex: 0010 or dec: 16
    assign utcF = utc;
    assign last = (Q[0] & Q[1] & Q[2] & Q[3]);
    
    
    
endmodule
