module lr4dop(
input [1:0]SW,
input CLOCK_50,
output reg [6:0]HEX0=7'b1,
output reg [6:0]HEX1=7'b1,
output reg [6:0]HEX2=7'b1,
output reg [6:0]HEX3=7'b1
);
reg [6:0] MEMORY[0:9];
reg[31:0] COUNTER;
reg[2:0] STR;
reg[3:0] STRT;
reg[3:0] CNTR;
initial $readmemb("mem.txt",MEMORY);
initial STR=3'b0;
initial STRT=4'b0110;
initial COUNTER=32'b0;
initial CNTR=4'b0;
always@(posedge CLOCK_50)
begin
COUNTER=COUNTER+1;
end
always@(posedge COUNTER[2])//чтобы на временной диаграмме можно было проверить
begin
if(~SW[1]) begin
if(~SW[0]) begin
HEX3=HEX2;
HEX2=HEX1;
HEX1=HEX0;
HEX0=MEMORY[STR];
STR=STR+1;
if(STR==3'b110)
STR=3'b000;
end
end
if (SW[0]) begin
HEX3=HEX2;
HEX2=HEX1;
HEX1=HEX0;
HEX0=MEMORY[STRT];
STRT=STRT+1;
if(STRT==4'b1011)
STRT=4'b0110;
end
if (SW[1]) begin
HEX3=HEX2;
HEX2=HEX1;
HEX1=HEX0;
HEX0=MEMORY[CNTR];
CNTR=CNTR+1;
if(CNTR==4'b1011)
CNTR=4'b0000;
end
end
endmodule  