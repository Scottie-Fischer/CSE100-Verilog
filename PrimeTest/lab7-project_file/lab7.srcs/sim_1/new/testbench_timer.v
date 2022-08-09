`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 09:53:00 PM
// Design Name: 
// Module Name: testbench_timer
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


module testbench_timer(

    );
    reg clkin;
    reg R;
    reg CE;       //this is set as qsec
    wire [7:0] Q;
    wire utc;
    
    time_counter_module timer(.clk(clkin),.R(R),.CE(CE),.Q(Q), .utc(utc));
    
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
    R = 1'b0;
    CE = 1'b0;
    #100;
    CE = 1'b1;
    #100;
    end
endmodule
