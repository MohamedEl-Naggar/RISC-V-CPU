`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2019 02:48:22 PM
// Design Name: 
// Module Name: RegFile
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


module RegFile (
input clk, rst,
input [4:0] readreg1, readreg2, writereg,
input [31:0] writedata,
input regwrite,
output [31:0] readdata1, readdata2
);
    integer i;
    reg [31:0] regs [0:31];
    assign readdata1 = regs[readreg1];
    assign readdata2 = regs[readreg2];
    always @ (posedge clk, posedge rst)
    begin
    regs[0] = 0;
    if (rst)
    begin
        for(i = 0; i < 32; i = i + 1)
        begin
            regs[i] = 0;
        end
    end
    else
    begin
        if (regwrite)
        begin
            regs[writereg] = writedata;
        end
    end
    end
endmodule
