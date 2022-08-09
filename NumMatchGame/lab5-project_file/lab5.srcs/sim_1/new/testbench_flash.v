`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 02:15:00 AM
// Design Name: 
// Module Name: testbench_flash
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


module testbench_flash(
    
    );
    
    reg CE;
    reg clkin;
    wire Flash;
    reg [4:0] x,y;
    wire w;
    flash_module UUT(
    .clk(clkin),
    .Flash(Flash),
    .CE(CE),
    .x(x),
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
    //Flash = 1'b0;
    x = 4'b0000;
    y = 4'b0000;
    #100;
    x = 4'b0001;
    #100;
    x = 4'b0000;
    #100;
    y = 4'b0101;
    x = 4'b0000;
    #100;
    x = 4'b0101;
    end
endmodule
