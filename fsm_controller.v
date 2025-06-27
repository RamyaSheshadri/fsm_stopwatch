`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2025 12:48:34
// Design Name: 
// Module Name: fsm_controller
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


module fsm_controller(
    input clk,
    input rst,
    input start,
    input pause,
    output reg enable
    );
  parameter IDLE    = 2'b00;
    parameter RUNNING = 2'b01;
    parameter PAUSED  = 2'b10;

    reg [1:0] current_state, next_state;

    // 1️.Sequential Block
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // 2️.Combinational Next State Logic (ternary style inside case)
    always @(*) begin
        case (current_state)
            IDLE:    next_state = start  ? RUNNING : IDLE;
            RUNNING: next_state = pause  ? PAUSED  : RUNNING;
            PAUSED:  next_state = start  ? RUNNING : PAUSED;
            default: next_state = IDLE;
        endcase
    end

    // 3️.Combinational Output Logic
    always @(*) begin
        enable = (current_state == RUNNING) ? 1'b1 : 1'b0;
    end
        
    
endmodule
