module works
	#(parameter N = 7, M = 4)
	(input CLOCK_50,
	input [9:0]SW,
	input [M-1:0] KEY,
	//output reg[9:0]LEDR,
	output reg [N-1:0]HEX0,
	output reg [N-1:0]HEX1,
	output reg [N-1:0]HEX2,
	output reg [N-1:0]HEX3,
	
	output reg[M-1:0] add_sw_30,
	output reg[M-1:0] add_sw_96,
	output reg[M-1:0] add_num_30,
	output reg[M-1:0] add_num_96,
	output reg[18:0] impulses_cout
);

initial begin
	$display ("TEST Started");
	HEX0[6:0] = 8'b1111111; 
	HEX1[6:0] = 8'b1111111; 
	HEX2[6:0] = 8'b1111111; 
	HEX3[6:0] = 8'b1111111; 
	add_sw_30[3:0] = 4'b0000;
	add_sw_96[3:0] = 4'b0000;
end

always @(*) begin
		
		add_sw_30[3:0] = SW[3:0];
		add_sw_96[3:0] = SW[9:6];
	
	if(~KEY[3])begin
		add_sw_96[3:0] = add_sw_96[3:0] - 4'd1;
		//add_sw_30[3:0] <= add_sw_30[3:0] + 1'd1;
	end
	
	case(add_sw_96[3:0])
		4'd0: HEX3[6:0] = 7'b1000000; //0 
		4'd1: HEX3[6:0] = 7'b1111001; //1 
		4'd2: HEX3[6:0] = 7'b0100100; //2 
		4'd3: HEX3[6:0] = 7'b0110000; //3 
		4'd4: HEX3[6:0] = 7'b0011001; //4 
		4'd5: HEX3[6:0] = 7'b0010010; //5 
		4'd6: HEX3[6:0] = 7'b0000010; //6 
		4'd7: HEX3[6:0] = 7'b1111000; //7 
		4'd8: HEX3[6:0] = 7'b0000000; //8 
		4'd9: HEX3[6:0] = 7'b0010000; //9 
		default: HEX3[6:0] = 7'b0000110; 
	endcase
	
	case(add_sw_30[3:0])
		4'd0: HEX2[6:0] = 7'b1000000; //0 
		4'd1: HEX2[6:0] = 7'b1111001; //1
		4'd2: HEX2[6:0] = 7'b0100100; //2
		4'd3: HEX2[6:0] = 7'b0110000; //3 
		4'd4: HEX2[6:0] = 7'b0011001; //4 
		4'd5: HEX2[6:0] = 7'b0010010; //5 
		4'd6: HEX2[6:0] = 7'b0000010; //6 
		4'd7: HEX2[6:0] = 7'b1111000; //7 
		4'd8: HEX2[6:0] = 7'b0000000; //8
		4'd9: HEX2[6:0] = 7'b0010000; //9 
		default: HEX2[6:0] = 7'b0000110;
	endcase

end
endmodule