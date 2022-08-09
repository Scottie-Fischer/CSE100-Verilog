`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 02:18:15 PM
// Design Name: 
// Module Name: subtractor_module
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


module subtractor_module(
    input [15:0] A,
    input [15:0] B,
    input C_in,
    output [15:0] D,
    output C_out
    
    );
    //16 bit subtractor:
    wire [15:0] C_O;
    Full_Adder A0(.A(A[0]), .B(~B[0]), .C_in(C_in),   .C_out(C_O[0]), .S(D[0]));
    Full_Adder A1(.A(A[1]), .B(~B[1]), .C_in(C_O[0]), .C_out(C_O[1]), .S(D[1]));
    Full_Adder A2(.A(A[2]), .B(~B[2]), .C_in(C_O[1]), .C_out(C_O[2]), .S(D[2]));
    Full_Adder A3(.A(A[3]), .B(~B[3]), .C_in(C_O[2]), .C_out(C_O[3]), .S(D[3]));
    Full_Adder A4(.A(A[4]), .B(~B[4]), .C_in(C_O[3]), .C_out(C_O[4]), .S(D[4]));
    Full_Adder A5(.A(A[5]), .B(~B[5]), .C_in(C_O[4]), .C_out(C_O[5]), .S(D[5]));
    Full_Adder A6(.A(A[6]), .B(~B[6]), .C_in(C_O[5]), .C_out(C_O[6]), .S(D[6]));
    Full_Adder A7(.A(A[7]), .B(~B[7]), .C_in(C_O[6]), .C_out(C_O[7]), .S(D[7]));
    Full_Adder A8(.A(A[8]), .B(~B[8]), .C_in(C_O[7]), .C_out(C_O[8]), .S(D[8]));
    Full_Adder A9(.A(A[9]), .B(~B[9]), .C_in(C_O[8]), .C_out(C_O[9]), .S(D[9]));
    Full_Adder A10(.A(A[10]), .B(~B[10]), .C_in(C_O[9]), .C_out(C_O[10]), .S(D[10]));
    Full_Adder A11(.A(A[11]), .B(~B[11]), .C_in(C_O[10]), .C_out(C_O[11]), .S(D[11]));
    Full_Adder A12(.A(A[12]), .B(~B[12]), .C_in(C_O[11]), .C_out(C_O[12]), .S(D[12]));
    Full_Adder A13(.A(A[13]), .B(~B[13]), .C_in(C_O[12]), .C_out(C_O[13]), .S(D[13]));
    Full_Adder A14(.A(A[14]), .B(~B[14]), .C_in(C_O[13]), .C_out(C_O[14]), .S(D[14]));
    Full_Adder A15(.A(A[15]), .B(~B[15]), .C_in(C_O[14]), .C_out(C_O[15]), .S(D[15]));
    assign C_out = C_O[15];
endmodule
