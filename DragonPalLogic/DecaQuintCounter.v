`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:12:00 05/31/2025 
// Design Name: 
// Module Name:    DecaQuintCounter 
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
module DecaQuintCounter(
    input A,
    output wire Qa
    );

	reg iqa = 0;
	reg[5:0] count = 0;
	
always @(posedge A) begin
	if (count < 50) begin
		count = count + 6'b000001;
		iqa = count > 24;
	end else begin
		count = 0;
		iqa = 0;
	end
end

assign Qa = iqa;

endmodule
