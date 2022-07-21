module check_me_1(
	input [4:0]sw,

	output [9:0]ledr
);

//wire [4:0]sw = 

wire temp;
assign temp = &sw[4:0]; //sw[4] & sw[3] & sw[2] & sw[1] & sw[0];
		 
assign ledr[9:0] = {10{temp}};

//assign ledr [9:0] = {{5{temp}}, 5'b11111};
//assign ledr [9:0] = 5'b11111 & {5{temp}};
//assign ledr = sw_0 & sw_1 ? 10'b1111111111 : 10'b0000000000;

endmodule