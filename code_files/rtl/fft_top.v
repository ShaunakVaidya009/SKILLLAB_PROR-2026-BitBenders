`timescale 1ns/1ps

module fft_top(
    input clk,
    input rst,
    input start,

    input signed [15:0] xr0, xi0,
    input signed [15:0] xr1, xi1,
    input signed [15:0] xr2, xi2,
    input signed [15:0] xr3, xi3,

    output signed [15:0] X0r,X0i,
    output signed [15:0] X1r,X1i,
    output signed [15:0] X2r,X2i,
    output signed [15:0] X3r,X3i,
    
     output done   // ✅ ADD THIS
);

// stage 1 wires
wire signed [15:0] a0r,a0i,b0r,b0i;
wire signed [15:0] a1r,a1i,b1r,b1i;

// Stage 1
stage_one S1(
    xr0,xi0,
    xr1,xi1,
    xr2,xi2,
    xr3,xi3,
    a0r,a0i,b0r,b0i,
    a1r,a1i,b1r,b1i
);

// Stage 2
stage_two S2(
    .clk(clk),
    .rst(rst),
    .start(start),
    .a0r(a0r), .a0i(a0i),
    .a1r(a1r), .a1i(a1i),
    .b0r(b0r), .b0i(b0i),
    .b1r(b1r), .b1i(b1i),
    .X0r(X0r), .X0i(X0i),
    .X1r(X1r), .X1i(X1i),
    .X2r(X2r), .X2i(X2i),
    .X3r(X3r), .X3i(X3i),
    .done(done)
);

endmodule