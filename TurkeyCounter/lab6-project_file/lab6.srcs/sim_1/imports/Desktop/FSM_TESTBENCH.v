`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 11:42:28 AM
// Design Name: 
// Module Name: FSM_TESTBENCH
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


module FSM_TESTBENCH();
    reg L;
    reg R;
    reg clkin;
    
    
    wire INC;
    wire DEC; 
    wire RESET_TIMER;
    
    statemachine_module UUT(
     .btnL(L),
     .btnR(R),
     .clk(clkin),
     .Up(INC),
     .Down(DEC),
     .ResetTimer(RESET_TIMER)
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
    assign L = 1'b0;
    assign R = 1'b0;
    
    #100; //turkey going from left to righ 
    assign L = 1'b1;
    #50;
    assign R = 1'b1;
    #50;
    assign L = 1'b0;
    #50;
    assign R = 1'b0;
    
    #100; //turkey going from right to left
    assign R = 1'b1;
    #50;
    assign L = 1'b1;
    #50;
    assign R = 1'b0;
    #50;
    assign L = 1'b0;
    
    #100; //turkey going from left->middle->left->leaves
    assign L = 1'b1;
    #50;
    assign R = 1'b1;
    #50; 
    assign R = 1'b0;
    #50;
    assign L = 1'b0;
    //STOPPED EDITING HERE
    #100; //turkey goes from left->middle->right->middle->left->leaves
    assign L = 1'b1;
    #50;
    assign R = 1'b1;
    #50;
    assign L = 1'b0;
    #50;
    assign L = 1'b1;
    #50;
    assign R = 1'b0;
    #50;
    assign L = 1'b1;
    
    #100; //turkey goes from left->middle->right->middle->right->leaves
    assign L = 1'b1;
    #50;
    assign R = 1'b1;
    #50;
    assign L = 1'b0;
    #50;
    assign L = 1'b1;
    #50;
    assign L = 1'b0;
    #50;
    assign R = 1'b0;
    
    #100; // both goes off at the same time and then we decrement
    assign R = 1'b1;
    #50;
    assign L = 1'b1;
    #50;
    assign L = 1'b0;
    assign R = 1'b0;
    #50;
    assign R = 1'b1;
    #50;
    assign L = 1'b1;
    #50;
    assign R = 1'b0;
    #50;
    assign L = 1'b0;
    end
endmodule
