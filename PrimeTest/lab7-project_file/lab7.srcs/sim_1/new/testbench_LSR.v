`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 02:49:03 PM
// Design Name: 
// Module Name: testbench_LSR
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


module testbench_LSR(

    );
    reg [15:0] D;
    reg LD;      
    reg R;       
    reg SHL;     
    reg SHin;    
    reg clkin;  
    wire [15:0] q;
    LSR_module LSR(
    .D(D[15:0]),
    .LD(LD),
    .R(R),
    .SHL(SHL),
    .SHin(SHin),
    .clk(clkin),
    .q(q[15:0])
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
    D = 16'b0000000000000000;
    LD = 1'b0;
    SHL = 1'b0;
    SHin = 1'b0;
    R = 1'b0;
    #100;
    D[0] = 1'b1;
    D[15] = 1'b1;
    #100;
    LD = 1'b1;
    #100;
    LD = 1'b0;
    SHL = 1'b1;
    #100;
    SHL = 1'b0;
    R = 1'b1;
    #100;
    R = 1'b0;
    D = 16'b1001000010010101;
    LD = 1'b1;
    #100;
    LD =1'b0;
    #100;
    D = 16'b0000000000001001;
    LD =1'b1;
    SHL = 1'b1;
    SHin = 1'b1;
    #100;
    LD = 1'b0;
    SHL = 1'b0;
    end
endmodule
