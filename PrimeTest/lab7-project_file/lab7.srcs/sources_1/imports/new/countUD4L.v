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


module countUD4L(
    input clk,
    input Up,
    input Dw,
    input LD,
    input [3:0] Din,     //is loaded on the clock edge if LD = 1

    output [3:0] Q,     //Current Value of counter
    output UTC,         //is 1 only when counter is 1111
    output DTC          //is 1 only when counter is 0000
    //output ces
    );
    //Loading in Values from Din
    wire [3:0] storage;
    wire CE;
    assign CE = LD | Up^Dw;
    //assign ces = CE;
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .CE(CE), .D(storage[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(CE), .D(storage[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(CE), .D(storage[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(CE), .D(storage[3]), .Q(Q[3]));
   
    assign storage[0] = (LD & Din[0]) | (Up & ~LD & ~Dw & (Q[0] ^ Up)) | (~Up & ~LD & Dw)&(Q[0] ^ Dw);
    assign storage[1] = (LD & Din[1]) | (Up & ~LD & ~Dw & (Q[1] ^ (Up&Q[0]))) | (~Up & ~LD & Dw)&(Q[1] ^ (~Q[0]&Dw));
    assign storage[2] = (LD & Din[2]) | (Up & ~LD & ~Dw & (Q[2] ^ (Up&Q[0]&Q[1]))) | (~Up & ~LD & Dw)&(Q[2] ^ (~Q[1]&~Q[0]&Dw));
    assign storage[3] = (LD & Din[3]) | (Up & ~LD & ~Dw & (Q[3] ^ (Up&Q[0]&Q[1]&Q[2]))) | (~Up & ~LD & Dw)&(Q[3] ^ (~Q[2]&~Q[1]&~Q[0]&Dw));
   
   assign UTC = (Q[0] & Q[1] & Q[2] & Q[3]);
   assign DTC = (~Q[0] & ~Q[1] & ~Q[2] & ~Q[3]);
   
    
endmodule