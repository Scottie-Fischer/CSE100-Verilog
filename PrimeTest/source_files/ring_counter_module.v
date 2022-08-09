`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 03:41:08 PM
// Design Name: 
// Module Name: ring_counter_module
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


module ring_counter_module(
    input clk,
    input Advance,
    output [3:0] Q
    );
    wire [3:0] out;
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(Advance), .D(out[3]), .Q(out[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(Advance), .D(out[0]), .Q(out[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(Advance), .D(out[1]), .Q(out[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(Advance), .D(out[2]), .Q(out[3]));
    
    assign Q = out;
endmodule