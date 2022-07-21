module output_check_2(
	input [9:0]SW,

	input [3:0]KEY,
	output [6:0]HEX0,
	output [6:0]HEX1,
	output [6:0]HEX2,
	output [6:0]HEX3
);

lab2_check inst2(SW[9:0], KEY[3:0], HEX0[6:0], HEX1[6:0], HEX2[6:0], HEX3[6:0]);


endmodule