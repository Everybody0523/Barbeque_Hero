`include "definition.vh"

// this module draws 6 pieces of meat on screen, which changes colour themselves
module barbecue_hero(
    input clk,
    input resetn,
    input [5:0] user_press, //here for testing
    output [7:0] x_out,
    output [7:0] y_out,
    output reg [8:0] colour_out
    );

    wire [2:0] index;
    wire [0:0] go;

    pixal_counter p_counter0(
        .clk(clk),
        .resetn(resetn),
        .go(go)
      );

    // a counter that counts from 0 to 5;
    graphics_counter couter0(
      .clk(clk),
      .resetn(resetn),
      .go(go),
      .counter(index)
      );

    wire [8:0] colour_fat_0;
    wire [8:0] colour_fat_1;
    wire [8:0] colour_fat_2;
    wire [8:0] colour_fat_3;
    wire [8:0] colour_fat_4;
    wire [8:0] colour_fat_5;

    wire [8:0] colour_muscle_0;
    wire [8:0] colour_muscle_1;
    wire [8:0] colour_muscle_2;
    wire [8:0] colour_muscle_3;
    wire [8:0] colour_muscle_4;
    wire [8:0] colour_muscle_5;

    wire [8:0] colour_out0;
    wire [8:0] colour_out1;
    wire [8:0] colour_out2;
    wire [8:0] colour_out3;
    wire [8:0] colour_out4;
    wire [8:0] colour_out5;


    wire [7:0] x_draw_0;
    wire [7:0] x_draw_1;
    wire [7:0] x_draw_2;
    wire [7:0] x_draw_3;
    wire [7:0] x_draw_4;
    wire [7:0] x_draw_5;

    wire [7:0] y_draw_0;
    wire [7:0] y_draw_1;
    wire [7:0] y_draw_2;
    wire [7:0] y_draw_3;
    wire [7:0] y_draw_4;
    wire [7:0] y_draw_5;

    wire clockEn0, clockEn1, clockEn2, clockEn3, clockEn4, clockEn5;

    wire counter_wire_0;
    wire counter_wire_1;
    wire counter_wire_2;
    wire counter_wire_3;
    wire counter_wire_4;
    wire counter_wire_5;


    steak_counter sc0(clk, resetn, clockEn0, counter_wire_0);
    steak_counter sc1(clk, resetn, clockEn1, counter_wire_1);
    steak_counter sc2(clk, resetn, clockEn2, counter_wire_2);
    steak_counter sc3(clk, resetn, clockEn3, counter_wire_3);
    steak_counter sc4(clk, resetn, clockEn4, counter_wire_4);
    steak_counter sc5(clk, resetn, clockEn5, counter_wire_5);

    wire [2:0] steak_show_time_0, steak_show_time_1, steak_show_time_2, steak_show_time_3, steak_show_time_4, steak_show_time_5;
    wire steak_show_resetn_0, steak_show_resetn_1, steak_show_resetn_2, steak_show_resetn_3, steak_show_resetn_4, steak_show_resetn_5;
    wire steak_show_0, steak_show_1, steak_show_2, steak_show_3, steak_show_4, steak_show_5;

    steak_show_counter ssc0(clk, resetn, steak_show_resetn_0, steak_show_time_0, steak_show_0);
    steak_show_counter ssc1(clk, resetn, steak_show_resetn_1, steak_show_time_1, steak_show_1);
    steak_show_counter ssc2(clk, resetn, steak_show_resetn_2, steak_show_time_2, steak_show_2);
    steak_show_counter ssc3(clk, resetn, steak_show_resetn_3, steak_show_time_3, steak_show_3);
    steak_show_counter ssc4(clk, resetn, steak_show_resetn_4, steak_show_time_4, steak_show_4);
    steak_show_counter ssc5(clk, resetn, steak_show_resetn_5, steak_show_time_5, steak_show_5);


    // instantiate 6 graphics controllers ===============================
    controller c0(
      .clk(clk),

      .clock(counter_wire_0),
      .resetn(resetn),
      .flip(~user_press[0]),
      .colour_fat(colour_fat_0),
      .colour_muscle(colour_muscle_0),
      .steakShowTime(steak_show_time_0),
      .steak_show_resetn(steak_show_resetn_0),
      .clockEn(clockEn0),
      .show(steak_show_0)
      );


    controller c1(
      .clk(clk),

      .clock(counter_wire_1),
      .resetn(resetn),
      .flip(~user_press[1]),
      .colour_fat(colour_fat_1),
      .colour_muscle(colour_muscle_1),
      .steakShowTime(steak_show_time_1),
      .steak_show_resetn(steak_show_resetn_1),
      .clockEn(clockEn1),
      .show(steak_show_1)
      );


    controller c2(
      .clk(clk),

      .clock(counter_wire_2),
      .resetn(resetn),
      .flip(~user_press[2]),
      .colour_fat(colour_fat_2),
      .colour_muscle(colour_muscle_2),
      .steakShowTime(steak_show_time_2),
      .steak_show_resetn(steak_show_resetn_2),
      .clockEn(clockEn2),
      .show(steak_show_2)
      );


    controller c3(
      .clk(clk),

      .clock(counter_wire_3),
      .resetn(resetn),
      .flip(~user_press[3]),
      .colour_fat(colour_fat_3),
      .colour_muscle(colour_muscle_3),
      .steakShowTime(steak_show_time_3),
      .steak_show_resetn(steak_show_resetn_3),
      .clockEn(clockEn3),
      .show(steak_show_3)
      );


    controller c4(
      .clk(clk),

      .clock(counter_wire_4),
      .resetn(resetn),
      .flip(~user_press[4]),
      .colour_fat(colour_fat_4),
      .colour_muscle(colour_muscle_4),
      .steakShowTime(steak_show_time_4),
      .steak_show_resetn(steak_show_resetn_4),
      .clockEn(clockEn4),
      .show(steak_show_4)
      );


    controller c5(
      .clk(clk),

      .clock(counter_wire_5),
      .resetn(resetn),
      .flip(~user_press[5]),
      .colour_fat(colour_fat_5),
      .colour_muscle(colour_muscle_5),
      .steakShowTime(steak_show_time_5),
      .steak_show_resetn(steak_show_resetn_5),
      .clockEn(clockEn5),
      .show(steak_show_5)
      );

    // instantiate 6 graphics datapath connected to controllers =========

    wire [7:0] x_adder0 = `x_adder0;
    wire [7:0] x_adder1 = `x_adder1;
    wire [7:0] x_adder2 = `x_adder2;
    wire [7:0] x_adder3 = `x_adder3;
    wire [7:0] x_adder4 = `x_adder4;
    wire [7:0] x_adder5 = `x_adder5;

    wire [7:0] y_adder0 = `y_adder0;
    wire [7:0] y_adder1 = `y_adder1;
    wire [7:0] y_adder2 = `y_adder2;
    wire [7:0] y_adder3 = `y_adder3;
    wire [7:0] y_adder4 = `y_adder4;
    wire [7:0] y_adder5 = `y_adder5;


    g_dp g0(clk, resetn, colour_fat_0, colour_muscle_0, x_adder0, y_adder0, x_draw_0, y_draw_0, colour_out0);
    g_dp g1(clk, resetn, colour_fat_1, colour_muscle_1, x_adder1, y_adder1, x_draw_1, y_draw_1, colour_out1);
    g_dp g2(clk, resetn, colour_fat_2, colour_muscle_2, x_adder2, y_adder2, x_draw_2, y_draw_2, colour_out2);
    g_dp g3(clk, resetn, colour_fat_3, colour_muscle_3, x_adder3, y_adder3, x_draw_3, y_draw_3, colour_out3);
    g_dp g4(clk, resetn, colour_fat_4, colour_muscle_4, x_adder4, y_adder4, x_draw_4, y_draw_4, colour_out4);
    g_dp g5(clk, resetn, colour_fat_5, colour_muscle_5, x_adder5, y_adder5, x_draw_5, y_draw_5, colour_out5);

    //todo: connect g_dp's to the user interaction controller.i


    reg [7:0] x_draw;
    reg [7:0] y_draw;

    always @ ( * ) begin
      case(index)
        3'd0: begin
          x_draw = x_draw_0;
          y_draw = y_draw_0;
          colour_out = colour_out0;
        end
        3'd1: begin
          x_draw = x_draw_1;
          y_draw = y_draw_1;
          colour_out = colour_out1;
        end
        3'd2: begin
          x_draw = x_draw_2;
          y_draw = y_draw_2;
          colour_out = colour_out2;
        end
        3'd3: begin
          x_draw = x_draw_3;
          y_draw = y_draw_3;
          colour_out = colour_out3;
        end
        3'd4: begin
          x_draw = x_draw_4;
          y_draw = y_draw_4;
          colour_out = colour_out4;
        end
        3'd5: begin
          x_draw = x_draw_5;
          y_draw = y_draw_5;
          colour_out = colour_out5;
        end
      endcase
    end

    assign x_out = x_draw;
    assign y_out = y_draw;

endmodule




module game_controller(
  input clk,
  input resetn,
  input go,
  output reg [8:0] colour_fat,
  output reg [8:0] colour_muscle
  );

endmodule


module graphics_counter(
    input clk,
    input resetn,
    input go,

    output reg [2:0] counter
    );

    // a counter that counts from 0 to 5;
    initial counter = 3'd0;
    wire [2:0] counter_max = 3'd5;
    wire counter_clear;
    always @(posedge clk)
    begin
      if (!resetn)
        counter <= 3'd0;
      else if (counter_clear)
          counter <= 3'd0;
      else if (go)
          counter <= counter + 1;
    end
    assign counter_clear = (counter == counter_max);
endmodule


module pixal_counter(
    input clk,
    input resetn,
    output go
  );

  // a counter that counts the number of pixals to draw, could be longer
  reg [7:0] p_counter = 8'd0;
  wire [7:0] p_counter_max = 8'd250;
  wire p_counter_clear;
  always @(posedge clk)
  begin
    if (!resetn)
      p_counter <= 8'd0;
    else if (p_counter_clear)
      p_counter <= 8'd0;
    else
      p_counter <= p_counter + 1;
  end
  assign p_counter_clear = (p_counter == p_counter_max);
  assign go = p_counter_clear;
endmodule
