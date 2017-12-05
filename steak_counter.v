
module steak_counter(
  input clk,
  input resetn,
  output reg [0:0] go
  );

  reg [26:0] counter;
  initial counter = 0;
  wire [26:0] counter_max = 27'b101111101011110000100000000;
  wire counter_clear;
  initial go = 0;

  always@(posedge clk)
  begin
    if(!resetn) begin
      counter <= 0;
      go <= 0;
      end
    else if (counter_clear) begin
      counter <= 0;
      go <= ~go;
      end
    else begin
      counter <= counter + 1;
      end
  end
  assign counter_clear = (counter == counter_max);

endmodule
