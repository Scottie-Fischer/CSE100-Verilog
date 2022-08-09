`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2020 11:10:56 AM
// Design Name: 
// Module Name: count4bit
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


module count4bit(
    input clk,
    input Up,
    input Dw,
    
    output [3:0] Q,     //Current Value of counter
    output UTC,         //is 1 only when counter is 1111
    output DTC          //is 1 only when counter is 0000
    );
    //Loading in Values from Din
    wire [3:0] D;
    wire CE;
    assign CE = Up^Dw;
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .CE(CE), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(CE), .D(D[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(CE), .D(D[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(CE), .D(D[3]), .Q(Q[3]));
   
    assign D[0] = (Up & ~Dw & (Q[0] ^ Up))                  | (~Up & Dw)&(Q[0] ^ Dw);
    assign D[1] = (Up & ~Dw & (Q[1] ^ (Up&Q[0])))           | (~Up & Dw)&(Q[1] ^ (~Q[0]&Dw));
    assign D[2] = (Up & ~Dw & (Q[2] ^ (Up&Q[0]&Q[1])))      | (~Up & Dw)&(Q[2] ^ (~Q[1]&~Q[0]&Dw));
    assign D[3] = (Up & ~Dw & (Q[3] ^ (Up&Q[0]&Q[1]&Q[2]))) | (~Up & Dw)&(Q[3] ^ (~Q[2]&~Q[1]&~Q[0]&Dw));
   
   assign UTC = (Q[0] & Q[1] & Q[2] & Q[3]);
   assign DTC = (~Q[0] & ~Q[1] & ~Q[2] & ~Q[3]);
   
    
endmodule