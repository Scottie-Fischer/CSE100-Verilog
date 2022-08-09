`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 11:31:03 AM
// Design Name: 
// Module Name: testbench_topmod
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


module testbench_topmod();

    reg btnL;
    reg btnR;
    reg btnU;
    reg clkin;
    
    wire [6:0] seg;
    wire [3:0] an;
    wire LED15;
    wire LED9;
    wire dp;
    
    top_module UUT(
    .btnL(btnL),
    .btnR(btnR),
    .btnU(btnU),
    .clkin(clkin),
    .seg(seg),
    .an(an),
    .LED15(LED15),
    .LED9(LED9),
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
    assign btnL = 1'b0;
    assign btnR = 1'b0;
    assign btnU = 1'b0;
    #100; //turkey going from left to righ 
    assign btnL = 1'b1;
    #50;
    assign btnR = 1'b1;
    #50;
    assign btnL = 1'b0;
    #50;
    assign btnR = 1'b0;
    
    #100; //turkey going from right to left
    assign btnR = 1'b1;
    #50;
    assign btnL = 1'b1;
    #50;
    assign btnR = 1'b0;
    #50;
    assign btnL = 1'b0;
    
    #100; //turkey going from left->middle->left->leaves
    assign btnL = 1'b1;
    #50;
    assign btnR = 1'b1;
    #50; 
    assign btnR = 1'b0;
    #50;
    assign btnL = 1'b0;
    //STOPPED EDITING HERE
    #100; //turkey goes from left->middle->right->middle->left->leaves
    assign btnL = 1'b1;
    #50;
    assign btnR = 1'b1;
    #50;
    assign btnL = 1'b0;
    #50;
    assign btnL = 1'b1;
    #50;
    assign btnR = 1'b0;
    #50;
    assign btnL = 1'b1;
    
    #100; //turkey goes from left->middle->right->middle->right->leaves
    assign btnL = 1'b1;
    #50;
    assign btnR = 1'b1;
    #50;
    assign btnL = 1'b0;
    #50;
    assign btnL = 1'b1;
    #50;
    assign btnL = 1'b0;
    #50;
    assign btnR = 1'b0;
    
    #100; // both goes off at the same time and then we decrement
    assign btnR = 1'b1;
    #50;
    assign btnL = 1'b1;
    #50;
    assign btnL = 1'b0;
    assign btnR = 1'b0;
    #50;
    assign btnR = 1'b1;
    #50;
    assign btnL = 1'b1;
    #50;
    assign btnR = 1'b0;
    #50;
    assign btnL = 1'b0;
    end
endmodule
