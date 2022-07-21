module shift_reg_l4(
input CLOCK_50,
input [0:0] SW,
input [1:0] KEY,

output [9:0] LEDR,
output reg [9:0] shift_rg_ledr,

output [7:0] LEDG,
output reg [7:0] shift_rg_ledg,

output reg flag
);

initial shift_rg_ledr = 10'b0;
initial shift_rg_ledg = 8'b0;
initial flag = 1;

always @(posedge CLOCK_50 or posedge ~KEY[1]) begin
	if (~KEY[1]) begin			//0 - при нажатии
		shift_rg_ledr = 10'b0;
		shift_rg_ledg = 8'b0;
	end 
	else begin
		if (~KEY[0]) begin 		
			if (flag) begin	// Флаг открывается	
				flag = 0;		// Флаг закрыввается 
				shift_rg_ledr = {shift_rg_ledr[8:0], SW[0]};
				shift_rg_ledg = {SW[0], shift_rg_ledg[7:1]};
			end
		end
		else if (KEY[0]) begin
			flag = 1;
		end
	end
end
	
assign LEDR[9:0] = shift_rg_ledr[9:0];
assign LEDG[7:0] = shift_rg_ledg[7:0];
endmodule



























/*module shift_reg_l4(
	input clk,
	input en,
	input [0:0] sw,
	input rst,
	
	output reg [9:0] ledr
);


initial ledr = 10'b0;
	
always @(posedge en or posedge rst) begin
	if(rst) begin
		ledr <= 10'b0;
	end else begin
		if (en) begin
			ledr <= {ledr[8:0], sw};
		end else begin
			ledr <= ledr;
		end
	end
end
endmodule
		*/	

























/*
module shift_reg_l4(
input CLOCK_50,
input [1:0]SW,
input [1:0]KEY,
output [9:0]LEDR,
output [6:0]LEDG
);

reg [9:0]S;
reg [6:0]COUNTER;
reg EN;
reg [2:0]K;
reg [2:0]SBROS;
reg SBR;

initial S=10'b0000000000;
initial K=3'b000;
initial COUNTER=7'b0000000;

always@(negedge CLOCK_50) begin
	K[2:0]={K[1:0],KEY[0]};
	if (~K[2]&K[1])
		EN=1;
	else
		EN=0;
end

always@(negedge CLOCK_50) begin
	SBROS[2:0]={SBROS[1:0],KEY[1]};
	if (~SBROS[2]&SBROS[1])
		SBR=1;
	else
		SBR=0;
end

always@(posedge CLOCK_50) begin
	if (SBR) begin
		S[9:0]<=10'b0000000000;
		COUNTER=7'b0000000;
	end
	if (EN) begin
		S[9:0]<={S[8:0],SW[0]};
		if ((S[9]+S[8]+S[7]+S[6]+S[5]+S[4]+S[3]+S[2]+S[1]+S[0])>4'd5)
		COUNTER=COUNTER+1;
	end
end

assign LEDR[9:0]=S[9:0];
assign LEDG[6:0]=COUNTER[6:0];

endmodule
*/








/*
/module shift_reg_l4(

	input CLOCK_50,
	input [1:0] KEY,
	input [9:0] SW,
	//input ISL, 
	
	//output reg OSL,
	output [9:0] LEDG,
	output [9:0] LEDR,
	output reg [6:0] HEX0
	//output reg [6:0] HEX1
);

reg noth_reg;

reg [9:0] LEDR_st_rg;

reg[32:0] counter;
reg[6:0] counter_;
reg[2:0] as_r;

initial HEX0 = 7'b1111111;
initial LEDR_st_rg = 10'b0;

/*always @ (posedge CLOCK_50) begin
	as_r = {as_r[2:1], KEY[1]};
		if (as_r[2] && ~as_r[1])
			noth_reg = 1;
		else 
			noth_reg = 0;
			if(noth_reg)
				LEDR_st_rg = 10'b0;
	counter = counter + 1;
end*/
	
/*always @(posedge counter[19]) begin
	if(KEY[1]) begin
			LEDR_st_rg = 10'b0; // Все значения сбрасываются
	end
	//else begin
		if((SW[0]) && (KEY[0])) begin 
			LEDR_st_rg [9:0] = {LEDR_st_rg[8:0], SW[0]};
			//OSL = LEDR_st_rg[9];
		end
		else begin
			if((~SW[0]) && (KEY[0])) begin
				LEDR_st_rg [9:0] = {LEDR_st_rg[8:0], ~SW[0]};
				//OSL = LEDR_st_rg[9];
			end
		end	
	
	if(LEDR_st_rg[9:5] > LEDR_st_rg[4:0])
		HEX0 <= 7'b1111001; // 1
	else 
		HEX0 <= 7'b1000000; // 0
	counter_=counter_+1;
end
assign LEDG[9:0] = counter_;
assign LEDR [9:0] = LEDR_st_rg [9:0];

endmodule
	

*/




//shift_reg_left_4bit
/*module shift_reg_l4(
	input clk,
	input en,
	input ISL,
	input rst,
	output reg OSL,
	output reg [3:0]shift_rg
);
initial shift_rg= 4'b0;

always @(posedge clk) begin
	if(rst) begin
		shift_rg <= 4'b0;
		OSL <= 1'b0;
	end 
	else begin
		if(en) begin 
			shift_rg <= {shift_rg[2:0], ISL};
			OSL <= shift_rg[3];
		end 
		else begin 
			OSL <= 1'b0;
			shift_rg <= shift_rg;
			end
		end
	end
endmodule
*/





// counter_8bit
/*module shift_reg_l4(
	input clk,
	input en,
	input rst,
	output reg [7:0]counter
);
	
initial counter = 8'b0;

always @(posedge clk or posedge rst) begin
	if(rst) 
		counter <= 0;
	else begin
		if(en) 
			counter <= counter + 1;
		else 
			counter <= counter;
	end
end
endmodule*/





/*module shift_reg_l4(
	input [7:0]d,
	input clk,
	input rst,
	input en,
	output reg [7:0]q
);

initial q <= 8'b0;
	
always @(posedge clk or posedge rst) begin
	if(rst) 
		q <= 7'b0;
	else begin
		if(en) 
			q <= d;
		else 
			q<= q;
			
	end 
end 

endmodule
*/



/*module shift_reg_l4(
	input d,
	input clk,
	input set,
	input rst,
	input en,
	output reg q);


always @(posedge clk or posedge set or posedge rst )begin
	if(set)
		q <= 1'b1;
	else begin
		if(rst) 
			q <= 1'b0;
		else begin 
			if(en) 
				q <= d;
			else q <= q;
		end
	end
end

endmodule*/





/*module shift_reg_l4(
	input d,
	input en,
	output reg q);
	
always @(en, d) begin
	if(en) 
		q <= d;// запись
	else
		q <= q; // хранение
	end 

endmodule*/




/*module shift_reg_l4(
	input nR,
	input nS,
	output Q,
	output nQ);
	
assign Q = ~(nS & nQ); // есои nS=0, то Q автоматом становится = 1
//   =>
assign nQ = ~(nR & Q); // есои nR=0, то nQ автоматом становится = 1

endmodule*/






































/*module shift_reg_l4(
input CLOCK_50,
input [0:0] SW,
input [1:0] KEY,

output [9:0] LEDR,
output reg [7:0] cout,
output reg [3:0] high_bit,
output reg [6:0] low_bit,
output reg [9:0] shift_rg,
output reg [6:0] HEX0,
output reg [6:0] HEX1,
output reg [6:0] HEX2,
output reg [6:0] HEX3,
output reg flag
);

initial cout = 8'b0;

initial shift_rg = 10'b0;
initial HEX0 = 7'b0;
initial HEX1 = 7'b0;
initial HEX2 = 7'b1111111;
initial HEX3 = 7'b1111111;
initial flag = 1;

always @(posedge CLOCK_50 or posedge ~KEY[1]) begin
	if (~KEY[1]) begin
		shift_rg = 10'b0;
		cout = 8'b0;
	end else begin
		if (~KEY[0]) begin
			if (flag) begin
				flag = 0;
				shift_rg = {shift_rg[8:0], SW[0]};
				if (~^shift_rg[9:0]) begin
					cout <= cout + 1;
				end
			end
		end
		else if (KEY[0]) begin
			flag = 1;
		end
	end
end

assign LEDR[9:0] = shift_rg[9:0];
endmodule



























/*module shift_reg_l4(
	input clk,
	input en,
	input [0:0] sw,
	input rst,
	
	output reg [9:0] ledr
);


initial ledr = 10'b0;
	
always @(posedge en or posedge rst) begin
	if(rst) begin
		ledr <= 10'b0;
	end else begin
		if (en) begin
			ledr <= {ledr[8:0], sw};
		end else begin
			ledr <= ledr;
		end
	end
end
endmodule
		*/	

























/*
module shift_reg_l4(
input CLOCK_50,
input [1:0]SW,
input [1:0]KEY,
output [9:0]LEDR,
output [6:0]LEDG
);

reg [9:0]S;
reg [6:0]COUNTER;
reg EN;
reg [2:0]K;
reg [2:0]SBROS;
reg SBR;

initial S=10'b0000000000;
initial K=3'b000;
initial COUNTER=7'b0000000;

always@(negedge CLOCK_50) begin
	K[2:0]={K[1:0],KEY[0]};
	if (~K[2]&K[1])
		EN=1;
	else
		EN=0;
end

always@(negedge CLOCK_50) begin
	SBROS[2:0]={SBROS[1:0],KEY[1]};
	if (~SBROS[2]&SBROS[1])
		SBR=1;
	else
		SBR=0;
end

always@(posedge CLOCK_50) begin
	if (SBR) begin
		S[9:0]<=10'b0000000000;
		COUNTER=7'b0000000;
	end
	if (EN) begin
		S[9:0]<={S[8:0],SW[0]};
		if ((S[9]+S[8]+S[7]+S[6]+S[5]+S[4]+S[3]+S[2]+S[1]+S[0])>4'd5)
		COUNTER=COUNTER+1;
	end
end

assign LEDR[9:0]=S[9:0];
assign LEDG[6:0]=COUNTER[6:0];

endmodule
*/








/*
/module shift_reg_l4(

	input CLOCK_50,
	input [1:0] KEY,
	input [9:0] SW,
	//input ISL, 
	
	//output reg OSL,
	output [9:0] LEDG,
	output [9:0] LEDR,
	output reg [6:0] HEX0
	//output reg [6:0] HEX1
);

reg noth_reg;

reg [9:0] LEDR_st_rg;

reg[32:0] counter;
reg[6:0] counter_;
reg[2:0] as_r;

initial HEX0 = 7'b1111111;
initial LEDR_st_rg = 10'b0;

/*always @ (posedge CLOCK_50) begin
	as_r = {as_r[2:1], KEY[1]};
		if (as_r[2] && ~as_r[1])
			noth_reg = 1;
		else 
			noth_reg = 0;
			if(noth_reg)
				LEDR_st_rg = 10'b0;
	counter = counter + 1;
end*/
	
/*always @(posedge counter[19]) begin
	if(KEY[1]) begin
			LEDR_st_rg = 10'b0; // Все значения сбрасываются
	end
	//else begin
		if((SW[0]) && (KEY[0])) begin 
			LEDR_st_rg [9:0] = {LEDR_st_rg[8:0], SW[0]};
			//OSL = LEDR_st_rg[9];
		end
		else begin
			if((~SW[0]) && (KEY[0])) begin
				LEDR_st_rg [9:0] = {LEDR_st_rg[8:0], ~SW[0]};
				//OSL = LEDR_st_rg[9];
			end
		end	
	
	if(LEDR_st_rg[9:5] > LEDR_st_rg[4:0])
		HEX0 <= 7'b1111001; // 1
	else 
		HEX0 <= 7'b1000000; // 0
	counter_=counter_+1;
end
assign LEDG[9:0] = counter_;
assign LEDR [9:0] = LEDR_st_rg [9:0];

endmodule
	

*/




//shift_reg_left_4bit
/*module shift_reg_l4(
	input clk,
	input en,
	input ISL,
	input rst,
	output reg OSL,
	output reg [3:0]shift_rg
);
initial shift_rg= 4'b0;

always @(posedge clk) begin
	if(rst) begin
		shift_rg <= 4'b0;
		OSL <= 1'b0;
	end 
	else begin
		if(en) begin 
			shift_rg <= {shift_rg[2:0], ISL};
			OSL <= shift_rg[3];
		end 
		else begin 
			OSL <= 1'b0;
			shift_rg <= shift_rg;
			end
		end
	end
endmodule
*/





// counter_8bit
/*module shift_reg_l4(
	input clk,
	input en,
	input rst,
	output reg [7:0]counter
);
	
initial counter = 8'b0;

always @(posedge clk or posedge rst) begin
	if(rst) 
		counter <= 0;
	else begin
		if(en) 
			counter <= counter + 1;
		else 
			counter <= counter;
	end
end
endmodule*/





/*module shift_reg_l4(
	input [7:0]d,
	input clk,
	input rst,
	input en,
	output reg [7:0]q
);

initial q <= 8'b0;
	
always @(posedge clk or posedge rst) begin
	if(rst) 
		q <= 7'b0;
	else begin
		if(en) 
			q <= d;
		else 
			q<= q;
			
	end 
end 

endmodule
*/



/*module shift_reg_l4(
	input d,
	input clk,
	input set,
	input rst,
	input en,
	output reg q);


always @(posedge clk or posedge set or posedge rst )begin
	if(set)
		q <= 1'b1;
	else begin
		if(rst) 
			q <= 1'b0;
		else begin 
			if(en) 
				q <= d;
			else q <= q;
		end
	end
end

endmodule*/





/*module shift_reg_l4(
	input d,
	input en,
	output reg q);
	
always @(en, d) begin
	if(en) 
		q <= d;// запись
	else
		q <= q; // хранение
	end 

endmodule*/




/*module shift_reg_l4(
	input nR,
	input nS,
	output Q,
	output nQ);
	
assign Q = ~(nS & nQ); // есои nS=0, то Q автоматом становится = 1
//   =>
assign nQ = ~(nR & Q); // есои nR=0, то nQ автоматом становится = 1

endmodule*/