`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 12:15:40 PM
// Design Name: 
// Module Name: testbench_statemachine
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


module testbench_statemachine();

    reg btnC,btnU,clkin,FourSec,TwoSec,Match;
    wire [4:0]State;
    wire showNum,ResetTimer,RunGame,Scored,FlashBoth,FlashAlt;
    
    state_machine_module UUT(
    .btnC(btnC),
    .btnU(btnU),
    //.rng(rng),
    .clk(clkin),
    .FourSec(FourSec),
    .TwoSec(TwoSec),
    .Match(Match),
    .State(State),
    .showNum(showNum),
    .ResetTimer(ResetTimer),
    .RunGame(RunGame),
    .Scored(Scored),
    .FlashBoth(FlashBoth),
    .FlashAlt(FlashAlt)
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
    btnC  = 1'b0;
    btnU = 1'b0;
    FourSec = 1'b0;
    TwoSec = 1'b0;
    Match = 1'b0;
    #100;
    btnC = 1'b1;
    //We Enter Play State
    #100;
    btnC  = 1'b0;
    TwoSec = 1'b1;
    //We Enter Game State
    #100;
    TwoSec = 1'b0;
    //Still in Game State, Time Counter is incrementing
    #100;
    btnU  = 1'b1;
    Match = 1'b1;   //We Win
    //We Enter Win State
    #100;
    btnU = 1'b0;
    FourSec = 1'b1;
    //We Enter Start State Again
    #100;
    FourSec = 1'b0;
    Match = 1'b0;
    btnC = 1'b1;
    #100;
    TwoSec = 1'b1;
    btnC = 1'b0;
    #100;
    TwoSec = 1'b0;
    btnU = 1'b1;
    #100;
    FourSec = 1'b1;
    #100;
    FourSec = 1'b0;
    end
endmodule
