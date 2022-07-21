module lr6(input [1:0]SW,input CLOCK_50,output [1:0]LEDR,output [3:0]LEDG,output reg[6:0]HEX0,output reg[6:0]HEX1,output reg[6:0]HEX2,output reg[6:0]HEX3);
parameter [3:0] reset=0,state1=1,state11=2,state110=3,state1100=4,state11001=5,state110011=6,state1100111=7,state11001110=8;

reg[3:0] currentState;
reg[24:0] counter;

initial begin
currentState = reset;
counter=25'b0;
HEX2=7'b1;
HEX1=7'b1;
end

always@(posedge CLOCK_50)
begin
counter=counter+1;
case(currentState)
4'b0000:
begin
HEX3=7'b0000001;
HEX0=7'b1001111;
end
4'b0001:
begin
HEX3=7'b1001111;
HEX0=7'b1001111;
end
4'b0010:
begin
HEX3=7'b0010010;
HEX0=7'b0000001;
end
4'b0011:
begin
HEX3=7'b0000110;
HEX0=7'b0000001;
end
4'b0100:
begin
HEX3=7'b1001100;
HEX0=7'b1001111;
end
4'b0101:
begin
HEX3=7'b0100100;
HEX0=7'b1001111;
end
4'b0110:
begin
HEX3=7'b0100000;
HEX0=7'b1001111;
end
4'b0111:
begin
HEX3=7'b0001111;
HEX0=7'b0000001;
end
4'b1000:
begin
HEX3=7'b0000000;
HEX0=7'b1111110;
end
endcase
end
always@(posedge counter[2])//для проверки
begin
if(SW[1])
 currentState=reset;
 else case(currentState)
reset:
begin
if(SW[0]==1'b1) currentState=state1;
else currentState=reset;
end

state1:
begin
if(SW[0]==1'b0) currentState=reset;
else currentState=state11;
end

state11:
begin
if(SW[0]==1'b0) currentState=state110;
else currentState=state11;
end

state110:
begin
if(SW[0]==1'b0) currentState=state1100;
else currentState=state1;
end

state1100:
begin
if(SW[0]==1'b0) currentState=reset;
else currentState=state11001;
end

state11001:
begin
if(SW[0]==1'b0) currentState=reset;
else currentState=state110011;
end

state110011:
begin
if(SW[0]==1'b0) currentState=reset;
else currentState=state1100111;
end

state1100111:
begin
if(SW[0]==1'b1) currentState=state11;
else currentState=state11001110;
end
state11001110:
begin
if(SW[0]==1'b1) currentState=state11;
else currentState=reset;
end
default:currentState=reset;
endcase
end
assign LEDG[3:0]=currentState[3:0];
assign LEDR[0]=(currentState==state11001110);
endmodule