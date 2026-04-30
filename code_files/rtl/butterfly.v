`timescale 1ns/1ps
module butterfly(
    input clk,
    input rst,
    input start,

    input signed [15:0] A_real, A_imag,
    input signed [15:0] B_real, B_imag,
    input signed [15:0] theta,

    output reg signed [15:0] X_real, X_imag,
    output reg signed [15:0] Y_real, Y_imag,
    output reg done
);

wire signed [15:0] rot_real, rot_imag;
wire cordic_done;

// CORDIC rotation
rotator cordic_inst (
    .clk(clk),
    .rst(rst),
    .start(start),
    .x_in(B_real),
    .y_in(B_imag),
    .angle_in(-theta),
    .x_out(rot_real),
    .y_out(rot_imag),
    .done(cordic_done)
);

// scaling function
function signed [15:0] scale;
    input signed [15:0] val;
    begin
        scale = (val >>> 1) + (val >>> 3); // ~0.625
    end
endfunction

always @(posedge clk or posedge rst) begin
    if (rst) begin
        done <= 0;
    end else begin
        done <= 0;

        if (cordic_done) begin
            // scale rotated output
            X_real <= A_real + scale(rot_real);
            X_imag <= A_imag + scale(rot_imag);

            Y_real <= A_real - scale(rot_real);
            Y_imag <= A_imag - scale(rot_imag);

            done <= 1;
        end
    end
end

endmodule