module random(
  input clk,
  output reg [2:0] random
  );

  initial random = 3'd1; // make it random

  always @ (posedge clk) begin
      if (random == 3'd7) begin
          random <= 3'd1;
      end else begin
          random <= random + 3'd1;
      end
	end

endmodule
