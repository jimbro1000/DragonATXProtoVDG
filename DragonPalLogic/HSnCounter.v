`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:23:24 05/31/2025 
// Design Name: 
// Module Name:    HSnCounter 
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
module HSnCounter(
    input HSn,
    input FSn,
    output Line24
    );

	reg[7:0] count;
	
	always @(negedge HSn) begin
		if (FSn) begin
			count = count + 1;
		end else
			count = 0;
	end
	
	assign Line24 = count[3] && count[4];
endmodule
