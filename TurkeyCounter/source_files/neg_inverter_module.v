`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 10:20:16 PM
// Design Name: 
// Module Name: neg_inverter_module
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


module neg_inverter_module(
    input [7:0] in,
    
    output [7:0] invOut
    );
    
    wire [7:0] o;
    wire [7:0] s;
    wire [7:0] c_out;
    assign o[0] = ~in[0] & in[7] | in[0] & ~in[7];
    assign o[1] = ~in[1] & in[7] | in[1] & ~in[7];
    assign o[2] = ~in[2] & in[7] | in[2] & ~in[7];
    assign o[3] = ~in[3] & in[7] | in[3] & ~in[7];
    assign o[4] = ~in[4] & in[7] | in[4] & ~in[7];
    assign o[5] = ~in[5] & in[7] | in[5] & ~in[7];
    assign o[6] = ~in[6] & in[7] | in[6] & ~in[7];
    assign o[7] = in[7];
    
    adder add0 (.a(o[0]), .b(in[7]), .c_in(1'b0), .s(s[0]), .c_out(c_out[0]));
    adder add1 (.a(o[1]), .b(1'b0), .c_in(c_out[0]), .s(s[1]), .c_out(c_out[1]));
    adder add2 (.a(o[2]), .b(1'b0), .c_in(c_out[1]), .s(s[2]), .c_out(c_out[2]));
    adder add3 (.a(o[3]), .b(1'b0), .c_in(c_out[2]), .s(s[3]), .c_out(c_out[3]));
    adder add4 (.a(o[4]), .b(1'b0), .c_in(c_out[3]), .s(s[4]), .c_out(c_out[4]));
    adder add5 (.a(o[5]), .b(1'b0), .c_in(c_out[4]), .s(s[5]), .c_out(c_out[5]));
    adder add6 (.a(o[6]), .b(1'b0), .c_in(c_out[5]), .s(s[6]), .c_out(c_out[6]));
    assign s[7] = in[7];
    assign invOut = s;
endmodule
