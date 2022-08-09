`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 03:54:26 PM
// Design Name: 
// Module Name: hex7seg
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



module hex7seg(
    input [3:0] n,
    output [6:0] seg
    );
   
    m8_1 mSeg0(.in({1'b0,n[0],n[0],1'b0,1'b0,~n[0],1'b0,n[0]}), .sel({n[3],n[2],n[1]}), .o(seg[0]));             //controls segment 0 for 7 segment display
    m8_1 mSeg1(.in({1'b1,~n[0],n[0],1'b0,~n[0],n[0],1'b0,1'b0}), .sel({n[3],n[2],n[1]}), .o(seg[1]));            //controls segment 1 for 7 segment display
    m8_1 mSeg2(.in({1'b1,~n[0],1'b0,1'b0,1'b0,1'b0,~n[0],1'b0}), .sel({n[3],n[2],n[1]}), .o(seg[2]));                   //controls segment 2 for 7 segment display
    m8_1 mSeg3(.in({n[0],1'b0,~n[0],n[0],n[0],~n[0],1'b0,n[0]}), .sel({n[3],n[2],n[1]}), .o(seg[3]));        //controls segment 3 for 7 segment display
    m8_1 mSeg4(.in({1'b0,1'b0,1'b0,n[0],n[0],1'b1,n[0],n[0]}), .sel({n[3],n[2],n[1]}), .o(seg[4]));              //controls segment 4 for 7 segment display
    m8_1 mSeg5(.in({1'b0,n[0],1'b0,1'b0,n[0],1'b0,1'b1,n[0]}), .sel({n[3],n[2],n[1]}), .o(seg[5]));                 //controls segment 5 for 7 segment display
    m8_1 mSeg6(.in({1'b0,~n[0],1'b0,1'b0,n[0],1'b0,1'b0,1'b1}), .sel({n[3],n[2],n[1]}), .o(seg[6]));                  //controls segment 6 for 7 segment display

endmodule
