module steak_show_counter (
  input clk,
  input resetn,
  input steak_show_resetn,
  input [2:0] steakShowTime,
  output steakShow
  );

wire [25:0] one_sec = 26'b10111110101111000010000000; // 50M
wire clear;
reg [28:0] count;
always@(posedge clk) begin
  if (!resetn || steak_show_resetn) begin
    count <= 28'd0;
	end
  else if (clear) begin
    count <= 28'd0;
	end
  else begin
    count <= count + 28'd1;
	end
end
assign clear = (count == steakShowTime * one_sec);
assign steakShow = clear;
endmodule
