`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 01:09:53 PM
// Design Name: 
// Module Name: adder
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


module adder(
    input a,
    input b,
    input c_in,
    output s,
    output c_out
    
    );
    assign s = c_in ^ (a^b);
    assign c_out = (a & b) | (b & c_in) | (a & c_in);
endmodule