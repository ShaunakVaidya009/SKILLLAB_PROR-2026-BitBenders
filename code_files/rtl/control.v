`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 12:56:40
// Design Name: 
// Module Name: control
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


module control #(
    parameter WIDTH = 16,
    parameter ITER = 10
)(
    input clk,
    input rst,
    input start,

    input signed [WIDTH-1:0] y_in,
    input signed [WIDTH-1:0] z_in,

    input mode,   // 0 = rotation, 1 = vectoring

    output reg signed [1:0] d,
    output reg [3:0] i,
    output reg done
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        i <= 0;
        done <= 0;
        d <= 0;
    end else if (start) begin
        if (i < ITER) begin
            
            // Direction logic
            if (mode == 1'b0) begin
                // Rotation mode
                d <= (z_in >= 0) ? 1 : -1;
            end else begin
                // Vectoring mode
                d <= (y_in >= 0) ? -1 : 1;
            end

            i <= i + 1;
        end else begin
            done <= 1;
        end
    end
end

endmodule
