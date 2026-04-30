`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 12:33:22
// Design Name: 
// Module Name: addsub
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


module adder #(
    parameter WIDTH = 16
)(
    input  signed [WIDTH-1:0] x_in,
    input  signed [WIDTH-1:0] y_in,
    input  signed [WIDTH-1:0] z_in,

    input  signed [WIDTH-1:0] x_shift,
    input  signed [WIDTH-1:0] y_shift,
    input  signed [WIDTH-1:0] atan_val,

    input  signed [1:0] d,   // +1 or -1

    output signed [WIDTH-1:0] x_out,
    output signed [WIDTH-1:0] y_out,
    output signed [WIDTH-1:0] z_out
);

// Core equations
assign x_out = x_in - (d * y_shift);
assign y_out = y_in + (d * x_shift);
assign z_out = z_in - (d * atan_val);

endmodule
