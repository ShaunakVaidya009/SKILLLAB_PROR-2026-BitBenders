`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 12:52:44
// Design Name: 
// Module Name: tb_lut
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


module tb_lut;

reg [3:0] i;
wire signed [15:0] atan_val;

lut uut (
    .i(i),
    .atan_val(atan_val)
);

initial begin
    $display("i | atan_val (scaled)");

    for (i = 0; i < 10; i = i + 1) begin
        #10;
        $display("%d | %d", i, atan_val);
    end

    $finish;
end

endmodule
