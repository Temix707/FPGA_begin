module stopwatch_l5(
input [1:0]       KEY,
input             CLOCK_50,
output reg [6:0]  HEX0,
output reg [6:0]  HEX1,
output reg [6:0]  HEX2,
output reg [6:0]  HEX3,

output reg [9:0]  LEDR,
output reg [7:0]  LEDG
);

reg [18:0] impulses_cout;

reg [3:0]  one_first_sec; 	// 1
reg [3:0]  one_second_sec; // 11
reg [3:0]  one_third_sec; 	// 111
reg [3:0]  one_fourth_sec; // 1111

initial HEX0 = 7'b1111111;
initial HEX1 = 7'b1111111;
initial HEX2 = 7'b1111111;
initial HEX3 = 7'b1111111;
initial LEDR = 10'b0000000000;

initial one_first_sec = 4'b0;
initial one_second_sec = 4'b0;
initial one_third_sec = 4'b0;
initial one_fourth_sec = 4'b0;

always @( posedge CLOCK_50 or posedge KEY[0] ) begin
	if (KEY[0]) begin					// Если 1, то сбрасыет время
		one_first_sec <= one_first_sec;
		one_second_sec <= one_second_sec;
		one_third_sec <= one_third_sec;
		one_fourth_sec <= one_fourth_sec;	
	end else begin
		impulses_cout <= impulses_cout + 1;
		
		// Если в проектируемом таймере использовать кварцевый генератор с 
		// частотой 50 МГц, то одной секунде соответствует 50 миллионов тактовых импульсов, а 
		// одной сотой секунды соответствует 500 тысяч тактовых импульсов
		
		/*if (impulses_cout == 19'b1111010000100011111) begin
			LEDR[9:0] = 10'b1111111111;
		end*/
		
		if (impulses_cout == 19'd49_999_999) begin // 499999
			one_first_sec <= one_first_sec + 1;
			impulses_cout <= 19'b0;
		end
		if (one_first_sec == 4'b1010) begin 			 //  10
			one_second_sec <= one_second_sec + 1;
			one_first_sec <= 0;
		end
		
		if (one_second_sec == 4'b1010) begin				 //  10
			one_third_sec <= one_third_sec + 1;
			LEDR[9:0] <= 10'b1111111111;
			one_second_sec <= 0;
		end 
		
		if ((one_second_sec == 4'd2) && (one_first_sec == 4'd2)) begin
			LEDR[9:0] <= 10'b0000000000;
		end
		if ((one_third_sec == 4'd0) && (one_second_sec == 4'd1)) begin
			LEDG[7:0] <= 10'b00000000;
		end
		/*if(imp_cout_sixz == 8'd33) begin
			LEDR[9:0] <= 10'b1111111111;
			
		end else begin
			LEDR[9:0] <= 10'b0000000000;
		end*/
		if (one_third_sec == 4'b1010) begin						 //  10
			one_fourth_sec <= one_fourth_sec + 1;
			LEDG[7:0] <= 10'b11111111;
			one_third_sec <= 0;
		end
		if (one_fourth_sec == 4'b1010) begin					 //  10
			one_first_sec <= 4'b0;
			one_second_sec <= 4'b0;
			one_third_sec <= 4'b0;
			one_fourth_sec <= 4'b0;
		end
		
	end
case(one_first_sec)
	0: HEX0 = 7'b1000000;
	1: HEX0 = 7'b1111001;
	2: HEX0 = 7'b0100100;
	3:	HEX0 = 7'b0110000;
	4:	HEX0 = 7'b0011001;
	5:	HEX0 = 7'b0010010;
	6:	HEX0 = 7'b0000010;
	7:	HEX0 = 7'b1111000;
	8:	HEX0 = 7'b0000000;
	9:	HEX0 = 7'b0010000;
endcase


case(one_second_sec)
	0: HEX1 = 7'b1000000;
	1: HEX1 = 7'b1111001;
	2: HEX1 = 7'b0100100;
	3:	HEX1 = 7'b0110000;
	4:	HEX1 = 7'b0011001;
	5:	HEX1 = 7'b0010010;
	6:	HEX1 = 7'b0000010;
	7:	HEX1 = 7'b1111000;
	8:	HEX1 = 7'b0000000;
	9:	HEX1 = 7'b0010000;
endcase

case(one_third_sec)
	0: HEX2 = 7'b1000000;
	1: HEX2 = 7'b1111001;
	2: HEX2 = 7'b0100100;
	3:	HEX2 = 7'b0110000;
	4:	HEX2 = 7'b0011001;
	5:	HEX2 = 7'b0010010;
	6:	HEX2 = 7'b0000010;
	7:	HEX2 = 7'b1111000;
	8:	HEX2 = 7'b0000000;
	9:	HEX2 = 7'b0010000;
endcase

case(one_fourth_sec)
	0: HEX3 = 7'b1000000;
	1: HEX3 = 7'b1111001;
	2: HEX3 = 7'b0100100;
	3:	HEX3 = 7'b0110000;
	4:	HEX3 = 7'b0011001;
	5:	HEX3 = 7'b0010010;
	6:	HEX3 = 7'b0000010;
	7:	HEX3 = 7'b1111000;
	8:	HEX3 = 7'b0000000;
	9:	HEX3 = 7'b0010000;
endcase	
end

endmodule