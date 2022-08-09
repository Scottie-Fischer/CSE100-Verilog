`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 01:19:42 PM
// Design Name: 
// Module Name: comparator_4bitmodule
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


module comparator_4bitmodule(
    input [3:0] A,
    input [3:0] B,
    input GR_I,
    input EQ_I,
    input LT_I,
    
    output LT,      //True if A < B
    output EQ,      //True if A = B
    output GR       //True is A > B
    );
    wire LT_O;
    wire GR_O;
    wire EQ_O;
    //logic for comparing just these bits
    assign LT_O = (~A[3] & B[3]) | (B[2] & ~A[2] & (~A[3] | B[3])) | (~A[1] & B[1] & (~A[2] | B[2]) & (~A[3] | B[3])) |  (~A[0] & B[0] & (~A[1] | B[1]) & (~A[2]|B[2]) & (~A[3]|B[3]));
    assign EQ_O = ~(A[0] ^ B[0]) & ~(A[1] ^ B[1]) & ~(A[2] ^ B[2]) & ~(A[3] ^ B[3]);
    assign GR_O = (A[3] & ~B[3]) | (A[2] & ~B[2] & (~B[3] | A[3])) | (A[1] & ~B[1] & (~B[2] | A[2]) & (~B[3] | A[3])) |  (A[0] & ~B[0] & (~B[1] | A[1]) & (~B[2]|A[2]) & (~B[3]|A[3]));
    //              1--- vs 0----    -1--- v 00--              --1- v 000-                      ---1 v 0000
    //compares past bits and these bits
    assign GR = (GR_O) | (EQ_O & GR_I);  //these bits can be equal if previous bits are greater than, otherwise depends on these bits
    assign EQ = (EQ_O & EQ_I);           //past bits and these bits must be equal
    assign LT = (LT_O) | (EQ_O & LT_I);  //these bits are equal and last are less than, or these bits are less than
    
endmodule
