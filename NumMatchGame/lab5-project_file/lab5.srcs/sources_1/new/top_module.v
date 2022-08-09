`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 05:09:19 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input btnC,
    input btnU,
    input btnR,
    input clkin,
    
    output [15:0] led,
    output [3:0] an,
    output [6:0] seg,
    output dp
    
    );
    wire Flash;
    wire Go,Stop,FourSecs,TwoSecs,Match,Play;
    wire ShowNum,ResetTimer,RunGame,Scored,FlashBoth,FlashAlt;
    wire qsec,clk,digsel;
    wire [7:0] rngNum;
    wire [7:0] rngO;
    wire [7:0] gameNum;
    wire [7:0] timer;
    wire [3:0] ringCount;
    wire [15:0] selectBits;
    wire [3:0] selOut;
    
    assign selectBits[15:8] = rngNum[7:0];
    assign selectBits[7:0] = gameNum[7:0];
    
    assign Match = ((rngNum[7:0] & gameNum[7:0]) | (~rngNum[7:0] & ~gameNum[7:0]));
    
    
    assign TwoSecs = ~timer[7] & ~timer[6] & ~timer[5] & ~timer[4] & timer[3] & ~timer[2] & ~timer[1] & ~timer[0];
    assign FourSecs = ~timer[7] & ~timer[6] & ~timer[5] & timer[4] & ~timer[3] & ~timer[2] & ~timer[1] & ~timer[0];
    assign dp = 1'b1;
    
    
    lab5_clks slowit (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel), .qsec(qsec));
    
    state_machine_module states(.clk(clk), .btnC(btnC), .btnU(btnU), .TwoSec(TwoSecs),.FourSec(FourSecs), .Match(Match),.Play(Play),
    .showNum(ShowNum), .ResetTimer(ResetTimer), .RunGame(RunGame), .Scored(Scored), .FlashBoth(FlashBoth), .FlashAlt(FlashAlt)  //,.State(States[4:0])
    );
    
    rng_module randNum(.clk(clk), .rnd(rngO));
    
    store_module stores(.clk(clk), .CE(btnC&Play), .Q(rngNum[7:0]), .in(rngO[7:0]));
    //Counters
    game_counter_module gameCount(.clk(clk), .CE(RunGame&qsec),.R(ResetTimer), .Q(gameNum));
    time_counter_module timeCount(.clk(clk), .CE(qsec), .R(ResetTimer), .Q(timer));
    
    led_shift_module ledMod(.clk(clk), .CE(Scored),.in(1'b1), .Q(led[15:0]));
    ring_counter_module RCMod(.clk(clk), .Advance(digsel), .o(ringCount[3:0]));
    selector sel(.sel(ringCount[3:0]), .N(selectBits[15:0]), .H(selOut));
    hex7seg hex(.n(selOut[3:0]),.seg(seg[6:0]));
    
    
    flash_module flash(.clk(clk), .CE(qsec), .Flash(Flash));
    assign an[0] = ~(ringCount[0] & ~ringCount[1]  & ~ringCount[2] & ~ringCount[3] ) | ((FlashAlt|FlashBoth) & Flash);
    assign an[1] = ~(~ringCount[0] & ringCount[1]  & ~ringCount[2] & ~ringCount[3] ) | ((FlashAlt|FlashBoth) & Flash);
    assign an[2] = ~(~ringCount[0] & ~ringCount[1] & (ringCount[2]& ShowNum)  & ~ringCount[3]) | ((FlashBoth & Flash) | (FlashAlt & ~Flash));
    assign an[3] = ~(~ringCount[0] & ~ringCount[1] & ~ringCount[2] & (ringCount[3]& ShowNum)) | ((FlashBoth & Flash) |  (FlashAlt & ~Flash));
endmodule
