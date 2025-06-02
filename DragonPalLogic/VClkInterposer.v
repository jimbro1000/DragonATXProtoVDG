`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:23:24 05/31/2025 
// Design Name: 
// Module Name:    VClkInterposer 
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
module VClkInterposer(
	input VClk,
	input Line24,
	input VClkPulse,
	output Clk,
	output Luma_Ctrl,
	output ClkPulse
);

	wire	pulse50;
	wire	c;
	wire	nVClk;
	wire	nClk;
	reg	q;

	DecaQuintCounter DQCounter(
		.A (VClkPulse),
		.Qa (pulse50)
	);

	assign c = Line24 ^ pulse50;
	assign nVClk = !VClk;
	
	always @(negedge c) begin
		q = nVClk;
	end
	
	assign nClk = (q && VClk);
	assign Clk = !nClk;
	assign Luma_Ctrl = nClk;
	assign ClkPulse = !(nClk && VClk);
endmodule