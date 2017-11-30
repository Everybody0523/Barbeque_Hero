module controller(clk, clock, resetn, flip, colour_muscle, colour_fat);
    input clk;
    input clock;
    input resetn;
    input flip;
    output reg [8:0] colour_muscle; //One of the colours
    output reg [8:0] colour_fat; //The other colour
    //8 states for a steak: Non-Existent, Raw, Rare, Medium-Rare, Medium,
    //Medium-Well, Well Done, Burnt. We need ceil(log_2(8)) = 3 states.

    reg [3:0] current_state;
    reg [3:0] next_state;

    localparam  S_STEAK_NONEXISTENT = 4'd0,
                S_STEAK_NONEXISTENT_WAIT = 4'd1,
                S_STEAK_RAW = 4'd2,
                S_STEAK_RAW_WAIT = 4'd3,
                S_STEAK_RARE = 4'd4,
                S_STEAK_RARE_WAIT = 4'd5,
                S_STEAK_MEDIUMRARE = 4'd6,
                S_STEAK_MEDIUMRARE_WAIT = 4'd7,
                S_STEAK_MEDIUM = 4'd8,
                S_STEAK_MEDIUM_WAIT = 4'd9,
                S_STEAK_MEDIUMWELL = 4'd10,
                S_STEAK_MEDIUMWELL_WAIT = 4'd11,
                S_STEAK_WELLDONE = 4'd12,
                S_STEAK_WELLDONE_WAIT = 4'd13,
                S_STEAK_BURNT = 4'd14,
                S_STEAK_BURNT_WAIT = 4'd15;

    //Next state logic aka our state table
    always@(*)
    begin: state_table
        case (current_state)
            S_STEAK_NONEXISTENT: begin
            next_state = flip ? S_STEAK_NONEXISTENT_WAIT : S_STEAK_NONEXISTENT;
            end
            S_STEAK_NONEXISTENT_WAIT: begin
            next_state = flip ? S_STEAK_NONEXISTENT_WAIT : S_STEAK_RAW;
            end

            S_STEAK_RAW: begin
            if (flip == 1'b1)
            next_state = S_STEAK_RAW_WAIT;
            else if (clock == 1'b1)
            next_state = S_STEAK_RARE;
            else
            next_state = S_STEAK_RAW;
            end

            S_STEAK_RAW_WAIT: begin
            next_state = flip ? S_STEAK_RAW_WAIT : S_STEAK_RARE;
            end

            S_STEAK_RARE: begin
            //next_state = flip ? S_STEAK_RARE_WAIT : S_STEAK_RARE;
            if (flip == 1'b1)
            next_state = S_STEAK_RARE_WAIT;
            else if (clock == 1'b1)
            next_state = S_STEAK_MEDIUMRARE;
            else
            next_state = S_STEAK_RARE;
            end

            S_STEAK_RARE_WAIT: begin
            next_state = flip ? S_STEAK_RARE_WAIT : S_STEAK_MEDIUMRARE;
            end

            S_STEAK_MEDIUMRARE: begin
            //next_state = flip ? S_STEAK_MEDIUMRARE_WAIT : S_STEAK_MEDIUMRARE;
            if (flip == 1'b1)
            next_state = S_STEAK_MEDIUMRARE_WAIT;
            else if (clock == 1'b1)
            next_state = S_STEAK_MEDIUM;
            else
            next_state = S_STEAK_MEDIUMRARE;
            end

            S_STEAK_MEDIUMRARE_WAIT: begin
            next_state = flip ? S_STEAK_MEDIUMRARE_WAIT : S_STEAK_MEDIUM;
            end

            S_STEAK_MEDIUM: begin
            if (flip == 1'b1)
            next_state = S_STEAK_MEDIUM_WAIT;
            else if (clock == 1'b1)
            next_state = S_STEAK_MEDIUMWELL;
            else
            next_state = S_STEAK_MEDIUM;
            end //next_state = flip ? S_STEAK_MEDIUM_WAIT : S_STEAK_MEDIUM;

            S_STEAK_MEDIUM_WAIT: begin
            next_state = flip ? S_STEAK_MEDIUM_WAIT : S_STEAK_MEDIUMWELL;
            end

            S_STEAK_MEDIUMWELL: begin
            //next_state = flip ? S_STEAK_MEDIUMWELL_WAIT : S_STEAK_MEDIUMWELL;
            if (flip == 1'b1)
            next_state = S_STEAK_MEDIUMWELL_WAIT;
            else if (clock == 1'b1)
            next_state = S_STEAK_WELLDONE;
            else
            next_state = S_STEAK_MEDIUMWELL;
            end

            S_STEAK_MEDIUMWELL_WAIT: begin
            next_state = flip ? S_STEAK_MEDIUMWELL_WAIT : S_STEAK_WELLDONE;
            end

            S_STEAK_WELLDONE: begin
            //next_state = flip ? S_STEAK_WELLDONE_WAIT : S_STEAK_WELLDONE;
            if (flip == 1'b1)
            next_state = S_STEAK_WELLDONE_WAIT;
            else if (clock == 1'b1)
            next_state = S_STEAK_BURNT;
            else
            next_state = S_STEAK_WELLDONE;
            end

            S_STEAK_WELLDONE_WAIT: begin
            next_state = flip ? S_STEAK_WELLDONE_WAIT : S_STEAK_BURNT;
            end

            S_STEAK_BURNT: begin
            if (flip == 1'b1)
            next_state = S_STEAK_BURNT_WAIT;
            else if (clock == 1'b1)
            next_state = S_STEAK_NONEXISTENT;
            else
            next_state = S_STEAK_BURNT;
            end

            S_STEAK_BURNT_WAIT: begin
            next_state = flip ? S_STEAK_BURNT_WAIT : S_STEAK_NONEXISTENT;
            end
        endcase
    end


    //Output logic aka all datapath control signals
    always@(*)
    begin: enable_signals
    	//by default all control signals are zero
	colour_fat = 9'b000000000;
	colour_muscle = 9'b000000000;

	case(current_state)
      S_STEAK_RAW: begin
          colour_fat = `FAT_COLOUR_RAW;
      colour_muscle = `MUSCLE_COLOUR_RAW;
      end

      S_STEAK_RAW_WAIT: begin
      	colour_fat = `FAT_COLOUR_RAW;
      colour_muscle = `MUSCLE_COLOUR_RAW;
      end

      S_STEAK_RARE: begin
      	colour_fat = `FAT_COLOUR_RARE;
      colour_muscle = `MUSCLE_COLOUR_RARE;
      end

      S_STEAK_RARE_WAIT: begin
      	colour_fat = `FAT_COLOUR_RARE;
      colour_muscle = `MUSCLE_COLOUR_RARE;
      end

      S_STEAK_MEDIUMRARE: begin
      	colour_fat = `FAT_COLOUR_RAW;
      colour_muscle = `MUSCLE_COLOUR_RAW;
      end

      S_STEAK_MEDIUMRARE_WAIT: begin
      	colour_fat = `FAT_COLOUR_MEDIUM_RARE;
      colour_muscle = `MUSCLE_COLOUR_MEDIUM_RARE;
      end

      S_STEAK_MEDIUM_WAIT: begin
      	colour_fat = `FAT_COLOUR_MEDIUM;
      colour_muscle = `MUSCLE_COLOUR_MEDIUM;
      end

      S_STEAK_MEDIUM_WAIT: begin
      	colour_fat = `FAT_COLOUR_MEDIUM;
      colour_muscle = `MUSCLE_COLOUR_MEDIUM;
      end

      S_STEAK_MEDIUMWELL: begin
      	colour_fat = `FAT_COLOUR_MEDIUM_RARE;
      colour_muscle = `MUSCLE_COLOUR_MEDIUM_RARE;
      end

      S_STEAK_MEDIUMWELL_WAIT: begin
      	colour_fat = `FAT_COLOUR_MEDIUM_WELL;
      colour_muscle = `MUSCLE_COLOUR_MEDIUM_WELL;
      end

      S_STEAK_WELLDONE: begin
      	colour_fat = `FAT_COLOUR_WELL_DONE;
      colour_muscle = `MUSCLE_COLOUR_WELL_DONE;
      end

      S_STEAK_WELLDONE_WAIT: begin
      	colour_fat = `FAT_COLOUR_WELL_DONE;
      colour_muscle = `MUSCLE_COLOUR_WELL_DONE;
      end

      S_STEAK_BURNT: begin
      	colour_fat = `FAT_COLOUR_BURNT;
      colour_muscle = `MUSCLE_COLOUR_BURNT;
      end
    endcase
    end

  // current state registers
  always @ (posedge clk)
  begin: state_FFS
      if (!resetn)
          current_state <= S_STEAK_NONEXISTENT;
      else
          current_state <= next_state;
  end

endmodule