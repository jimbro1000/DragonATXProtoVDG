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
//	wire	nClk;
	reg	q;

	//IC32
	DecaQuintCounter DQCounter(
		.A (VClkPulse),
		.Qa (pulse50)
	);
	
	// IC14C
	assign c = Line24 ^ pulse50;
	assign nVClk = !VClk;
	
	// IC232B - q is clock inhibit
	always @(negedge c) begin
		q = nVClk;
	end
	
//	assign nClk = (q && VClk);
	// IC22D
	assign Clk = !(q && VClk);
	assign Luma_Ctrl = !q;
	// IC22C
	assign ClkPulse = !(Luma_Ctrl && VClk);
endmodule