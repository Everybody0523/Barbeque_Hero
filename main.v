`include "definition.vh"
//
 module main(
   CLOCK_50,
   KEY,
   SW,
   HEX0,
   HEX1,
   HEX2,

   PS2_DAT, // PS2 data line
   PS2_CLK, // PS2 clock line

      // The ports below are for the VGA output.  Do not change.
      VGA_CLK,   						//	VGA Clock
      VGA_HS,							//	VGA H_SYNC
      VGA_VS,							//	VGA V_SYNC
      VGA_BLANK_N,						//	VGA BLANK
      VGA_SYNC_N,						//	VGA SYNC
      VGA_R,   						//	VGA Red[9:0]
      VGA_G,	 						//	VGA Green[9:0]
      VGA_B   						//	VGA Blue[9:0]
   );


   input PS2_DAT; // PS2 data line
   input PS2_CLK; // PS2 clock line
	 input CLOCK_50;
   input [3:0] KEY;
   input [9:0] SW;
   output [6:0] HEX0, HEX1, HEX2;

		// Declare your inputs and outputs here
	// Do not change the following outputs
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]


   wire [8:0] colour;
   wire [7:0] x_draw;
   wire [7:0] y_draw;
   wire signed [8:0] score;

	wire resetn;
	assign resetn = KEY[0];

  reg [5:0] user_press;
  wire [7:0] outCode;
  wire valid, makeBreak;
  
 keyboard_press_driver kpd(
   .CLOCK_50(CLOCK_50),
   .valid(valid),
   .makeBreak(makeBreak),
   .outCode(outCode),
   .PS2_DAT(PS2_DAT), // PS2 data line
   .PS2_CLK(PS2_CLK), // PS2 clock line
   .reset(resetn)
   );

   // keyboard logic
   always @ (posedge valid) begin
      case(makeBreak)
        1'b0:  //break
          case(outCode)
            8'h15: user_press[0] <= 1'b0;
            8'h1D: user_press[1] <= 1'b0;
            8'h24: user_press[2] <= 1'b0;
            8'h1C: user_press[3] <= 1'b0;
            8'h1B: user_press[4] <= 1'b0;
            8'h23: user_press[5] <= 1'b0;
				endcase
        1'b1: //make
          case(outCode)
            8'h15: user_press[0] <= 1'b1;
            8'h1D: user_press[1] <= 1'b1;
            8'h24: user_press[2] <= 1'b1;
            8'h1C: user_press[3] <= 1'b1;
            8'h1B: user_press[4] <= 1'b1;
            8'h23: user_press[5] <= 1'b1;
				endcase
		endcase
	end

  barbecue_hero bh(
    .clk(CLOCK_50),
    .resetn(resetn),
    .user_press({1'b1, 1'b1, 1'b1, KEY[3:1]}),

    .x_out(x_draw),
    .y_out(y_draw),
    .colour_out(colour)
    );


   vga_adapter VGA(
       .resetn(resetn),
       .clock(CLOCK_50),
       .colour(colour),
       .x(x_draw),
       .y(y_draw),
       .plot(1),
       /* Signals for the DAC to drive the monitor. */
       .VGA_R(VGA_R),
       .VGA_G(VGA_G),
       .VGA_B(VGA_B),
       .VGA_HS(VGA_HS),
       .VGA_VS(VGA_VS),
       .VGA_BLANK(VGA_BLANK_N),
       .VGA_SYNC(VGA_SYNC_N),
       .VGA_CLK(VGA_CLK));
     defparam VGA.RESOLUTION = "160x120";
     defparam VGA.MONOCHROME = "FALSE";
     defparam VGA.BITS_PER_COLOUR_CHANNEL = 3;
     defparam VGA.BACKGROUND_IMAGE = "black.mif";


   endmodule
