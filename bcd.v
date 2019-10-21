`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2019 02:09:37 PM
// Design Name: 
// Module Name: bcd
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


module BCD (
    input [12:0] binary,
    output reg [3:0] Thousands,
    output reg [3:0] Hundreds,
    output reg [3:0] Tens,
    output reg [3:0] Ones
    );
    
    
    
    integer i;
    always @(binary)
    begin
        //set 1000's, 100's, 10's, 1's to 0
        Thousands = 4'd0;
        Hundreds = 4'd0;
        Tens = 4'd0;
        Ones = 4'd0;
        
        for (i=12; i>=0; i=i-1)
        begin
            //add3 to columns >= 5
            if (Thousands >= 5)
                Thousands = Thousands + 3;
            if (Hundreds >= 5)
                Hundreds = Hundreds + 3;
            if (Tens >= 5)
                Tens = Tens + 3;
            if (Ones >= 5)
                Ones = Ones + 3;
                
            //shift left one
            Thousands = Thousands << 1;
            Thousands[0] = Hundreds[3];
            Hundreds = Hundreds << 1;
            Hundreds[0] = Tens[3];
            Tens = Tens << 1;
            Tens[0] = Ones[3];
            Ones = Ones << 1;
            Ones[0] = binary[i];
        end
    end
    
endmodule

