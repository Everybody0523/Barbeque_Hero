module bbqcounter(enable, reset_n, clock, val);
    input enable;
    input reset_n;
    input clock;
    output reg [1:0] val;

    always @(posedge clock or negedge reset_n)
    begin
        if (reset_n == 1'b0)
            val <= 2'b00;
        else if (enable == 1'b1)
            begin
                if (val == 2'b10)
                    val <= 2'b00;
                else
                    val <= val + 1'b1;
            end
    end
endmodule
