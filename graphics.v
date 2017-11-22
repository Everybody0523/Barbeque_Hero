// /**
//   * Six pieces of meat at six fix positions on the screen
//   * Scoreboard? Too difficult to use text to represent scores
//   * - use stacks of good stake and bad stake at the top of the screen as the score system
//   *
//   *
// **/
//
`include "definition.vh"
//
// module graphics(
//   input clk,
//   input resetn,
//   input writeEn,
//   input colour_muscle,
//   input colour_fat,
//
//   output			VGA_CLK,   				//	VGA Clock
//   output			VGA_HS,				//	VGA H_SYNC
//   output			VGA_VS,					//	VGA V_SYNC
//   output			VGA_BLANK_N,				//	VGA BLANK
//   output			VGA_SYNC_N,				//	VGA SYNC
//   output	[9:0]	VGA_R,   				//	VGA Red[9:0]
//   output	[9:0]	VGA_G,	 				//	VGA Green[9:0]
//   output	[9:0]	VGA_B   				//	VGA Blue[9:0]
//   );
//
//
//   wire [8:0] colour;
//   wire [7:0] x;
//   wire [7:0] y;
//
//
//   vga_adapter VGA(
//       .resetn(resetn),
//       .clock(CLOCK_50),
//       .colour(colour),
//       .x(x_draw),
//       .y(y_draw),
//       .plot(writeEn),
//       /* Signals for the DAC to drive the monitor. */
//       .VGA_R(VGA_R),
//       .VGA_G(VGA_G),
//       .VGA_B(VGA_B),
//       .VGA_HS(VGA_HS),
//       .VGA_VS(VGA_VS),
//       .VGA_BLANK(VGA_BLANK_N),
//       .VGA_SYNC(VGA_SYNC_N),
//       .VGA_CLK(VGA_CLK));
//     defparam VGA.RESOLUTION = "160x120";
//     defparam VGA.MONOCHROME = "FALSE";
//     defparam VGA.BITS_PER_COLOUR_CHANNEL = 3;
//     defparam VGA.BACKGROUND_IMAGE = "black.mif";
//
//
//   endmodule


    // // count every three seconds
    // always @(posedge clk or negedge resetn)
    // begin
    //   if (!resetn)
    //     coorCounter <= 21'd0;
    //   else if (coorCounter_clear)
    //     coorCounter <= 21'd0;
    //   else
    //   begin
    //     coorCounter <= coorCounter + 1'b1;
    //   end
    // end
    // assign coorCounter_clear = (coorCounter == (21'd1500000-1));

module g_dp(
    input clk,
    input resetn,
    input [8:0] colour_fat,
    input [8:0] colour_muscle,

    output reg [7:0] x_draw,
    output reg [7:0] y_draw,
    output reg [8:0] colour
    );

    // counter that counts the color pointer
    // counter that output different x coordinates of fat
    reg [0:0] colourCounter = 1'd0;
    reg [0:0] colourCounterEn = 1'd0;
    wire [0:0] coorCounter_clear;
    reg [4:0] coorCounter_max;
    reg [4:0] coorCounter = 5'd0;
    always @(posedge clk)
    begin
      if (!resetn) begin
        coorCounter <= 5'd0;
        colourCounterEn <= 1'd0;
      end
      else if (coorCounter_clear) begin
        coorCounter <= 5'd0;
        colourCounterEn <= ~colourCounterEn;
      end
      else begin
        coorCounter <= coorCounter + 1;
      end
    end
    assign coorCounter_clear = (coorCounter == coorCounter_max);


    always @(posedge colourCounterEn)
    begin
      if(!resetn)
        colourCounter <= 1'd0;
      else begin
        colourCounter <= ~colourCounter;
      end
    end


    reg [0:0] use_xy, use_qz;
    always @(*)
    begin: control_vga_signals

        colour = 9'd0;
        use_xy = 1'd0;
        use_qz = 1'd0;

        case(colourCounter)
          1'd0: begin
            colour = colour_fat;
            coorCounter_max = 5'd20;
            use_xy = 1'd1;
            end

          1'd1: begin
           colour = colour_muscle;
           coorCounter_max = 5'd15;
           use_qz = 1'd1;
           end
        endcase
    end


    reg [7:0] x, y, q, z;
    always @(*)
    begin

      x = 8'd0;
      y = 8'd0;
      q = 8'd0;
      z = 8'd0;

      case(coorCounter)
        5'd0: begin
          x = `x1;
          y = `y1;
          q = `q1;
          z = `z1;
          end

        5'd1: begin
          x = `x2;
          y = `y2;
          q = `q2;
          z = `z2;
          end

        5'd2: begin
          x = `x3;
          y = `y3;
          q = `q3;
          z = `z3;
          end
        5'd3: begin
          x = `x4;
          y = `y4;
          q = `q4;
          z = `z4;
          end
        5'd4: begin
          x = `x5;
          y = `y5;
          q = `q5;
          z = `z5;
          end
        5'd5: begin
          x = `x6;
          y = `y6;
          q = `q6;
          z = `z6;
          end
        5'd6: begin
          x = `x7;
          y = `y7;
          q = `q7;
          z = `z7;
          end
        5'd7: begin
          x = `x8;
          y = `y8;
          q = `q8;
          z = `z8;
          end
        5'd8: begin
          x = `x9;
          y = `y9;
          q = `q9;
          z = `z9;
          end
        5'd9: begin
          x = `x10;
          y = `y10;
          q = `q10;
          z = `z10;
          end
        5'd10: begin
          x = `x11;
          y = `y11;
          q = `q11;
          z = `z11;
          end
        5'd11: begin
          x = `x12;
          y = `y12;
          q = `q12;
          z = `z12;
          end
        5'd12: begin
          x = `x13;
          y = `y13;
          q = `q13;
          z = `z13;
          end
        5'd13: begin
          x = `x14;
          y = `y14;
          q = `q14;
          z = `z14;
          end
        5'd14: begin
          x = `x15;
          y = `y15;
          q = `q15;
          z = `z15;
          end
        5'd15: begin
          x = `x16;
          y = `y16;
          q = `q16;
          z = `z16;
          end
        5'd16: begin
          x = `x17;
          y = `y17;
          end
        5'd17: begin
          x = `x18;
          y = `y18;
          end
        5'd18: begin
          x = `x19;
          y = `y19;
          end
        5'd19: begin
          x = `x20;
          y = `y20;
          end
        5'd20: begin
          x = `x21;
          y = `y21;
          end
      endcase
    end

    always @ ( * ) begin
      if (use_xy) begin
        x_draw = x;
        y_draw = y;
        end
      else if (use_qz) begin
        x_draw = q;
        y_draw = z;
        end
    end

endmodule
