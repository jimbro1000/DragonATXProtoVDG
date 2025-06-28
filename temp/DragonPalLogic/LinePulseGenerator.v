`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:25:51 05/30/2025 
// Design Name: 
// Module Name:    PulseGenerator 
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
module LinePulseGenerator(
    input CLK,
    input SYNC,
    output wire Q,
    output wire Q2
    );

	 reg[3:0] counter;
	 reg enable;
	 reg iq;
	 reg toggle;
	 reg iq2;
	 
	 initial begin
		iq = 1;
		iq2 = 0;
		counter = 0;
		enable = 0;
		toggle = 0;
	 end
	 
	 always @(CLK, SYNC) begin
		if (!SYNC) begin
			if(!toggle && !enable) begin
				enable = 1;
				toggle = 1;
				counter <= 0;
				iq <= 0;
			end else if (enable && CLK) begin
				counter <= counter + 1;
				if (counter == 10) begin
					iq <= 1;
					enable = !enable;
					iq2 <= !iq2;
				end
			end
		end else toggle = 0;
	 end
	 
	 assign Q = iq;
	 assign Q2 = iq2;
endmodule
