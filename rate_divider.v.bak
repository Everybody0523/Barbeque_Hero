module rate_divider(SW, CLOCK_50, HEX0);
    input [4:0] SW;
    input CLOCK_50;
    output [6:0] HEX0;
    /*
    * SW[4] is reset_n - have it be 0 to reset, which makes no sense.
    * SW[3] enables the rate divider when it is high
    * SW[2] is just there to look pretty
    * SW[1] and SW[0] control the rate
    */

    wire [27:0] big = 28'b0101111101011110000100000000;

    wire [27:0] garrotte;
    wire strangle;
    dipshit rdiv(
        .enable(SW[3]),
        .reset_n(SW[4]),
        .clock(CLOCK_50),
        .rate(big),
        .q(garrotte)
    );

    wire a;
    assign a = (garrotte == 0) ? 1 : 0;
    wire [3:0] gandalf;
    dpCounter dpc0(
        .enable(a),
        .reset_n(SW[4]),
        .cock(CLOCK_50),
        .wizard(gandalf)
    );

    sevenSegDisplay dipshit(
        .A(gandalf),
        .HEX(HEX0)
    );

endmodule

// The display counter.
module dpCounter(enable, reset_n, cock, wizard);
    input enable;
    input reset_n;
    input cock;
    output [3:0] wizard;

    reg [3:0] q;
    always @(posedge cock or negedge reset_n)
    begin
        if (reset_n == 1'b0)
            q <= 0;
        else if (enable == 1)
            q <= q + 1;
    end
    assign wizard[0] = q[0];
    assign wizard[1] = q[1];
    assign wizard[2] = q[2];
    assign wizard[3] = q[3];
endmodule

// The actual Rate Divider
module dipshit(enable, reset_n, clock, rate, q);
    input enable;
    input reset_n;
    input clock;
    input [27:0] rate;
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
            Y <= 28'b0000000000000000000000000001;
        else if (s0 & ~s1)
            Y <= 28'b0010111110101111000010000000;
        else if (~s0 & s1)
            assign Y = 28'b0101111101011110000100000000;
        else
            assign Y = 28'b1011111010111100001000000000;
    end
endmodule
*/
/*
|-----------------------------------------------------------------------|
|                                                                       |
|                         This class sucks                              |
|                     Also this is the segment code                     |
|                                                                       |
|-----------------------------------------------------------------------|
*/
module segmentZero(c0, c1, c2, c3, y);
	input c0;
	input c1;
	input c2;
	input c3;
	output y;
	// So, so, SO much
	assign y = ~(~c0 & ~c2 | c1 & ~c3 | c1 & c2 | ~c0 & c3 | c0 & c2 & ~c3 | ~c1 & ~c2 & c3);
endmodule

module segmentOne(c0, c1, c2, c3, y);
	input c0;
	input c1;
	input c2;
	input c3;
	output y;
	// It's nearly 2:00 AM and I'm sitting in BA typing this, while I would rather be anywhere else
	//assign y = ~(~c1 & ~c2 | c1 & ~c3 | ~c0 & ~c1 & c3);
	assign y = ~(~c3 & ~c2 | ~c2 & ~c0 | ~c3 & ~c1 & ~c0 | ~c3 & c1 & c0 | c3 & ~c1 & c0);
endmodule

module segmentTwo(c0, c1, c2, c3, y);
	input c0;
	input c1;
	input c2;
	input c3;
	output y;

	assign y = ~(~c1 & ~c3 | c0 & ~c3 | c0 & ~c1 | c2 & ~c3 | ~c2 & c3);
endmodule

module segmentThree(c0, c1, c2, c3, y);
	input c0;
	input c1;
	input c2;
	input c3;
	output y;

	assign y = ~(~c1 & c3 | ~c0 & ~c2 & ~c3 | c0 & c1 & ~c2 | c0 & ~c1 & c2 | ~c0 & c1 & c2 | ~c3 & ~c2 & c1);
endmodule

module segmentFour(c0, c1, c2, c3, y);
	input c0;
	input c1;
	input c2;
	input c3;
	output y;

	assign y = ~(~c0 & ~c2 | ~c0 & c1 | c1 & c3 | c2 & c3);
endmodule

module segmentFive(c0, c1, c2, c3, y);
	input c0;
	input c1;
	input c2;
	input c3;
	output y;

	assign y = ~(~c0 & ~c1 | ~c0 & c2 | ~c2 & c3 | c1 & c3 | ~c1 & c2 & ~c3);
endmodule

module segmentSix(c0, c1, c2, c3, y);
	input c0;
	input c1;
	input c2;
	input c3;
	output y;

	assign y = ~(c1 & ~c2 | ~c0 & c1 | ~c2 & c3 | c0 & c3 | ~c1 & c2 & ~c3);
endmodule

module sevenSegDisplay(A, HEX);
	input [3:0] A;
	output [6:0] HEX;

	segmentZero u0(
		.c0(A[0]),
		.c1(A[1]),
		.c2(A[2]),
		.c3(A[3]),
		.y(HEX[0])
	);

		segmentOne u1(
		.c0(A[0]),
		.c1(A[1]),
		.c2(A[2]),
		.c3(A[3]),
		.y(HEX[1])
	);

		segmentTwo u2(
		.c0(A[0]),
		.c1(A[1]),
		.c2(A[2]),
		.c3(A[3]),
		.y(HEX[2])
	);

		segmentThree u3(
		.c0(A[0]),
		.c1(A[1]),
		.c2(A[2]),
		.c3(A[3]),
		.y(HEX[3])
	);

		segmentFour u4(
		.c0(A[0]),
		.c1(A[1]),
		.c2(A[2]),
		.c3(A[3]),
		.y(HEX[4])
	);

		segmentFive u5(
		.c0(A[0]),
		.c1(A[1]),
		.c2(A[2]),
		.c3(A[3]),
		.y(HEX[5])
	);

		segmentSix u6(
		.c0(A[0]),
		.c1(A[1]),
		.c2(A[2]),
		.c3(A[3]),
		.y(HEX[6])
	);
endmodule
