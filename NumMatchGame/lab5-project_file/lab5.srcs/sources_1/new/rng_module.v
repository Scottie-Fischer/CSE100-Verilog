`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2020 09:34:27 PM
// Design Name: 
// Module Name: rng_module
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


module rng_module(
    input clk,
    output [7:0] rnd
    );
    
    wire [7:0] num;
    wire in;
    assign in = num[0] ^ num[5] ^ num[6] ^ num[7];
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(in), .Q(num[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(num[0]), .Q(num[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(1'b1), .D(num[1]), .Q(num[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(1'b1), .D(num[2]), .Q(num[3]));
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .CE(1'b1), .D(num[3]), .Q(num[4]));
    FDRE #(.INIT(1'b0)) Q5_FF (.C(clk), .CE(1'b1), .D(num[4]), .Q(num[5]));
    //FDRE #(.INIT(1'b0)) Q6_FF (.C(clk), .CE(1'b1), .D(num[5]), .Q(num[6]));
    //FDRE #(.INIT(1'b0)) Q7_FF (.C(clk), .CE(1'b1), .D(num[6]), .Q(num[7]));
    assign num[6] = 1'b0;
    assign num[7] = 1'b0;
    assign rnd[7:0] = num[7:0];
endmodule
