`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:45:14 05/31/2025 
// Design Name: 
// Module Name:    VClkPulseGenerator 
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
module VClkPulseGenerator(
    input nVCLK,
    output Pulse
    );

	reg[7:0] count;
	
	always @(negedge nVCLK) begin
		if (count < 228) begin
			count = count + 1;
		end else
			count = 0;
	end
	
	assign Pulse = count > 16;
endmodule
