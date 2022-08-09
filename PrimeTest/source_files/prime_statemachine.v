`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 02:16:27 PM
// Design Name: 
// Module Name: prime_statemachine
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


module prime_statemachine(
    input clk,
    input btn,
    input finished,
    input divideDone,
    output LD,
    output reload,
    output done,
    output Q0O,
    output Q1O
);
    wire Q0,Q1;
    wire D0,D1;
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(D0), .Q(Q0));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(D1), .Q(Q1));
    
    assign D0 = (Q0 & ~btn) | (Q1 & finished & divideDone);
    assign D1 = (Q0 & btn)  | (Q1 & (~finished | ~divideDone));
    assign LD = (Q0 & btn);
    assign reload = (Q1 & ~finished & divideDone); // counter != B/2
    assign done = (Q1 & finished & divideDone); 
    
    assign Q0O = Q0;
    assign Q1O = Q1;
endmodule
