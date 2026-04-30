`timescale 1ns/1ps

module tb_fft;

reg clk;
reg rst;
reg start;

reg signed [15:0] xr0, xi0;
reg signed [15:0] xr1, xi1;
reg signed [15:0] xr2, xi2;
reg signed [15:0] xr3, xi3;

wire signed [15:0] X0r, X0i;
wire signed [15:0] X1r, X1i;
wire signed [15:0] X2r, X2i;
wire signed [15:0] X3r, X3i;
wire done;

integer file;

// DUT
fft_top DUT (
    .clk(clk),
    .rst(rst),
    .start(start),

    .xr0(xr0), .xi0(xi0),
    .xr1(xr1), .xi1(xi1),
    .xr2(xr2), .xi2(xi2),
    .xr3(xr3), .xi3(xi3),

    .X0r(X0r), .X0i(X0i),
    .X1r(X1r), .X1i(X1i),
    .X2r(X2r), .X2i(X2i),
    .X3r(X3r), .X3i(X3i),
    .done(done)
);

// Clock
always #5 clk = ~clk;

// Helper task
task run_fft;
begin
    // Start pulse
    start = 1;
    #10;
    start = 0;

    // Wait for FFT completion
    wait(done);

    // Write output
    $fwrite(file, "%d %d\n", X0r, X0i);
    $fwrite(file, "%d %d\n", X1r, X1i);
    $fwrite(file, "%d %d\n", X2r, X2i);
    $fwrite(file, "%d %d\n", X3r, X3i);

    $fwrite(file, "\n");

    // Console debug
    $display("---- FFT OUTPUT ----");
    $display("X0 = %d + j%d", X0r, X0i);
    $display("X1 = %d + j%d", X1r, X1i);
    $display("X2 = %d + j%d", X2r, X2i);
    $display("X3 = %d + j%d", X3r, X3i);
end
endtask

initial begin
    clk = 0;
    rst = 1;
    start = 0;

    file = $fopen("fft_output.txt", "w");

    #20 rst = 0;

    //////////////////////////////////////////////////////
    // TEST 1: sine-like input
    // [0, 1, 0, -1]
    //////////////////////////////////////////////////////
    xr0 = 0;     xi0 = 0;
    xr1 = 1000;  xi1 = 0;
    xr2 = 0;     xi2 = 0;
    xr3 = -1000; xi3 = 0;

    #10;
    run_fft();

    //////////////////////////////////////////////////////
    // TEST 2: all ones
    // [1,1,1,1]
    //////////////////////////////////////////////////////
    #50;
    xr0 = 1000; xi0 = 0;
    xr1 = 1000; xi1 = 0;
    xr2 = 1000; xi2 = 0;
    xr3 = 1000; xi3 = 0;

    #10;
    run_fft();

    //////////////////////////////////////////////////////
    // TEST 3: impulse
    // [1,0,0,0]
    //////////////////////////////////////////////////////
    #50;
    xr0 = 1000; xi0 = 0;
    xr1 = 0;    xi1 = 0;
    xr2 = 0;    xi2 = 0;
    xr3 = 0;    xi3 = 0;

    #10;
    run_fft();

    //////////////////////////////////////////////////////
    // Finish
    //////////////////////////////////////////////////////
    $fclose(file);

    #50;
    $finish;
end

endmodule