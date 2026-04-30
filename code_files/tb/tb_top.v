`timescale 1ns/1ps

module tb_top;

reg clk;
reg rst;
reg start;
reg signed [15:0] angle_in;

wire signed [15:0] cos_out;
wire signed [15:0] sin_out;
wire done;

integer file;

top uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .angle_in(angle_in),
    .cos_out(cos_out),
    .sin_out(sin_out),
    .done(done)
);

// Clock
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    start = 0;
    angle_in = 0;

    file = $fopen("cordic_output.txt", "w");

    #20 rst = 0;

    // Generate samples (0° to 360°)
    repeat (360) begin
        angle_in = angle_in + 100; // 1 degree step (scaled)

        start = 1;
        #10;
        start = 0;

        wait(done);

        // Write to file
        $fwrite(file, "%d %d\n", cos_out, sin_out);

        #10;
    end

    $fclose(file);
    $finish;
end

endmodule