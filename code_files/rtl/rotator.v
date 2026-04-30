`timescale 1ns/1ps

module rotator #(
    parameter WIDTH = 16,
    parameter ITER  = 10
)(
    input clk,
    input rst,
    input start,

    input signed [WIDTH-1:0] x_in,
    input signed [WIDTH-1:0] y_in,
    input signed [WIDTH-1:0] angle_in,

    output reg signed [WIDTH-1:0] x_out,
    output reg signed [WIDTH-1:0] y_out,
    output reg done
);

reg signed [WIDTH-1:0] x, y, z;
reg [3:0] i;
reg busy;

wire signed [WIDTH-1:0] atan_val;

lut lut_inst (.i(i), .atan_val(atan_val));

wire signed [WIDTH-1:0] x_shift = x >>> i;
wire signed [WIDTH-1:0] y_shift = y >>> i;

wire d = (z >= 0);

wire signed [WIDTH-1:0] x_next = d ? (x - y_shift) : (x + y_shift);
wire signed [WIDTH-1:0] y_next = d ? (y + x_shift) : (y - x_shift);
wire signed [WIDTH-1:0] z_next = d ? (z - atan_val) : (z + atan_val);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        busy <= 0;
        done <= 0;
        i <= 0;
    end else begin
        done <= 0;

        if (start && !busy) begin
            x <= x_in;
            y <= y_in;
            z <= angle_in;
            i <= 0;
            busy <= 1;
        end
        else if (busy) begin
            if (i < ITER) begin
                x <= x_next;
                y <= y_next;
                z <= z_next;
                i <= i + 1;
            end else begin
                x_out <= x;
                y_out <= y;
                done <= 1;
                busy <= 0;
            end
        end
    end
end

endmodule