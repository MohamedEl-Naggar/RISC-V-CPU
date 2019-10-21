`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2019 03:40:26 PM
// Design Name: 
// Module Name: mux4x1
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


module mux4x1(input [15:0] a, b, c, d, input [1:0] sel, output [15:0] out);
    wire [15:0] array [0:3];
    assign array[0] = a; 
    assign array[1] = b; 
    assign array[2] = c; 
    assign array[3] = d; 
    assign out = array[sel];
endmodule
