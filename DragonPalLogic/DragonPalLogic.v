`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Julian Brown
// 
// Create Date:    16:65:19 06/02/2025 
// Design Name: 	 PAL conversion logic
// Module Name:    DragonPalLogic 
// Project Name: 
// Target Devices: ATF1504AS-44
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
	input HSn, //Horizontal Sync from VDG
	input FSn, //Frame Sync from VDG
	input VClk, //Video Clock from SAM
	input Format, //Format selection (low = PAL, high = NTSC)
	input PALClock, //PAL colour carrier clock
	output wire CLK, //Video Clock to SAM
	output wire HS, //Horizontal Sync to encoder
	output wire LINE_PULSE, //Artifical line pulse
	output wire PAD_LUMA, //Artificial horizontal line for PAL
	output wire LUMA_CONTROL, //Natural/padded luma
	output wire FrmFormat,
	output wire FormatClock
);

	wire	HLine24;
	reg	nextFormat;
	wire	VClkPulse;
	wire	ClkPulse;
	wire	clk2;
	wire	hs;
	wire	lumaCtl;

	//IC28 - 24 line delay
	HSnCounter HSyncCounter(
		.HSn (HSn),
		.FSn (FSn),
		.Line24 (HLine24)
	);
	
	VClkInterposer interposer(
		.VClk (VClk), // input video clock from SAM
		.Line24 (HLine24), // 24th line of display
		.VClkPulse (VClkPulse),
		.Clk (clk2), // switched video clock output for PAL
		.ClkPulse (ClkPulse),
		.Luma_Ctrl (lumaCtl)
	);
	
	VClkPulseGenerator pulseGenerator(
		.nVCLK (ClkPulse),
		.Pulse (VClkPulse)
	);
	
	always @(negedge FSn) begin
		nextFormat = Format;
	end

	assign FrmFormat = nextFormat;

	assign FormatClock = (VClk && nextFormat) || (PALClock && !nextFormat);
	
	assign LINE_PULSE = !VClkPulse;
	
	assign PAD_LUMA = VClkPulse;
	
	assign hs = HSn ^ VClkPulse;
	
	assign LUMA_CONTROL = nextFormat || (!nextFormat && lumaCtl);
	
	assign CLK = (VClk && nextFormat) || (clk2 && !nextFormat);
	
	assign HS = (HSn && nextFormat) || (hs && !nextFormat);

endmodule