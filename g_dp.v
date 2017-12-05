`include "definition.vh"

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
    reg [7:0] coorCounter_max;
    reg [7:0] coorCounter = 8'd0;
    always @(posedge clk)
    begin
      if (!resetn) begin
        coorCounter <= 8'd0;
        colourCounterEn <= 1'd0;
      end
      else if (coorCounter_clear) begin
        coorCounter <= 8'd0;
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
        // counter for x & y
        case(colourCounter)
          1'd0: begin
            colour = colour_fat;
            coorCounter_max = 8'd172;
            use_xy = 1'd1;
            end
          // counter for q & z
          1'd1: begin
           colour = colour_muscle;
           coorCounter_max = 8'd74;
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
          8'd1: begin
          x = `x1;
          y = `y1;
          q = `q1;
          z = `z1;
          end

          8'd2: begin
          x = `x2;
          y = `y2;
          q = `q2;
          z = `z2;
          end

          8'd3: begin
          x = `x3;
          y = `y3;
          q = `q3;
          z = `z3;
          end

          8'd4: begin
          x = `x4;
          y = `y4;
          q = `q4;
          z = `z4;
          end

          8'd5: begin
          x = `x5;
          y = `y5;
          q = `q5;
          z = `z5;
          end

          8'd6: begin
          x = `x6;
          y = `y6;
          q = `q6;
          z = `z6;
          end

          8'd7: begin
          x = `x7;
          y = `y7;
          q = `q7;
          z = `z7;
          end

          8'd8: begin
          x = `x8;
          y = `y8;
          q = `q8;
          z = `z8;
          end

          8'd9: begin
          x = `x9;
          y = `y9;
          q = `q9;
          z = `z9;
          end

          8'd10: begin
          x = `x10;
          y = `y10;
          q = `q10;
          z = `z10;
          end

          8'd11: begin
          x = `x11;
          y = `y11;
          q = `q11;
          z = `z11;
          end

          8'd12: begin
          x = `x12;
          y = `y12;
          q = `q12;
          z = `z12;
          end

          8'd13: begin
          x = `x13;
          y = `y13;
          q = `q13;
          z = `z13;
          end

          8'd14: begin
          x = `x14;
          y = `y14;
          q = `q14;
          z = `z14;
          end

          8'd15: begin
          x = `x15;
          y = `y15;
          q = `q15;
          z = `z15;
          end

          8'd16: begin
          x = `x16;
          y = `y16;
          q = `q16;
          z = `z16;
          end

          8'd17: begin
          x = `x17;
          y = `y17;
          q = `q17;
          z = `z17;
          end

          8'd18: begin
          x = `x18;
          y = `y18;
          q = `q18;
          z = `z18;
          end

          8'd19: begin
          x = `x19;
          y = `y19;
          q = `q19;
          z = `z19;
          end

          8'd20: begin
          x = `x20;
          y = `y20;
          q = `q20;
          z = `z20;
          end

          8'd21: begin
          x = `x21;
          y = `y21;
          q = `q21;
          z = `z21;
          end

          8'd22: begin
          x = `x22;
          y = `y22;
          q = `q22;
          z = `z22;
          end

          8'd23: begin
          x = `x23;
          y = `y23;
          q = `q23;
          z = `z23;
          end

          8'd24: begin
          x = `x24;
          y = `y24;
          q = `q24;
          z = `z24;
          end

          8'd25: begin
          x = `x25;
          y = `y25;
          q = `q25;
          z = `z25;
          end

          8'd26: begin
          x = `x26;
          y = `y26;
          q = `q26;
          z = `z26;
          end

          8'd27: begin
          x = `x27;
          y = `y27;
          q = `q27;
          z = `z27;
          end

          8'd28: begin
          x = `x28;
          y = `y28;
          q = `q28;
          z = `z28;
          end

          8'd29: begin
          x = `x29;
          y = `y29;
          q = `q29;
          z = `z29;
          end

          8'd30: begin
          x = `x30;
          y = `y30;
          q = `q30;
          z = `z30;
          end

          8'd31: begin
          x = `x31;
          y = `y31;
          q = `q31;
          z = `z31;
          end

          8'd32: begin
          x = `x32;
          y = `y32;
          q = `q32;
          z = `z32;
          end

          8'd33: begin
          x = `x33;
          y = `y33;
          q = `q33;
          z = `z33;
          end

          8'd34: begin
          x = `x34;
          y = `y34;
          q = `q34;
          z = `z34;
          end

          8'd35: begin
          x = `x35;
          y = `y35;
          q = `q35;
          z = `z35;
          end

          8'd36: begin
          x = `x36;
          y = `y36;
          q = `q36;
          z = `z36;
          end

          8'd37: begin
          x = `x37;
          y = `y37;
          q = `q37;
          z = `z37;
          end

          8'd38: begin
          x = `x38;
          y = `y38;
          q = `q38;
          z = `z38;
          end

          8'd39: begin
          x = `x39;
          y = `y39;
          q = `q39;
          z = `z39;
          end

          8'd40: begin
          x = `x40;
          y = `y40;
          q = `q40;
          z = `z40;
          end

          8'd41: begin
          x = `x41;
          y = `y41;
          q = `q41;
          z = `z41;
          end

          8'd42: begin
          x = `x42;
          y = `y42;
          q = `q42;
          z = `z42;
          end

          8'd43: begin
          x = `x43;
          y = `y43;
          q = `q43;
          z = `z43;
          end

          8'd44: begin
          x = `x44;
          y = `y44;
          q = `q44;
          z = `z44;
          end

          8'd45: begin
          x = `x45;
          y = `y45;
          q = `q45;
          z = `z45;
          end

          8'd46: begin
          x = `x46;
          y = `y46;
          q = `q46;
          z = `z46;
          end

          8'd47: begin
          x = `x47;
          y = `y47;
          q = `q47;
          z = `z47;
          end

          8'd48: begin
          x = `x48;
          y = `y48;
          q = `q48;
          z = `z48;
          end

          8'd49: begin
          x = `x49;
          y = `y49;
          q = `q49;
          z = `z49;
          end

          8'd50: begin
          x = `x50;
          y = `y50;
          q = `q50;
          z = `z50;
          end

          8'd51: begin
          x = `x51;
          y = `y51;
          q = `q51;
          z = `z51;
          end

          8'd52: begin
          x = `x52;
          y = `y52;
          q = `q52;
          z = `z52;
          end

          8'd53: begin
          x = `x53;
          y = `y53;
          q = `q53;
          z = `z53;
          end

          8'd54: begin
          x = `x54;
          y = `y54;
          q = `q54;
          z = `z54;
          end

          8'd55: begin
          x = `x55;
          y = `y55;
          q = `q55;
          z = `z55;
          end

          8'd56: begin
          x = `x56;
          y = `y56;
          q = `q56;
          z = `z56;
          end

          8'd57: begin
          x = `x57;
          y = `y57;
          q = `q57;
          z = `z57;
          end

          8'd58: begin
          x = `x58;
          y = `y58;
          q = `q58;
          z = `z58;
          end

          8'd59: begin
          x = `x59;
          y = `y59;
          q = `q59;
          z = `z59;
          end

          8'd60: begin
          x = `x60;
          y = `y60;
          q = `q60;
          z = `z60;
          end

          8'd61: begin
          x = `x61;
          y = `y61;
          q = `q61;
          z = `z61;
          end

          8'd62: begin
          x = `x62;
          y = `y62;
          q = `q62;
          z = `z62;
          end

          8'd63: begin
          x = `x63;
          y = `y63;
          q = `q63;
          z = `z63;
          end

          8'd64: begin
          x = `x64;
          y = `y64;
          q = `q64;
          z = `z64;
          end

          8'd65: begin
          x = `x65;
          y = `y65;
          q = `q65;
          z = `z65;
          end

          8'd66: begin
          x = `x66;
          y = `y66;
          q = `q66;
          z = `z66;
          end

          8'd67: begin
          x = `x67;
          y = `y67;
          q = `q67;
          z = `z67;
          end

          8'd68: begin
          x = `x68;
          y = `y68;
          q = `q68;
          z = `z68;
          end

          8'd69: begin
          x = `x69;
          y = `y69;
          q = `q69;
          z = `z69;
          end

          8'd70: begin
          x = `x70;
          y = `y70;
          q = `q70;
          z = `z70;
          end

          8'd71: begin
          x = `x71;
          y = `y71;
          q = `q71;
          z = `z71;
          end

          8'd72: begin
          x = `x72;
          y = `y72;
          q = `q72;
          z = `z72;
          end

          8'd73: begin
          x = `x73;
          y = `y73;
          q = `q73;
          z = `z73;
          end

          8'd74: begin
          x = `x74;
          y = `y74;
          q = `q74;
          z = `z74;
          end

          8'd75: begin
          x = `x75;
          y = `y75;
          end

          8'd76: begin
          x = `x76;
          y = `y76;
          end

          8'd77: begin
          x = `x77;
          y = `y77;
          end

          8'd78: begin
          x = `x78;
          y = `y78;
          end

          8'd79: begin
          x = `x79;
          y = `y79;
          end

          8'd80: begin
          x = `x80;
          y = `y80;
          end

          8'd81: begin
          x = `x81;
          y = `y81;
          end

          8'd82: begin
          x = `x82;
          y = `y82;
          end

          8'd83: begin
          x = `x83;
          y = `y83;
          end

          8'd84: begin
          x = `x84;
          y = `y84;
          end

          8'd85: begin
          x = `x85;
          y = `y85;
          end

          8'd86: begin
          x = `x86;
          y = `y86;
          end

          8'd87: begin
          x = `x87;
          y = `y87;
          end

          8'd88: begin
          x = `x88;
          y = `y88;
          end

          8'd89: begin
          x = `x89;
          y = `y89;
          end

          8'd90: begin
          x = `x90;
          y = `y90;
          end

          8'd91: begin
          x = `x91;
          y = `y91;
          end

          8'd92: begin
          x = `x92;
          y = `y92;
          end

          8'd93: begin
          x = `x93;
          y = `y93;
          end

          8'd94: begin
          x = `x94;
          y = `y94;
          end

          8'd95: begin
          x = `x95;
          y = `y95;
          end

          8'd96: begin
          x = `x96;
          y = `y96;
          end

          8'd97: begin
          x = `x97;
          y = `y97;
          end

          8'd98: begin
          x = `x98;
          y = `y98;
          end

          8'd99: begin
          x = `x99;
          y = `y99;
          end

          8'd100: begin
          x = `x100;
          y = `y100;
          end

          8'd101: begin
          x = `x101;
          y = `y101;
          end

          8'd102: begin
          x = `x102;
          y = `y102;
          end

          8'd103: begin
          x = `x103;
          y = `y103;
          end

          8'd104: begin
          x = `x104;
          y = `y104;
          end

          8'd105: begin
          x = `x105;
          y = `y105;
          end

          8'd106: begin
          x = `x106;
          y = `y106;
          end

          8'd107: begin
          x = `x107;
          y = `y107;
          end

          8'd108: begin
          x = `x108;
          y = `y108;
          end

          8'd109: begin
          x = `x109;
          y = `y109;
          end

          8'd110: begin
          x = `x110;
          y = `y110;
          end

          8'd111: begin
          x = `x111;
          y = `y111;
          end

          8'd112: begin
          x = `x112;
          y = `y112;
          end

          8'd113: begin
          x = `x113;
          y = `y113;
          end

          8'd114: begin
          x = `x114;
          y = `y114;
          end

          8'd115: begin
          x = `x115;
          y = `y115;
          end

          8'd116: begin
          x = `x116;
          y = `y116;
          end

          8'd117: begin
          x = `x117;
          y = `y117;
          end

          8'd118: begin
          x = `x118;
          y = `y118;
          end

          8'd119: begin
          x = `x119;
          y = `y119;
          end

          8'd120: begin
          x = `x120;
          y = `y120;
          end

          8'd121: begin
          x = `x121;
          y = `y121;
          end

          8'd122: begin
          x = `x122;
          y = `y122;
          end

          8'd123: begin
          x = `x123;
          y = `y123;
          end

          8'd124: begin
          x = `x124;
          y = `y124;
          end

          8'd125: begin
          x = `x125;
          y = `y125;
          end

          8'd126: begin
          x = `x126;
          y = `y126;
          end

          8'd127: begin
          x = `x127;
          y = `y127;
          end

          8'd128: begin
          x = `x128;
          y = `y128;
          end

          8'd129: begin
          x = `x129;
          y = `y129;
          end

          8'd130: begin
          x = `x130;
          y = `y130;
          end

          8'd131: begin
          x = `x131;
          y = `y131;
          end

          8'd132: begin
          x = `x132;
          y = `y132;
          end

          8'd133: begin
          x = `x133;
          y = `y133;
          end

          8'd134: begin
          x = `x134;
          y = `y134;
          end

          8'd135: begin
          x = `x135;
          y = `y135;
          end

          8'd136: begin
          x = `x136;
          y = `y136;
          end

          8'd137: begin
          x = `x137;
          y = `y137;
          end

          8'd138: begin
          x = `x138;
          y = `y138;
          end

          8'd139: begin
          x = `x139;
          y = `y139;
          end

          8'd140: begin
          x = `x140;
          y = `y140;
          end

          8'd141: begin
          x = `x141;
          y = `y141;
          end

          8'd142: begin
          x = `x142;
          y = `y142;
          end

          8'd143: begin
          x = `x143;
          y = `y143;
          end

          8'd144: begin
          x = `x144;
          y = `y144;
          end

          8'd145: begin
          x = `x145;
          y = `y145;
          end

          8'd146: begin
          x = `x146;
          y = `y146;
          end

          8'd147: begin
          x = `x147;
          y = `y147;
          end

          8'd148: begin
          x = `x148;
          y = `y148;
          end

          8'd149: begin
          x = `x149;
          y = `y149;
          end

          8'd150: begin
          x = `x150;
          y = `y150;
          end

          8'd151: begin
          x = `x151;
          y = `y151;
          end

          8'd152: begin
          x = `x152;
          y = `y152;
          end

          8'd153: begin
          x = `x153;
          y = `y153;
          end

          8'd154: begin
          x = `x154;
          y = `y154;
          end

          8'd155: begin
          x = `x155;
          y = `y155;
          end

          8'd156: begin
          x = `x156;
          y = `y156;
          end

          8'd157: begin
          x = `x157;
          y = `y157;
          end

          8'd158: begin
          x = `x158;
          y = `y158;
          end

          8'd159: begin
          x = `x159;
          y = `y159;
          end

          8'd160: begin
          x = `x160;
          y = `y160;
          end

          8'd161: begin
          x = `x161;
          y = `y161;
          end

          8'd162: begin
          x = `x162;
          y = `y162;
          end

          8'd163: begin
          x = `x163;
          y = `y163;
          end

          8'd164: begin
          x = `x164;
          y = `y164;
          end

          8'd165: begin
          x = `x165;
          y = `y165;
          end

          8'd166: begin
          x = `x166;
          y = `y166;
          end

          8'd167: begin
          x = `x167;
          y = `y167;
          end

          8'd168: begin
          x = `x168;
          y = `y168;
          end

          8'd169: begin
          x = `x169;
          y = `y169;
          end

          8'd170: begin
          x = `x170;
          y = `y170;
          end

          8'd171: begin
          x = `x171;
          y = `y171;
          end

          8'd172: begin
          x = `x172;
          y = `y172;
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
