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
// Description: Generate a 3us pulse based on a 3.8MHz clk input
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

	 reg enable;
	 reg iq;
	 reg toggle;
	 reg iq2;
	 
	 wire rst;
	 wire ClkIn;
	 wire [3:0] counter;
	 
	 assign rst = (!toggle && !enable) || counter == 4'b1010;
	 assign ClkIn = (enable && CLK);
	 
	FourBitCounter countClk(
		.CLK(CLK),
		.RST(rst),
		.count(counter)
	);
	 
	 initial begin
		iq = 1;
		iq2 = 0;
		enable = 0;
		toggle = 0;
	 end
	 
	 always @(CLK, SYNC, toggle, enable) begin
		if (!SYNC) begin
			if(!toggle && !enable) begin
				enable = 1;
				toggle = 1;
				iq <= 0;
			end else begin
				if (counter == 4'b0000) begin
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
