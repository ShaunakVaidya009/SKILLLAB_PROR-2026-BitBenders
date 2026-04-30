`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 12:57:30
// Design Name: 
// Module Name: tb_control
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


module tb_control;

reg clk;
reg rst;
reg start;
reg signed [15:0] y_in;
reg signed [15:0] z_in;
reg mode;

wire signed [1:0] d;
wire [3:0] i;
wire done;

// DUT
control uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .y_in(y_in),
    .z_in(z_in),
    .mode(mode),
    .d(d),
    .i(i),
    .done(done)
);


// Clock generation (10ns period)
always #5 clk = ~clk;


// Debug print every cycle
always @(posedge clk) begin
    $display("T=%0t | i=%d | d=%d | y=%d | z=%d | done=%b",
              $time, i, d, y_in, z_in, done);
end


initial begin
    // Initialize everything (VERY IMPORTANT)
    clk = 0;
    rst = 1;
    start = 0;
    mode = 1;          // vectoring mode
    y_in = 0;
    z_in = 0;

    #10;

    // Release reset
    rst = 0;

    #10;

    // Apply input
    y_in = 16'sd4;     // positive → d = -1
    z_in = 16'sd0;

    start = 1;

    #200;

    $finish;
end

endmodule
