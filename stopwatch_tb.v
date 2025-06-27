`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2025 13:43:31
// Design Name: 
// Module Name: stopwatch_tb
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


module stopwatch_tb();
reg clk;
reg rst;
reg start;
reg pause;
wire [3:0]ones;
wire  [3:0] tens;

stopwatch dut(.clk(clk),.rst(rst),.start(start),.pause(pause),.ones(ones),.tens(tens));


initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
rst=1;start=1;
#10;
rst=0;
start=1;#50;
pause=1;#50;
start=1;#1000;
$finish;
end

endmodule
