`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 02:11:20 PM
// Design Name: 
// Module Name: testbench_top
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


module testbench_top(
);

    reg btnL;       
    reg btnC;       
    reg btnD;       
    reg btnR;       
    reg clkin;      
    reg [15:0] sw; 
                      
    wire [15:0] led;
    wire [6:0] seg; 
    wire [3:0] an;  
    wire dp;
    wire [3:0] ledRing;
    wire qsec;
    top_module UUT(
    .btnL(btnL),
    .btnC(btnC),
    .btnD(btnD),
    .btnR(btnR),
    .sw(sw),
    .clkin(clkin),
    .ledO(ledRing),
    .led(led),
    .seg(seg),
    .an(an),
    .secO(qsec),
    .dp(dp)
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
    btnL = 1'b0;
    btnC = 1'b0;
    btnD = 1'b0;
    btnR = 1'b0;
    sw = 16'h0000;
    #1200;
    sw = 16'h000A;
    #100;
    btnL = 1'b1;
    #100;
    btnL = 1'b0;
    end
endmodule
