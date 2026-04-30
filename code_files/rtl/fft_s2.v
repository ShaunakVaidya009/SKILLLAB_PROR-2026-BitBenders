module stage_two(
    input clk,
    input rst,
    input start,

    input signed [15:0] a0r,a0i,
    input signed [15:0] a1r,a1i,
    input signed [15:0] b0r,b0i,
    input signed [15:0] b1r,b1i,

    output signed [15:0] X0r,X0i,
    output signed [15:0] X1r,X1i,
    output signed [15:0] X2r,X2i,
    output signed [15:0] X3r,X3i,
    output done
);

wire signed [15:0] X1r_w,X1i_w,X3r_w,X3i_w;
wire done_butterfly;

// Butterfly with rotation (ONLY needed one)
butterfly B1 (
    .clk(clk),
    .rst(rst),
    .start(start),

    .A_real(b0r),
    .A_imag(b0i),
    .B_real(b1r),
    .B_imag(b1i),

    .theta(16'sd9000),   // 90° (correct scale)

    .X_real(X1r_w),
    .X_imag(X1i_w),
    .Y_real(X3r_w),
    .Y_imag(X3i_w),
    .done(done_butterfly)
);

// First butterfly (no rotation)
assign X0r = a0r + a1r;
assign X0i = a0i + a1i;

assign X2r = a0r - a1r;
assign X2i = a0i - a1i;

// Rotated outputs
assign X1r = X1r_w;
assign X1i = X1i_w;

assign X3r = X3r_w;
assign X3i = X3i_w;

assign done = done_butterfly;

endmodule