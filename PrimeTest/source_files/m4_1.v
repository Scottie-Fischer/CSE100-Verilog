`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 10:21:55 PM
// Design Name: 
// Module Name: m4_1
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


module m4_1(
    input [1:0] sel,
    input [3:0] in,
    output o
    );
    assign o = (~sel[0] & ~sel[1] & in[0]) | (sel[0] & ~sel[1] & in[1]) | (~sel[0] & sel[1] & in[2]) | (sel[0] & sel[1] & in[3]);
    
endmodule
