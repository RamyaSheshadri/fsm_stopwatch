`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2025 13:10:09
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
    input clk,
    input rst,
    input enable,
    output reg[3:0] ones,
    output reg[3:0] tens
    );
    
    always @(posedge clk) begin
        if (rst) begin
            ones <= 0;
            tens <= 0;
        end
        else if (enable) begin
            if (ones == 9) begin
                ones <= 0;
                if (tens == 9)
                    tens <= 0;  // wrap from 99 ? 00
                else
                    tens <= tens + 1;
            end
            else begin
                ones <= ones + 1;
            end
        end
    end
    
    
endmodule
