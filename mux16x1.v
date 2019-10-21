`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2019 02:28:48 PM
// Design Name: 
// Module Name: mux16x1
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


module mux16x1(input [12:0] in0, in1, in2, in3, in4, in5, in6, in7,
in8, in9, in10, in11, in12, in13, in14, in15,
input [3:0] sel, output [12:0] out);
wire [12:0] array [0:15];
assign array[0] = in0; 
assign array[1] = in1; 
assign array[2] = in2; 
assign array[3] = in3;
assign array[4] = in4; 
assign array[5] = in5; 
assign array[6] = in6; 
assign array[7] = in7;
assign array[8] = in8; 
assign array[9] = in9; 
assign array[10] = in10; 
assign array[11] = in11;
assign array[12] = in12; 
assign array[13] = in13; 
assign array[14] = in14; 
assign array[15] = in15; 
assign out = array[sel];
endmodule
