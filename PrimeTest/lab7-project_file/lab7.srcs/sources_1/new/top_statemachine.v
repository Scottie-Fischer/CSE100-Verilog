`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 12:35:37 PM
// Design Name: 
// Module Name: top_statemachine
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


module top_statemachine(
    input btnD,
    input btnL,
    input btnC,
    input clk,
    input Done,
    input Prime_in,
    input [15:0] sw,
    input [15:0] divisor,
    
    output Input,   //animation for input state
    output Working, //for LED0
    output Peek,    //for an[] for peek state
    output Prime,    //for prime animation & not prime animation
    output NotPrime,
    output [15:0] displayBits
    );
    
    wire [4:0]D,Q;
    assign D[0] = (Q[2] & btnC) | (Q[3] & btnC) | (Q[0] & ~btnL);       //input state
    assign D[1] = (Q[0] & btnL) | (Q[1] & ~Done);                       //working state
    assign D[2] = (Q[1] & Done & Prime_in) | (Q[2] & ~btnC);    //prime found state
    assign D[3] = (Q[1] & Done & ~Prime_in) | (Q[3] & ~btnC & ~btnD) | (Q[4] & ~btnC & ~btnD);           //Prime Not Found
    assign D[4] = (Q[3] & ~btnC & btnD) | (Q[4] & btnD);                //Peek
    
    assign Input = Q[0];
    assign Working = Q[1];
    assign Prime = Q[2];
    assign NotPrime = Q[3];
    assign Peek = Q[4]; 
   //want to do: sw & Q[1] | (divisor & Q[4])   (sw[15:0] & {16{Q[1]}}) | (divisor[15:0] & {16{Q[4]}})
    LSR_module store_input(.D((sw & {16{~Peek}}) | (divisor & {16{Peek}})), .LD(Q[0] | Q[4]), .SHL(1'b0), .SHin(1'b0), .clk(clk), .q(displayBits));
    
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(D[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(D[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(D[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0)) Input_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(D[4]), .Q(Q[4]));
endmodule
