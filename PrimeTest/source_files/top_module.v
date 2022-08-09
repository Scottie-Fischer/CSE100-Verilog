`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 11:21:49 AM
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
    input btnL,
    input btnC,
    input btnD,
    input btnR,
    input clkin,
    input [15:0] sw,
    
    output [15:0] led,
    output [6:0] seg, 
    output [3:0] an,
    output dp
    //output [3:0]ledO,
    //output secO
    );
    assign dp = 1'b1;
    wire clk,digsel,qsec;
    assign secO = qsec;
    wire Done,Prime_Out;
    wire InputS, WorkingS, PrimeS, NotPrimeS, PeekS; //state wires
    wire [15:0] divisor,displayBits;
    wire [3:0] ringCount,selOut;
    wire Flash;
    //assign displayBits = (divisor & PeekS) | (sw & (NotPrimeS | PrimeS));
    lab7_clks not_so_slow(.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel), .qsec(qsec));
    
    top_statemachine top(.clk(clk), .btnL(btnL), .btnC(btnC), .btnD(btnD), .sw(sw), .divisor(divisor), .Done(Done), .Prime_in(Prime_Out), .Input(InputS), .Working(WorkingS), .Prime(PrimeS), .NotPrime(NotPrimeS), .Peek(PeekS) ,.displayBits(displayBits));
    
    primetester_module primer(.clk(clk), .A(sw), .btnL(btnL), .btnC(btnC) , .prime(Prime_Out), .done(Done), .divisor(divisor));
    
    wire [3:0]ledRing;
    ring_counter_module rings(.clk(clk), .Advance(digsel), .Q(ringCount));
    
    //assign ledO = ledRing;
    ring_counter_module ledDisp(.clk(clk), .Advance(qsec), .Q(ledRing));
    //led_counter_module(.clk(clk), .CE(qsec), .Q(ledRing));
    
    selector sel(.sel(ringCount), .N(displayBits), .H(selOut));
    hex7seg bigdisplay(.n(selOut), .seg(seg));
    
    flash_module flash(.clk(clk), .CE(qsec), .Flash(Flash));
    
    assign an[0] = ~(ringCount[0] & ~ringCount[1] & ~ringCount[2] & ~ringCount[3]) | (Flash & NotPrimeS);
    assign an[1] = ~(~ringCount[0] & ringCount[1] & ~ringCount[2] & ~ringCount[3]) | (Flash & NotPrimeS);
    assign an[2] = ~(~ringCount[0] & ~ringCount[1] & ringCount[2] & ~ringCount[3]) | (Flash & NotPrimeS);
    assign an[3] = ~(~ringCount[0] & ~ringCount[1] & ~ringCount[2] & ringCount[3]) | (Flash & NotPrimeS);
    
    assign led[0]  = PrimeS | (~ledRing[0] & ~ledRing[1] & ~ledRing[2] &  ledRing[3] & NotPrimeS) | WorkingS;
    assign led[1]  = PrimeS | (~ledRing[0] & ~ledRing[1] &  ledRing[2] & ~ledRing[3] & NotPrimeS);
    assign led[2]  = PrimeS | (~ledRing[0] &  ledRing[1] & ~ledRing[2] & ~ledRing[3] & NotPrimeS);
    assign led[3]  = PrimeS | ( ledRing[0] & ~ledRing[1] & ~ledRing[2] & ~ledRing[3] & NotPrimeS);
    assign led[4]  = PrimeS | (~ledRing[0] & ~ledRing[1] & ~ledRing[2] &  ledRing[3] & NotPrimeS);
    assign led[5]  = PrimeS | (~ledRing[0] & ~ledRing[1] &  ledRing[2] & ~ledRing[3] & NotPrimeS);
    assign led[6]  = PrimeS | (~ledRing[0] &  ledRing[1] & ~ledRing[2] & ~ledRing[3] & NotPrimeS);
    assign led[7]  = PrimeS | ( ledRing[0] & ~ledRing[1] & ~ledRing[2] & ~ledRing[3] & NotPrimeS) | ( ledRing[0] & ~ledRing[1] & ~ledRing[2] & ~ledRing[3] & InputS);
    assign led[8]  = PrimeS | (~ledRing[0] & ~ledRing[1] & ~ledRing[2] &  ledRing[3] & NotPrimeS) | (~ledRing[0] &  ledRing[1] & ~ledRing[2] & ~ledRing[3] & InputS);
    assign led[9]  = PrimeS | (~ledRing[0] & ~ledRing[1] &  ledRing[2] & ~ledRing[3] & NotPrimeS) | (~ledRing[0] & ~ledRing[1] &  ledRing[2] & ~ledRing[3] & InputS);
    assign led[10] = PrimeS | (~ledRing[0] &  ledRing[1] & ~ledRing[2] & ~ledRing[3] & NotPrimeS) | (~ledRing[0] & ~ledRing[1] & ~ledRing[2] &  ledRing[3] & InputS);
    assign led[11] = PrimeS | ( ledRing[0] & ~ledRing[1] & ~ledRing[2] & ~ledRing[3] & NotPrimeS);
    assign led[12] = PrimeS | (~ledRing[0] & ~ledRing[1] & ~ledRing[2] &  ledRing[3] & (NotPrimeS|InputS));
    assign led[13] = PrimeS | (~ledRing[0] & ~ledRing[1] &  ledRing[2] & ~ledRing[3] & (NotPrimeS|InputS));
    assign led[14] = PrimeS | (~ledRing[0] &  ledRing[1] & ~ledRing[2] & ~ledRing[3] & (NotPrimeS|InputS));
    assign led[15] = PrimeS | ( ledRing[0] & ~ledRing[1] & ~ledRing[2] & ~ledRing[3] & (NotPrimeS|InputS));
endmodule
