// The actual Rate Divider
module dipshit(enable, reset_n, clock, rate, q);
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
