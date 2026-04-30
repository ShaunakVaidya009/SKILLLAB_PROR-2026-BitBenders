`timescale 1ns/1ps
module stage_one(
    input signed [15:0] xr0, xi0,
    input signed [15:0] xr1, xi1,
    input signed [15:0] xr2, xi2,
    input signed [15:0] xr3, xi3,

    output signed [15:0] a0r,a0i,b0r,b0i,
    output signed [15:0] a1r,a1i,b1r,b1i
);

// butterfly 0
assign a0r = xr0 + xr2;
assign a0i = xi0 + xi2;
assign b0r = xr0 - xr2;
assign b0i = xi0 - xi2;

// butterfly 1
assign a1r = xr1 + xr3;
assign a1i = xi1 + xi3;
assign b1r = xr1 - xr3;
assign b1i = xi1 - xi3;

endmodule