`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 11:41:04 PM
// Design Name: 
// Module Name: Full_Adder
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


module Full_Adder(
    input A,
    input B,
    input C_in,
    output S,
    output C_out
);

    m4_1 mux0(.o(S), .sel({B,C_in}), .in({A,~A,~A,A}));
    m4_1 mux1(.o(C_out), .sel({B,C_in}), .in({1'b1,A,A,1'b0}));

endmodule
