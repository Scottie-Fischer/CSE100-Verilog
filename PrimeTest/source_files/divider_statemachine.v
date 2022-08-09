`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 09:40:36 PM
// Design Name: 
// Module Name: divider_statemachine
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


module divider_statemachine(
    input btn,
    input clk,
    
    output reset,
    output timeUp,
    output loadmore,
    output first_shift,
    output last_shift,
    output finished,
    //testing outputs
    output  D7,
    output D4,
    output D5,
    output D6,
    output [7:0] timer
    );
    
    wire timesUp;
    wire Q0,Q1,Q2,Q3;
    wire D0,D1,D2,D3; 
    assign timeUp = timesUp;
    assign D0 = (Q0 & ~btn) | (Q2 & timesUp);
    assign D1 = (Q3 & ~Q2);
    assign D2 = (Q1) | (Q2 & ~timesUp);
    assign D3 = Q0 & btn & ~Q1;
    //assign D2 = (Q2 &  btn) ;
    assign reset = Q3;// Q0 & btn;
    assign first_shift = Q1;
    
    assign D4 = Q0;
    assign D5 = Q1;
    assign D6 = Q2;
    //assign D7 = Q3;
    //assign D0_O = Q0;
    //assign D1_O = Q1;
    assign loadmore = Q2 & timesUp;
    time_counter_module timee(.clk(clk), .CE(1'b1), .R(~D2 & ~D0), .utc(timesUp), .Q(timer), .utcF(finished),.last(last_shift));
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(D0), .Q(Q0));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(1'b1), .D(D3), .Q(Q3));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(D1), .Q(Q1)); //reset state
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(1'b1), .D(D2), .Q(Q2));
endmodule
