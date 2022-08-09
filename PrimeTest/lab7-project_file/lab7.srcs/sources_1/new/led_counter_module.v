`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 03:48:47 PM
// Design Name: 
// Module Name: led_counter_module
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


module led_counter_module(
    input clk,
    input R,
    input CE,       //this is set as qsec
    output [3:0] Q
    );
    wire [7:0] D;
    wire [7:0] out;
    wire ce = CE; 
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .R(R), .CE(ce), .D(out[6]), .Q(out[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .R(R), .CE(ce), .D(D[1]), .Q(out[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .R(R), .CE(ce), .D(D[2]), .Q(out[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .R(R), .CE(ce), .D(D[3]), .Q(out[3]));
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .R(R), .CE(ce), .D(D[4]), .Q(out[4]));
    FDRE #(.INIT(1'b0)) Q5_FF (.C(clk), .R(R), .CE(ce), .D(D[5]), .Q(out[5]));
    FDRE #(.INIT(1'b0)) Q6_FF (.C(clk), .R(R), .CE(ce), .D(D[6]), .Q(out[6]));
    assign D[0] = out[0] ^ CE;
    assign D[1] = out[1] ^ (CE&out[0]);
    assign D[2] = out[2] ^ (CE&out[0]&out[1]);
    assign D[3] = out[3] ^ (CE&out[0]&out[1]&out[2]);
    assign D[4] = out[4] ^ (CE&out[0]&out[1]&out[2]&out[3]);
    assign D[5] = out[5] ^ (CE&out[0]&out[1]&out[2]&out[3]&out[4]);
    assign D[6] = out[6] ^ (CE&out[0]&out[1]&out[2]&out[3]&out[4]);
    
    assign Q[0] = out[1];
    assign Q[1] = out[2];
    assign Q[2] = out[3];
    assign Q[3] = out[4];
    //assign Q[4] = out[6];
    
endmodule
