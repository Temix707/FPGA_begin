module l3_format_out(
	input [9:0] SW,
	//input [7:0] LEDG,
	
	output [7:0] LEDG,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2

);

l3_format l3(SW[9:0], LEDG[7:0],HEX0[6:0], HEX1[6:0], HEX2[6:0]);

endmodule