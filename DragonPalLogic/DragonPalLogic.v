`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Julian Brown
// 
// Create Date:    16:65:19 06/02/2025 
// Design Name: 	 PAL conversion logic
// Module Name:    DragonPalLogic 
// Project Name: 
// Target Devices: ATF1504ASL-44
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
module DragonPalLogic(
	input HSn,
	input FSn,
	input VClk,
	input Format,
	input E,
	input PALClock,
	output wire CLK,
	output wire HS,
	output wire LINE_PULSE,
	output wire LUMA_CONTROL,
	output wire CHROMA_CONTROL,
	output wire SYNC_CONTROL,
	output wire FrmFormat,
	output wire FormatClock
);

	wire	HLine24;
	wire	nHLine24uFS;
	reg	nextFormat;
	wire	VClkPulse;
	wire	ClkPulse;
	wire	clk;
	wire	hs;

	HSnCounter HSyncCounter(
		.HSn (HSn),
		.FSn (FSn),
		.Line24 (HLine24)
	);
	
	VClkInterposer interposer(
		.VClk (VClk),
		.Line24 (HLine24),
		.VClkPulse (VClkPulse),
		.Clk (Clk),
		.ClkPulse (ClkPulse)
	);
	
	VClkPulseGenerator pulseGenerator(
		.nVCLK (ClkPulse),
		.Pulse (VClkPulse)
	);
	
	LinePulseGenerator linePulseGenerator(
		.CLK (clk),
		.SYNC (hs),
		.Q (SYNC_CONTROL),
		.Q2 (CHROMA_CONTROL)
	);

	always @(posedge FSn) begin
		nextFormat = Format;
	end

	assign FrmFormat = nextFormat;

	assign FormatClock = (VClk && nextFormat) || (PALClock && !nextFormat);
	
	assign nHLine24uFS = !(HLine24 && FSn);
	
	assign LINE_PULSE = !VClkPulse;
	
	assign hs = HSn ^ VClkPulse;
	
	assign LUMA_CONTROL = 1;
	
	assign CLK = (VClk && nextFormat) || (clk && !nextFormat);
	
	assign HS = (HSn && nextFormat) || (hs && !nextFormat);

endmodule