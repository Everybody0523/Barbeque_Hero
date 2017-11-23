module rate_divider(LEDR, CLOCK_50, SW);
	input CLOCK_50;
	input [9:0] SW;
	output [9:0] LEDR;

	wire rate = 28'b0101111101011110000100000000;
	wire [27:0] q;

	rateDivider r0 (SW[1], SW[0], CLOCK_50, rate, q);
    wire enableBlinker;
    assign enableBlinker = (q == 0) ? 1 : 0;
	//blinker bl0 (SW[0], q, LEDR[0]);
    assign LEDR[0] = enableBlinker;

endmodule


module blinker(reset_n, clock, blink);
    input reset_n;
    input clock;
    output [0:0] blink;

	 reg q = 1'b0;
    always @(negedge clock or negedge reset_n)
    begin
        if (reset_n == 1'b0)
            q <= 0;
        else
            q <= ~q;
    end
	 assign blink = q;
endmodule

// The actual Rate Divider
module rateDivider(enable, reset_n, clock, rate, q);
    input enable; // Yes.
    input reset_n; //Synchronous Reset. But the clock goes so fast the
    // difference between synchronous and asynchronous should barely be
    // noticiable.
    input clock; //Should be hooked to CLOCK_50 on the DE1
    input [27:0] rate; // The desired rate.
    output q;
    reg [27:0] q;
    always @(posedge clock)
    begin
        if (reset_n == 1'b0)
            q <= 28'b0000000000000000000000000000;
        else if (enable == 1'b1)
            begin
                if (q == (rate - 1))
                    q <= 28'b0000000000000000000000000000;
                else
                    q <= q + 1'b1;
            end
    end
endmodule

/*
module rateMux(s0, s1, Y);
    input s0;
    input s1;
    output [27:0] Y;
    reg [27:0] Y;
    always @(*)
    begin
        if (~s0 & ~s1)
            assign Y = 28'b0000000000000000000000000001;
        else if (s0 & ~s1)
            assign Y = 28'b0010111110101111000010000000;
        else if (~s0 & s1)
            assign Y = 28'b0101111101011110000100000000;
        else
            assign Y = 28'b1011111010111100001000000000;
    end
endmodule
*/
