`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 03:30:11 PM
// Design Name: 
// Module Name: turkeyCounter_testbench
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


module turkeyCounter_testbench();
    reg clkin;
    reg CE;
    reg R;
    wire [7:0] Q;
    
    time_counter_module UUT(
    .clk(clkin),
    .CE(CE),
    .R(R),
    .Q(Q)
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
    assign R = 1'b0;
    assign CE = 1'b1;
    #200;
    end
endmodule
