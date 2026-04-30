`timescale 1ns/1ps

module tb_butterfly;

reg clk, rst, start;

reg signed [15:0] A_real, A_imag;
reg signed [15:0] B_real, B_imag;
reg signed [15:0] theta;

wire signed [15:0] X_real, X_imag;
wire signed [15:0] Y_real, Y_imag;
wire done;

butterfly uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .A_real(A_real),
    .A_imag(A_imag),
    .B_real(B_real),
    .B_imag(B_imag),
    .theta(theta),
    .X_real(X_real),
    .X_imag(X_imag),
    .Y_real(Y_real),
    .Y_imag(Y_imag),
    .done(done)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    start = 0;

    #20 rst = 0;

    // Example inputs
    A_real = 16'sd1000;
    A_imag = 16'sd0;

    B_real = 16'sd1000;
    B_imag = 16'sd0;

    theta = 16'sd4500; // 45 degrees

    #10;
    start = 1;
    #10;
    start = 0;

    wait(done);

    $display("X = %d + j%d", X_real, X_imag);
    $display("Y = %d + j%d", Y_real, Y_imag);

    #50;
    $finish;
end

endmodule