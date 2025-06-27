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
    parameter IDLE =2'b00;
    parameter RUNNING =2'b01;
    parameter PAUSED =2'b10;
    
    reg[1:0]current_state, next_state;
    
    always@(posedge clk)
    begin
    if(rst)
    current_state<=IDLE;
    else
    current_state<=next_state;
    end
    
    always@(*)begin
     case(current_state)
      IDLE: begin
    
        if(start)
            next_state=RUNNING;
        else
            next_state=IDLE;
       end
        
       RUNNING:begin
    
        if(pause)
            next_state=PAUSED;
        else
            next_state=RUNNING;
        end
        
    PAUSED:begin
    
        if(start)
            next_state=RUNNING;
        else
            next_state=PAUSED;
        end
        
        default: next_state=IDLE;
        endcase
        end
        
        always @(*) begin
        if(current_state==RUNNING)
        enable=1;
        else
        enable=0;
        end 
        
    
endmodule
