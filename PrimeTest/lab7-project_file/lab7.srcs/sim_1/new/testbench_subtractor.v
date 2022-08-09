`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 07:23:38 PM
// Design Name: 
// Module Name: testbench_subtractor
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


module testbench_subtractor(

);
    reg [15:0] A;
    reg [15:0] B; 
    reg C_in; 
    wire [15:0] D;
    wire C_out;    
    subtractor_module sub(
    .A(A[15:0]),
    .B(B[15:0]),
    .C_in(C_in),
    .D(D[15:0]),
    .C_out(C_out)
    );
    
    
    initial
    begin
    A = 16'b0000000000000000;
    B = 16'b0000000000000000;
    C_in = 1'b0;
    #100;
    //9 - 3
    A = 16'b0000000000001001; 
    B = 16'b0000000000000011;
    #100;
    //10-5
    A = 16'b0000000000001010;
    B = 16'b0000000000000101;
    end
endmodule
