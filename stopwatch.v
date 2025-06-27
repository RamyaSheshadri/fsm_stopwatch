`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2025 13:30:30
// Design Name: 
// Module Name: stopwatch
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


module stopwatch(
    input clk,
    input rst,
    input start,
    input pause,
    output [3:0] ones,
    output [3:0] tens
    );
    
    wire enable;
    
    fsm_controller f_ins(.clk(clk),
    .rst(rst),
    .start(start),
    .pause(pause),
    .enable(enable));
    
    bcd_counter b_ins(.clk(clk),
    .rst(rst),
    .enable(enable),
    .ones(ones),
    .tens(tens));
    
  endmodule   
