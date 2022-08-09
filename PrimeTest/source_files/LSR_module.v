`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 12:39:34 AM
// Design Name: 
// Module Name: LSR_module
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

module LSR_module(
    input [15:0] D, //bit to load in
    input LD,       //trigger to load
    input R,        //trigger to reset
    input SHL,      //trigger to Shift in
    input SHin,     //bit to shift in
    input clk,      //clock
     
    output [15:0] q
    );
    wire CE = SHL | LD;
    wire [15:0] gate;
    assign gate[0] =  (~SHL & LD & D[0])  | (SHL & ~LD &SHin)  | (SHL & LD & SHin);
    assign gate[1] =  (~SHL & LD & D[1])  | (SHL & ~LD &q[0])  | (SHL & LD & D[0]);
    assign gate[2] =  (~SHL & LD & D[2])  | (SHL & ~LD &q[1])  | (SHL & LD & D[1]);
    assign gate[3] =  (~SHL & LD & D[3])  | (SHL & ~LD &q[2])  | (SHL & LD & D[2]);
    assign gate[4] =  (~SHL & LD & D[4])  | (SHL & ~LD &q[3])  | (SHL & LD & D[3]);
    assign gate[5] =  (~SHL & LD & D[5])  | (SHL & ~LD &q[4])  | (SHL & LD & D[4]);
    assign gate[6] =  (~SHL & LD & D[6])  | (SHL & ~LD &q[5])  | (SHL & LD & D[5]);
    assign gate[7] =  (~SHL & LD & D[7])  | (SHL & ~LD &q[6])  | (SHL & LD & D[6]);
    assign gate[8] =  (~SHL & LD & D[8])  | (SHL & ~LD &q[7])  | (SHL & LD & D[7]);
    assign gate[9] =  (~SHL & LD & D[9])  | (SHL & ~LD &q[8])  | (SHL & LD & D[8]);
    assign gate[10] = (~SHL & LD & D[10]) | (SHL & ~LD &q[9])  | (SHL & LD & D[9]);
    assign gate[11] = (~SHL & LD & D[11]) | (SHL & ~LD &q[10]) | (SHL & LD & D[10]);
    assign gate[12] = (~SHL & LD & D[12]) | (SHL & ~LD &q[11]) | (SHL & LD & D[11]);
    assign gate[13] = (~SHL & LD & D[13]) | (SHL & ~LD &q[12]) | (SHL & LD & D[12]);
    assign gate[14] = (~SHL & LD & D[14]) | (SHL & ~LD &q[13]) | (SHL & LD & D[13]);
    assign gate[15] = (~SHL & LD & D[15]) | (SHL & ~LD &q[14]) | (SHL & LD & D[14]);
    
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .R(R), .CE(CE), .D(gate[0]), .Q(q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .R(R), .CE(CE), .D(gate[1]), .Q(q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .R(R), .CE(CE), .D(gate[2]), .Q(q[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .R(R), .CE(CE), .D(gate[3]), .Q(q[3]));
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .R(R), .CE(CE), .D(gate[4]), .Q(q[4]));
    FDRE #(.INIT(1'b0)) Q5_FF (.C(clk), .R(R), .CE(CE), .D(gate[5]), .Q(q[5]));
    FDRE #(.INIT(1'b0)) Q6_FF (.C(clk), .R(R), .CE(CE), .D(gate[6]), .Q(q[6]));
    FDRE #(.INIT(1'b0)) Q7_FF (.C(clk), .R(R), .CE(CE), .D(gate[7]), .Q(q[7]));
    FDRE #(.INIT(1'b0)) Q8_FF (.C(clk), .R(R), .CE(CE), .D(gate[8]), .Q(q[8]));
    FDRE #(.INIT(1'b0)) Q9_FF (.C(clk), .R(R), .CE(CE), .D(gate[9]), .Q(q[9]));
    FDRE #(.INIT(1'b0)) QA_FF (.C(clk), .R(R), .CE(CE), .D(gate[10]), .Q(q[10]));
    FDRE #(.INIT(1'b0)) QB_FF (.C(clk), .R(R), .CE(CE), .D(gate[11]), .Q(q[11]));
    FDRE #(.INIT(1'b0)) QC_FF (.C(clk), .R(R), .CE(CE), .D(gate[12]), .Q(q[12]));
    FDRE #(.INIT(1'b0)) QD_FF (.C(clk), .R(R), .CE(CE), .D(gate[13]), .Q(q[13]));
    FDRE #(.INIT(1'b0)) QE_FF (.C(clk), .R(R), .CE(CE), .D(gate[14]), .Q(q[14]));
    FDRE #(.INIT(1'b0)) QF_FF (.C(clk), .R(R), .CE(CE), .D(gate[15]), .Q(q[15]));
   
endmodule
