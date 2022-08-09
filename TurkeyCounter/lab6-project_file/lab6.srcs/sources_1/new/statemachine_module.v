`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 01:32:43 PM
// Design Name: 
// Module Name: statemachine_module
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


module statemachine_module(
    input btnL,
    input btnR,
    input clk,
    
    output Up,
    output Down,
    output ResetTimer
    );
    
    wire [6:0] D;
    wire [6:0] Q;
    
    FDRE #(.INIT(1'b1) ) IDLE_FF  (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0) ) LEFT_FF  (.C(clk), .CE(1'b1), .D(D[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0) ) RIGHT_FF (.C(clk), .CE(1'b1), .D(D[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) BTWU_FF  (.C(clk), .CE(1'b1), .D(D[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) BTWD_FF  (.C(clk), .CE(1'b1), .D(D[4]), .Q(Q[4]));
    FDRE #(.INIT(1'b0) ) UP_FF    (.C(clk), .CE(1'b1), .D(D[5]), .Q(Q[5]));
    FDRE #(.INIT(1'b0) ) DOWN_FF  (.C(clk), .CE(1'b1), .D(D[6]), .Q(Q[6]));
    
    assign D[0] = (~btnL & ~btnR) & (Q[0] | Q[1] | Q[2] | Q[5] | Q[6]);
    assign D[1] = (btnL & ~btnR) & (Q[0] | Q[1] | Q[3]);
    assign D[2] = (~btnL & btnR) & (Q[0] | Q[2] | Q[4]);
    assign D[3] = (btnL & btnR) & (Q[1] | Q[3] | Q[5]);
    assign D[4] = (btnL & btnR) & (Q[2] | Q[4] | Q[6]);
    assign D[5] = (~btnL & btnR) & (Q[3] | Q[5]);
    assign D[6] = (btnL & ~btnR) & (Q[4] | Q[6]);
    
    assign ResetTimer = (Q[0]);
    assign Up = (Q[5] & ~btnL & ~btnR);
    assign Down = (Q[6] & ~btnL & ~btnR);
endmodule
