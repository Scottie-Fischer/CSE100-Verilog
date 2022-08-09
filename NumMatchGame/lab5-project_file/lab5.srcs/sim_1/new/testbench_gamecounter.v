`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 03:14:08 PM
// Design Name: 
// Module Name: testbench_gamecounter
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


module testbench_gamecounter();

    reg R,clkin,CE;
    wire [7:0] Q;
    reg [7:0]x;
    reg w;
    wire y;
    game_counter_module UUT(
    .R(R),
    .clk(clkin),
    .CE(CE),
    .Q(Q[7:0]),
    .x(x[7:0]),
    .y(y),
    .w(w)
    );
    
    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;

    initial    // Clock process for clkin
    begin
        #OFFSET
		  clkin = 1'b1;
        forever
        begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clkin = ~clkin;
        end
    end
    
    initial
    begin
    CE = 1'b0;
    R = 1'b0;
    x = 7'b0011000;
    w = 1'b0;
    #100;
    CE = 1'b1;
    #400;
    end
endmodule
