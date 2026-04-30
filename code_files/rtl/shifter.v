`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 12:10:08
// Design Name: 
// Module Name: shifter
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


module shifter #(
    parameter WIDTH = 16
)(
    input  signed [WIDTH-1:0] x_in,
    input  signed [WIDTH-1:0] y_in,
    input  [3:0] i,   // iteration index (0 to 15)
    
    output signed [WIDTH-1:0] x_shift,
    output signed [WIDTH-1:0] y_shift
);

assign x_shift = x_in >>> i;  // arithmetic shift
assign y_shift = y_in >>> i;

endmodule
