`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2019 03:35:16 PM
// Design Name: 
// Module Name: RCA32
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


module RCA32 (input cin, input [31:0] a, b, output [31:0] sum, output cout);
wire [32:0] c;
assign c[0] = cin;
assign cout = c[32];
generate

genvar i;

for (i = 0; i < 32; i = i + 1)
    begin
        FA fa (c[i], a[i], b[i], sum[i], c[i + 1]);
    end
    
endgenerate
endmodule

