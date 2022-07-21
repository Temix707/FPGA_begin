module l3_format (
	input [9:0] SW,
	//input [7:0] LEDG_dec,
	
	output [7:0] LEDG_bin,
	output reg [6:0] HEX0,
	output reg [6:0] HEX1,
	output reg [6:0] HEX2
);
//wire [7:0] sot_h = SW [9:8]; // 9 8 - с этих начинаются 100 200 ...

wire [7:0] bin_l = SW [3:0]; // 3 2 1 0 - с этих начинаются 0 1 2 ...
wire [7:0] dec_h = SW [9:4]; // 7 6 5 4 - с этих начинаются 10 20 ...

reg [7:0] bin_h;

always @* begin

	case(dec_h) 
	// двухзначные и  трехзначные числа на SW [9:4]
	//    SW                 LEDG
		4'b0000 : bin_h = 7'b0000000; //0
		4'b0001 : bin_h = 7'b0001010; //10
		4'b0010 : bin_h = 8'b00010100; //20
		4'b0011 : bin_h = 8'b00011110; //30
		4'b0100 : bin_h = 8'b00101000; //40
		4'b0101 : bin_h = 8'b00110010; //50
		4'b0110 : bin_h = 8'b00111100; //60
		4'b0111 : bin_h = 8'b01000110; //70
		4'b1000 : bin_h = 8'b01010000; //80
		4'b1001 : bin_h = 8'b01011010; //90
		5'b010000 : bin_h = 8'b01100100; //100
		6'b010001 : bin_h = 8'b01101110; //110
		6'b010010 : bin_h = 8'b01111000; //120
		6'b010011 : bin_h = 8'b10000010; //130
		6'b010100 : bin_h = 8'b10001100; //140
		6'b010101 : bin_h = 8'b10010110; //150
		6'b010110 : bin_h = 8'b10100000; //160
		6'b010111 : bin_h = 8'b10101010; //170
		6'b011000 : bin_h = 8'b10110100; //180
		6'b011001 : bin_h = 8'b10111110; //190
		6'b100000 : bin_h = 8'b11001000; //200
		6'b100001 : bin_h = 8'b11010010; //210
		6'b100010 : bin_h = 8'b11011100; //220
		6'b100011 : bin_h = 8'b11100110; //230
		6'b100100 : bin_h = 8'b11110000; //240
		6'b100101 : bin_h = 8'b11111010; //250
	endcase
	
	case(SW[3:0]) // вывод на HEX0
		4'b0000: HEX0 <= 7'b1000000; // 0
		4'b0001: HEX0 <= 7'b1111001; // 1
		4'b0010: HEX0 <= 7'b0100100; // 2
		4'b0011: HEX0 <= 7'b0110000; // 3
		4'b0100: HEX0 <= 7'b0011001; // 4
		4'b0101: HEX0 <= 7'b0010010; // 5
		4'b0110: HEX0 <= 7'b0000010; // 6
		4'b0111: HEX0 <= 7'b1111000; // 7
		4'b1000: HEX0 <= 7'b0000000; // 8
		4'b1001: HEX0 <= 7'b0010000; // 9
		default: HEX0 <= 7'b0000110; // Ошибка
	endcase
	
	case(SW[7:4]) // вывод на HEX1
		4'b0000: HEX1 <= 7'b1000000; // 0
		4'b0001: HEX1 <= 7'b1111001; // 1
		4'b0010: HEX1 <= 7'b0100100; // 2
		4'b0011: HEX1 <= 7'b0110000; // 3
		4'b0100: HEX1 <= 7'b0011001; // 4
		4'b0101: HEX1 <= 7'b0010010; // 5
		4'b0110: HEX1 <= 7'b0000010; // 6
		4'b0111: HEX1 <= 7'b1111000; // 7
		4'b1000: HEX1 <= 7'b0000000; // 8
		4'b1001: HEX1 <= 7'b0010000; // 9
		//default: HEX1 <= 7'b0000110; // Ошибка
	endcase
	
	case(SW[9:8]) // вывод на HEX2
		2'b00: HEX2 <= 7'b1000000; // 0
		2'b01: HEX2 <= 7'b1111001; // 1
		2'b10: HEX2 <= 7'b0100100; // 2
		//2'b11: HEX2 <= 7'b0110000; // 3
		default: HEX2 <= 7'b0000110; // Ошибка
	endcase
	
end

assign LEDG_bin = bin_h + bin_l; // Вывод на LEDG
endmodule









/*module l3_format(
  input data, enable, reset, clock,
  output reg q
);

always @(posedge clock)
  if (reset == 0)
    q = 1'b0;
  else if (enable==1)
    q = data;


endmodule
*/
/*
module l3_format(q, data, enable, reset, clock);
output q;
input data, enable, reset, clock;
reg q;

always @(posedge clock)
if (reset == 0)
q = 1'b0;
else if (enable==1)
q = data;
endmodule
*/