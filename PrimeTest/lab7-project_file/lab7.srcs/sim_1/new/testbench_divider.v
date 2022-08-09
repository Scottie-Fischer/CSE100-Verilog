`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 10:29:15 PM
// Design Name: 
// Module Name: testbench_divider
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


module testbench_divider();

    reg [15:0] A;
    reg [15:0] B;
    reg clkin;
    reg reset;   
    reg btn;
                   
    wire [15:0] Q;
    wire [15:0] R;
    wire finished;
    wire [15:0] RO;
    wire [15:0] AO;
//    wire [15:0] SO;
    
//    wire LTO;
    wire D0;
    wire D1;
    wire D2;
    wire timeUp;
    wire [7:0] timer;
    wire first_shift;
    wire RESET;
    wire LOADMORE;
//    wire LD;
    divider_module div(
    .A(A),
    .B(B),
    .clk(clkin),
    .reset(reset),
    .btn(btn),
    .Q(Q),
    .R(R),
    .finished(finished),
    .first_loadO(first_shift),
//    .SO(SO),
    .RO(RO),
    .AO(AO),
    .LOADMORE(LOADMORE),
//    .LTO(LTO),
    .D0(D0),
    .D1(D1),
    .D2(D2),
    .REEEEE(RESET),
    .timeUp(timeUp),
    .timer(timer)
//    .LD(LD),

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
    A = 16'd0;
    B = 16'd0;
    reset = 1'b0;
    btn = 1'b0;
    
    #100;
    A = 16'h008C;   //140/9 = 0x000F R: 0x0005
    B = 16'h0009;
    #100;
    btn = 1'b1;
    #100;
    btn = 1'b0;
    #100;
    reset = 1'b1;
    #100;
    reset = 1'b0;
    #100;
    btn = 1'b1;
    #100;
    btn = 1'b0;
    #100;
    reset = 1'b1;
    #100;
    reset = 1'b0;
    #100;
    A = 16'd107;   //  107/5 = 0x0015 R: 0x0002
    B = 16'd5;     
    #100;           
    btn = 1'b1;
    #100;
    btn = 1'b0;
    #100;
    btn = 1'b1;     // 107/5 again
    #100;
    btn = 1'b0;
    #500;
    reset = 1'b1;
    #100
    reset = 1'b0;
    A = 16'd1600;       // 1600/22 = 0x0048 R: 0x0010
    B = 16'd22;
    #100;
    btn = 1'b1;
    #100;
    btn = 1'b0;
    #500;
    A = 16'hFED7;
    B = 16'h0013;
    #100;
    btn = 1'b1;
    #100;
    btn = 1'b0;
    end
endmodule
