`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 03:56:23 PM
// Design Name: 
// Module Name: led_shift_module
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


module led_shift_module(
    input clk,
    input in,
    input CE,
    output [15:0] Q
    );
    wire [15:0] out;
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .CE(CE), .D(in), .Q(out[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(CE), .D(out[0]), .Q(out[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(CE), .D(out[1]), .Q(out[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(CE), .D(out[2]), .Q(out[3]));
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .CE(CE), .D(out[3]), .Q(out[4]));
    FDRE #(.INIT(1'b0)) Q5_FF (.C(clk), .CE(CE), .D(out[4]), .Q(out[5]));
    FDRE #(.INIT(1'b0)) Q6_FF (.C(clk), .CE(CE), .D(out[5]), .Q(out[6]));
    FDRE #(.INIT(1'b0)) Q7_FF (.C(clk), .CE(CE), .D(out[6]), .Q(out[7]));
    FDRE #(.INIT(1'b0)) Q8_FF (.C(clk), .CE(CE), .D(out[7]), .Q(out[8]));
    FDRE #(.INIT(1'b0)) Q9_FF (.C(clk), .CE(CE), .D(out[8]), .Q(out[9]));
    FDRE #(.INIT(1'b0)) Q10_FF (.C(clk), .CE(CE), .D(out[9]), .Q(out[10]));
    FDRE #(.INIT(1'b0)) Q11_FF (.C(clk), .CE(CE), .D(out[10]), .Q(out[11]));
    FDRE #(.INIT(1'b0)) Q12_FF (.C(clk), .CE(CE), .D(out[11]), .Q(out[12]));
    FDRE #(.INIT(1'b0)) Q13_FF (.C(clk), .CE(CE), .D(out[12]), .Q(out[13]));
    FDRE #(.INIT(1'b0)) Q14_FF (.C(clk), .CE(CE), .D(out[13]), .Q(out[14]));
    FDRE #(.INIT(1'b0)) Q15_FF (.C(clk), .CE(CE), .D(out[14]), .Q(out[15]));
    assign Q = out;
endmodule
