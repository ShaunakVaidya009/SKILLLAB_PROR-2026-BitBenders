module top #(
    parameter WIDTH = 16,
    parameter ITER  = 10
)(
    input clk,
    input rst,
    input start,
    input signed [WIDTH-1:0] angle_in, // scaled ×100

    output reg signed [WIDTH-1:0] cos_out,
    output reg signed [WIDTH-1:0] sin_out,
    output reg done
);

reg signed [WIDTH-1:0] x, y, z;
reg [3:0] i;
reg busy;

// LUT
wire signed [WIDTH-1:0] atan_val;

lut lut_inst (
    .i(i),
    .atan_val(atan_val)
);

// Shift
wire signed [WIDTH-1:0] x_shift = x >>> i;
wire signed [WIDTH-1:0] y_shift = y >>> i;

// Direction
wire d = (z >= 0);

// Next values
wire signed [WIDTH-1:0] x_next = d ? (x - y_shift) : (x + y_shift);
wire signed [WIDTH-1:0] y_next = d ? (y + x_shift) : (y - x_shift);
wire signed [WIDTH-1:0] z_next = d ? (z - atan_val) : (z + atan_val);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        x <= 0;
        y <= 0;
        z <= 0;
        i <= 0;
        busy <= 0;
        done <= 0;
        cos_out <= 0;
        sin_out <= 0;
    end
    else begin
        done <= 0;

        if (start && !busy) begin
            x <= 16'sd6073;   // K scaling
            y <= 0;
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
            end
            else begin
                cos_out <= x;
                sin_out <= y;
                done <= 1;
                busy <= 0;
            end
        end
    end
end

endmodule