`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 12:34:55
// Design Name: 
// Module Name: tb_addsub
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

module tb_adder;

parameter WIDTH = 16;

reg signed [WIDTH-1:0] x_in, y_in, z_in;
reg signed [WIDTH-1:0] x_shift, y_shift, atan_val;
reg signed [1:0] d;

wire signed [WIDTH-1:0] x_out, y_out, z_out;

// DUT
adder #(WIDTH) uut (
    .x_in(x_in),
    .y_in(y_in),
    .z_in(z_in),
    .x_shift(x_shift),
    .y_shift(y_shift),
    .atan_val(atan_val),
    .d(d),
    .x_out(x_out),
    .y_out(y_out),
    .z_out(z_out)
);

initial begin
    $display("Time | x y z | d | x_out y_out z_out");

    // Test 1 (like iteration 0)
    x_in = 16'sd3;
    y_in = 16'sd4;
    z_in = 16'sd0;

    x_shift = 16'sd3;   // x >> 0
    y_shift = 16'sd4;   // y >> 0
    atan_val = 16'sd45;

    d = -1;

    #10;
    $display("%0t | %d %d %d | %d | %d %d %d",
        $time, x_in, y_in, z_in, d, x_out, y_out, z_out);

    // Test 2
    x_in = 16'sd7;
    y_in = 16'sd1;
    z_in = 16'sd45;

    x_shift = 16'sd3;   // approx shift
    y_shift = 16'sd0;
    atan_val = 16'sd26;

    d = -1;

    #10;
    $display("%0t | %d %d %d | %d | %d %d %d",
        $time, x_in, y_in, z_in, d, x_out, y_out, z_out);

    // Test 3 (positive d)
    x_in = 16'sd5;
    y_in = 16'sd2;
    z_in = 16'sd30;

    x_shift = 16'sd1;
    y_shift = 16'sd1;
    atan_val = 16'sd14;

    d = 1;

    #10;
    $display("%0t | %d %d %d | %d | %d %d %d",
        $time, x_in, y_in, z_in, d, x_out, y_out, z_out);

    $finish;
end

endmodule