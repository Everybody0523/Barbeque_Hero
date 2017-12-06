module score_counter(
  input clk,
  input resetn,
  input ld_result,
  input signed [8:0] cur_score,
  output reg signed [8:0] total_score
  );

  always@(posedge clk) begin
    if (!resetn)
      total_score <= 9'd0;
    else if (ld_result)
      total_score <= total_score + cur_score;
  end

endmodule
