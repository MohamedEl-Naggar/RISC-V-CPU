`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2019 02:37:15 PM
// Design Name: 
// Module Name: CPU
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


module CPU(input clk_cpu, clk_ssd, rst, [4:0] ssdSel, [1:0] ledSel, output [7:0] Anode, [6:0] LED_out, [15:0] Leds);
reg [31:0] PC;
initial PC = 0;
wire [12:0] outputs;
wire [31:0] InstMemOut, readdata1, readdata2, Imm, ALUresult, operand2, ReadDataMem, WriteData, Bimm, outrca1, outrca2, PCnext;
wire Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite;
wire zero;
wire [1:0] ALUop;
wire [3:0] ALUsel;
InstMem_h inst_mem(PC >> 2, InstMemOut);
RegFile regfile(clk_cpu, rst, InstMemOut[19:15], InstMemOut[24:20], InstMemOut[11:7], WriteData, RegWrite, readdata1, readdata2);
CU cu(InstMemOut, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite, ALUop);
ImmGen immgen(InstMemOut, Imm);
ALUcu alu_cu(InstMemOut, ALUop, ALUsel);
Mux2x1 mux(readdata2, Imm, ALUsrc, operand2);
ALU32bit alu(readdata1, operand2, ALUsel, ALUresult, zero);
DataMem_h data_mem(clk_cpu, MemRead, MemWrite, ALUresult >> 2, readdata2, ReadDataMem);
Mux2x1 mux2(ALUresult, ReadDataMem, MemtoReg, WriteData);
ShiftLeft1 s(Imm, Bimm);
RCA32 rca1(0, PC, 4, outrca1);
RCA32 rca2(0, PC, Bimm, outrca2);
Mux2x1 mux3(outrca1, outrca2, (Branch && zero), PCnext);
Four_Digit_Seven_Segment_Driver seg7 (clk_ssd, outputs, Anode, LED_out);
mux16x1 mux4(PC, outrca1, outrca2, PCnext, readdata1, readdata2, WriteData, Imm, Bimm, operand2, ALUresult, ReadDataMem, 0, 0, 0, 0, ssdSel, outputs);
mux4x1 mux5(InstMemOut[15:0], InstMemOut[31:16], {2'b0, zero, Branch, (Branch && zero), MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite, ALUop, ALUsel} , 0, ledSel, Leds);
always @(posedge clk_cpu, posedge rst)
begin
    if(rst)
        PC = 0;
    else
        PC = PCnext;
end
endmodule
