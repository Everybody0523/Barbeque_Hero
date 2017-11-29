module g_dp(
    input clk,
    input resetn,
    input [8:0] colour_fat,
    input [8:0] colour_muscle,
    input [7:0] x_adder,
    input [7:0] y_adder,

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

      x = `x1;
      y = `y1;
      q = `q1;
      z = `z1;

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
        x_draw = x + x_adder;
        y_draw = y + y_adder;
        end
      else if (use_qz) begin
        x_draw = q + x_adder;
        y_draw = z + y_adder;
        end
    end

endmodule
