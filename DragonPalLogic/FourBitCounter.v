`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:25:51 05/30/2025 
// Design Name: 
// Module Name:    4 bit counterr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fourBitCounter(
	input CLK,
	input RST,
	output [3:0] count
);

	reg [3:0] counter;

	always @(negedge CLK) begin
		if (!RST)
			counter = 4'b0000;
		else
			counter = counter + 4'b0001;
	end
	
	assign count = counter;

endmodule