`include "definition.vh"
//
 module main(
   CLOCK_50,
   KEY,
   SW,

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


	input CLOCK_50;
   input [3:0] KEY;
   input [9:0] SW;

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

	wire resetn;
	assign resetn = KEY[0];

	// wire writeEn = KEY[1];

	// wire [8:0] colour_fat;
	// wire [8:0] colour_muscle;
	// assign colour_fat = 9'b011000000;
	// assign colour_muscle = 9'b111000000;

 keyboard_press_driver kpd(
   .CLOCK_50(CLOCK_50),
   .valid(valid),
   .makeBreak(makeBreak),
   .outCode(outCode),
   .PS2_DAT(PS2_DAT), // PS2 data line
   .PS2_CLK(PS2_CLK), // PS2 clock line
   .reset(resetn)
   );

  //  reg [5:0] user_press;
  //  reg steak[5:0];
  //  // keyboard logic
  //  // set high if is a MAKE signal
  //  always @ ( * ) begin
  //  if (valid) begin
  //     case(makeBreak)
  //       1'b0: begin //break
  //       // outCode is 6B in hexdecimal, key 4, steak 1
  //       if (outCode == 8'h6B) user_press[0] = 1'b0;
  //       // outCode is 73 in hexdecimal
  //       if (outCode == 8'h73) user_press[1] = 1'b0;
  //       // outCode is 74 in hexdecimal
  //       if (outCode == 8'h74) user_press[2] = 1'b0;
  //       // outCode is 69 in hexdecimal
  //       if (outCode == 8'h69) user_press[3] = 1'b0;
  //       // outCode is 72 in hexdecimal
  //       if (outCode == 8'h72) user_press[4] = 1'b0;
  //       // outCode is 7A in hexdecimal
  //       if (outCode == 8'h7A) user_press[5] = 1'b0;
  //       end
  //       1'b1: begin //make
  //       if (outCode == 8'h6B) user_press[0] = 1'b1;
  //       // outCode is 73 in hexdecimal
  //       if (outCode == 8'h73) user_press[1] = 1'b1;
  //       // outCode is 74 in hexdecimal
  //       if (outCode == 8'h74) user_press[2] = 1'b1;
  //       // outCode is 69 in hexdecimal
  //       if (outCode == 8'h69) user_press[3] = 1'b1;
  //       // outCode is 72 in hexdecimal
  //       if (outCode == 8'h72) user_press[4] = 1'b1;
  //       // outCode is 7A in hexdecimal
  //       if (outCode == 8'h7A) user_press[5] = 1'b1;
  //       end
  //     endcase
  //  end
	// end

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
