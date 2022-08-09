`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 06:13:53 PM
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

    reg btnC,btnU,btnR,clkin;
    wire [15:0] led;
    wire [3:0] an;
    wire [6:0] seg;
    wire dp;
    //Testing Stuff
    
    /*
    wire [7:0]GameCount;
    wire [7:0]timeCounts;
    wire [7:0] rngN;
    wire [3:0] ringO;
    wire digiS;
    */
    top_module UUT(
    .btnC(btnC),
    .btnU(btnU),
    .btnR(btnR),
    .clkin(clkin),
    .led(led[15:0]),
    .an(an),
    .seg(seg),
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
    btnC = 1'b0;
    btnU = 1'b0;
    btnR = 1'b0;
    #100;
    
    #100;
    btnC = 1'b1;
    #100;
    btnC = 1'b0;
    #2000;
    
    #100;
    
    btnU = 1'b1;
    #100;
    btnU = 1'b0;
    end
endmodule
