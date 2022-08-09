`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 04:12:41 PM
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(
    input clk,
    input btn,
    output o
    );
    wire o0,o1;
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk),.CE(1'b1), .D(btn), .Q(o0));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk),.CE(1'b1), .D(o0), .Q(o1));
    assign o = o0 & ~o1;
endmodule
