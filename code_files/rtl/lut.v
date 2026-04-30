`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 12:51:45
// Design Name: 
// Module Name: lut
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


module lut (
    input [3:0] i,
    output reg signed [15:0] atan_val
);

always @(*) begin
    case(i)
        0: atan_val = 16'sd4500;
        1: atan_val = 16'sd2656;
        2: atan_val = 16'sd1404;
        3: atan_val = 16'sd712;
        4: atan_val = 16'sd357;
        5: atan_val = 16'sd179;
        6: atan_val = 16'sd90;
        7: atan_val = 16'sd45;
        8: atan_val = 16'sd22;
        9: atan_val = 16'sd11;
        default: atan_val = 0;
    endcase
end

endmodule
