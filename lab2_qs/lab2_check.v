module lab2_check( 
	input [9:0] SW,
	input [3:0] KEY,
	output reg[6:0] HEX0, 
	output reg[6:0] HEX1,
	output reg[6:0] HEX2,
	output reg[6:0] HEX3
);

always @* begin
	case(KEY[3] ^ SW[9])
		1'b0:HEX3 = 7'b0001001;
		1'b1:HEX3 = 7'b1111111;
	endcase
	
	case(KEY[2] ^ SW[9])
		1'b0:HEX2 = 7'b0000110; 
		1'b1:HEX2 = 7'b1111111;
	endcase
	
	case(KEY[1] ^ SW[9])
		1'b0:HEX1 = 7'b1001110; 
		1'b1:HEX1 = 7'b1111111;
	endcase
	
	case(KEY[0] ^ SW[9])
		1'b0:HEX0 = 7'b0001100; 
		1'b1:HEX0 = 7'b1111111;
	endcase

end

endmodule



/*
module lab2_check( 
	input [9:0] SW,
	input [3:0] KEY,
	output [6:0] HEX0, 
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3
);

assign HEX3[6:0] = (KEY[3] & SW[9]) ? 7'b1111111 : 7'b0001001;
assign HEX2[6:0] = (KEY[2] & SW[9]) ? 7'b1111111 : 7'b0000110;
assign HEX1[6:0] = (KEY[1] & SW[9]) ? 7'b1111111 : 7'b1001110;
assign HEX0[6:0] = (KEY[0] & SW[9]) ? 7'b1111111 : 7'b0001100;

endmodule
*/