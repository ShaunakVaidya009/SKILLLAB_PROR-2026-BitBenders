`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 12:13:20
// Design Name: 
// Module Name: tb_shifter
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


`timescale 1ns/1ps

module tb_shifter;

parameter WIDTH = 16;

reg signed [WIDTH-1:0] x_in;
reg signed [WIDTH-1:0] y_in;
reg [3:0] i;

wire signed [WIDTH-1:0] x_shift;
wire signed [WIDTH-1:0] y_shift;

// Instantiate DUT
shifter #(WIDTH) uut (
    .x_in(x_in),
    .y_in(y_in),
    .i(i),
    .x_shift(x_shift),
    .y_shift(y_shift)
);

initial begin
    $display("Time\t x_in y_in | i | x_shift y_shift");

    // Test 1
    x_in = 16'sd8; y_in = 16'sd4; i = 0;
    #10;
    $display("%0t\t %d %d | %d | %d %d", $time, x_in, y_in, i, x_shift, y_shift);

    // Test 2
    i = 1; #10;
    $display("%0t\t %d %d | %d | %d %d", $time, x_in, y_in, i, x_shift, y_shift);

    // Test 3
    i = 2; #10;
    $display("%0t\t %d %d | %d | %d %d", $time, x_in, y_in, i, x_shift, y_shift);

    // Test 4 (negative)
    x_in = -16'sd8; y_in = 16'sd4; i = 1;
    #10;
    $display("%0t\t %d %d | %d | %d %d", $time, x_in, y_in, i, x_shift, y_shift);

    // Test 5
    x_in = -16'sd16; y_in = -16'sd8; i = 2;
    #10;
    $display("%0t\t %d %d | %d | %d %d", $time, x_in, y_in, i, x_shift, y_shift);

    $finish;
end

endmodule
