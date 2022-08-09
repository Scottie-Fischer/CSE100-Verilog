`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 05:56:28 PM
// Design Name: 
// Module Name: testbench_primetester
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


module testbench_primetester(

    );
    reg [15:0] A;        
    reg btnL; //start    
    reg btnC; //reset    
    reg clkin;             
                       
    wire prime;          
    wire [15:0] divisor;               
    wire [15:0] halfO;
    wire [15:0] remainder;
    wire done;
    wire divDone;
    wire countFin;
    wire Q0;
    wire Q1;
    primetester_module UUT(
    .A(A),
    .btnL(btnL),
    .btnC(btnC),
    .clk(clkin),
    .prime(prime),
    .divisor(divisor),
    .halfO(halfO),
    .done(done),
    .divDone(divDone),
    .countFin(countFin),
    .Q0(Q0),
    .Q1(Q1),
    .remain(remainder)
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
    btnL = 1'b0;
    btnC = 1'b0;
    #100;
    A = 16'd16;
    #100;
    btnL = 1'b1;
    #100;
    btnL = 1'b0;
    #100;
    btnC = 1'b1;
    A = 16'd21;
    #100;
    btnC = 1'b0;
    #100;
    btnL = 1'b1;
    #100;
    btnL = 1'b0;
    #500;
    btnC = 1'b1;
    #100;
    btnC = 1'b0;
    A = 16'd17;
    #100;
    btnL =1'b1;
    #100;
    btnL = 1'b0;
    #2000;
    btnC = 1'b1;
    #100;
    btnC = 1'b0;
    #100;
    A = 16'hFED7;
    btnL = 1'b1;
    #100;
    btnL = 100;
//    #100;
//    btnL = 1'b1;
    end
endmodule
