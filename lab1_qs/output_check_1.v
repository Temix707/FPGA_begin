module output_check_1(
input [4:0]SW,
output [9:0]LEDR

);


check_me_1 inst1 (SW[4:0], LEDR[9:0]);



endmodule