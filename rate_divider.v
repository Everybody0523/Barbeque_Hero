module rate_divider(LEDR, CLOCK_50, SW);
 input CLOCK_50; input [9:0] SW; output [9:0] LEDR;  wire rate = 28'b0101111101011110000100000000; wire [27:0] q;  rateDivider r0 (SW[1], SW[0], CLOCK_50, rate, q); blinker bl0 (SW[0], q, LEDR[0]); endmodule 
