`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 01:06:40 PM
// Design Name: 
// Module Name: comparator_module
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


module comparator_module(
    input [15:0] A,
    input [15:0] B,
    output LT,      //True if A < B
    output EQ,      //True if A = B
    output GR       //True is A > B
//    output [3:0]GRO,
//    output [3:0]EQO
    );
    wire GR0,GR1,GR2,GR3;
    wire LT0,LT1,LT2,LT3;
    wire EQ0,EQ1,EQ2,EQ3;
//    assign GRO = {GR0,GR1,GR2,GR3};
//    assign EQO = {EQ0,EQ1,EQ2,EQ3};
    comparator_4bitmodule bit0(.A({A[3:0]}),   .B({B[3:0]}),   .LT_I(1'b0),.EQ_I(1'b1),.GR_I(1'b0),.LT(LT0), .EQ(EQ0), .GR(GR0));
    comparator_4bitmodule bit1(.A({A[7:4]}),   .B({B[7:4]}),   .LT_I(LT0), .EQ_I(EQ0), .GR_I(GR0), .LT(LT1), .EQ(EQ1), .GR(GR1));
    comparator_4bitmodule bit2(.A({A[11:8]}),  .B({B[11:8]}),  .LT_I(LT1), .EQ_I(EQ1), .GR_I(GR1), .LT(LT2), .EQ(EQ2), .GR(GR2));
    comparator_4bitmodule bit3(.A({A[15:12]}), .B({B[15:12]}), .LT_I(LT2), .EQ_I(EQ2), .GR_I(GR2), .LT(LT3), .EQ(EQ3), .GR(GR3));
    
    assign LT = LT3;
    assign EQ = EQ3;
    assign GR = GR3;
endmodule
