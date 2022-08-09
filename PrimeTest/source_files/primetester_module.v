`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 02:23:34 PM
// Design Name: 
// Module Name: primetester_module
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


module primetester_module(
    input [15:0] A,
    input btnL, //start
    input btnC, //reset
    input clk, 
    
    output prime,
    output [15:0] divisor,
    //testing
    output [15:0] remain,
    output [15:0] halfO,
    output done,
    output divDone,
    output countFin,
    output Q0,
    output Q1
    );
    wire [15:0] half, divCount,quotient,remainder;
    wire LD,reload;
    wire countProceed;
    wire edgeL;
    wire countFinished;
    wire divideFinished;
    wire compDone;
    assign half  = A>>1;
    assign halfO = half;
    assign countProceed = (divCount < half)?1:0;
    assign countFinished = (divCount >= half | (remainder == 16'h0000 & divideFinished == 1'b1))?1:0;
    assign divisor = divCount;//(prime==1'b1)?divCount:16'd0;
    assign prime = ((remainder>16'h0000) & (countFinished))?1:0;
    
    assign divDone = divideFinished;
    assign done = compDone;
    assign countFin = countFinished;
    assign remain = remainder;
    edge_detector edgeB(.clk(clk), .btn(btnL), .o(edgeL));
    
    prime_statemachine primer(.clk(clk), .btn(edgeL), .LD(LD), .done(compDone), .reload(reload), .finished(countFinished), .divideDone(divideFinished), .Q0O(Q0), .Q1O(Q1));
    
    countUD16L divCounter(.clk(clk), .Din(16'd2), .LD(LD|btnC), .Up(countProceed & reload), .Dw(1'b0), .Q(divCount));
    
    divider_module divider(.clk(clk), .A(A), .B(divCount), .reset(btnC), .btn(LD|reload), .Q(quotient), .R(remainder), .finished(divideFinished));
    
endmodule
