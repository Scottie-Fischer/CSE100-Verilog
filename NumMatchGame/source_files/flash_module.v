`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 02:06:23 AM
// Design Name: 
// Module Name: flash_module
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


module flash_module(
    input CE,
    input clk,
    output Flash
    );
    wire a;
    assign a = ~Flash;
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .CE(CE), .D(a), .Q(Flash));
endmodule
