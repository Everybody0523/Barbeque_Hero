module steak_control(clock, resetn, go, steakMuscle, steakFat, flip);
    input clock;
    input resetn;
    input go;
    output reg [8:0] steakMuscle; //One of the colours
    output reg [8:0] steakFat; //The other colour
    //8 states for a steak: Non-Existent, Raw, Rare, Medium-Rare, Medium,
    //Medium-Well, Well Done, Burnt. We need ceil(log_2(8)) = 3 states.

    reg [3:0] current_state;
    reg [3:0] next_state;

    localparam  S_STEAK_NONEXISTENT = 4'd0;
                S_STEAK_NONEXISTENT_WAIT = 4'd1;
                S_STEAK_RAW = 4'd2;
                S_STEAK_RAW_WAIT = 4'd3;
                S_STEAK_RARE = 4'd4;
                S_STEAK_RARE_WAIT = 4'd5;
                S_STAEAK_MEDIUMRARE = 4'd6;
                S_STAEAK_MEDIUMRARE_WAIT = 4'd7;
                S_STEAK_MEDIUM = 4'd8;
                S_STEAK_MEDIUM_WAIT = 4'd9;
                S_STEAK_MEDIUMWELL = 4'd10;
                S_STEAK_MEDIUMWELL_WAIT = 4'd11;
                S_STEAK_WELLDONE = 4'd12; //ironic, because a well-done steak is bad
                S_STEAK_WELLDONE_WAIT = 4'd13;
                S_STEAK_BURNT = 4'd14;

    //Next state logic aka our state table
    always@(*)
    begin: state_table
        case (current_state)
            S_STEAK_NONEXISTENT: next_state = flip ? S_STEAK_NONEXISTENT_WAIT : S_STEAK_NONEXISTENT;
            S_STEAK_NONEXISTENT_WAIT: next_state = flip ? S_STEAK_NONEXISTENT_WAIT : S_STEAK_RAW;
            S_STEAK_RAW: next_state = flip ? S_STEAK_RAW_WAIT : S_STEAK_RAW;
            S_STEAK_RAW_WAIT: next_state = flip ? S_STEAK_NONEXISTENT : S_STEAK_RAW_WAIT;
            S_STEAK_RARE: next_state = flip ? S_STEAK_RARE_WAIT : S_STEAK_RARE;
            S_STAKE_RARE_WAIT: next_state = flip ? S_STEAK_NONEXISTENT : S_STEAK_RARE_WAIT;
            S_STEAK_MEDIUMRARE: next_state = flip ? S_STEAK_MEDIUMRARE_WAIT : S_STEAK_MEDIUMRARE;
            S_STEAK_MEDIUMRARE_WAIT: next_state = flip ? S_STEAK_NONEXISTENT : S_STEAK_MEDIUMRARE_WAIT;
            S_STEAK_MEDIUM: next_state = flip ? S_STEAK_MEDIUM_WAIT : S_STEAK_MEDIUM;
            S_STEAK_MEDIUM_WAIT: next_state = flip ? S_STEAK_NONEXISTENT : S_STEAK_MEDIUM_WAIT;
            S_STEAK_MEDIUMWELL: next_state = flip ? S_STEAK_MEDIUMWELL_WAIT : S_STEAK_MEDIUMWELL;
            S_STEAK_MEDIUMWELL_WAIT: next_state = flip ? S_STEAK_NONEXISTENT : S_STEAK_MEDIUMWELL_WAIT;
            S_STEAK_WELLDONE: next_state = flip ? S_STEAK_WELLDONE_WAIT : S_STEAK_WELLDONE;
            S_STEAK_WELLDONE_WAIT: next_state = flip ? S_STEAK_NONEXISTENT : S_STEAK_WELLDONE_WAIT;
            S_STEAK_BURNT: next_state = S_STEAK_NONEXISTENT;
    end
    
    
    //Output logic aka all datapath control signals
    always@(*)
    begin: enable_signals
    	//by default all control signals are zero
	steakFat = 9'b000000000;
	steakMuscle = 9'b000000000;
	
	case(current_state)
	    S_STATE_RAW: begin
	        steakFat = `FAT_COLOUR_RAW;
		steakMuscle = `MUSCLE_COLOUR_RAW;
	    end
	    
	    S_STATE_RAW_WAIT: begin
	    	steakFat = `FAT_COLOUR_RAW;
		steakMuscle = `MUSCLE_COLOUR_RAW;
	    end

	    S_STATE_RARE: begin
	    	steakFat = `FAT_COLOUR_RARE;
		steakMuscle = `MUSCLE_COLOUR_RARE;
	    end

	    S_STATE_RARE_WAIT: begin
	    	steakFat = `FAT_COLOUR_RARE;
		steakMuscle = `MUSCLE_COLOUR_RARE;
	    end

	    S_STATE_MEDIUMRARE: begin
	    	steakFat = `FAT_COLOUR_RAW;
		steakMuscle = `MUSCLE_COLOUR_RAW;
	    end

	    S_STATE_MEDIUMRARE_WAIT: begin
	    	steakFat = `FAT_COLOUR_MEDIUM_RARE;
		steakMuscle = `MUSCLE_COLOUR_MEDIUM_RARE;
	    end

	    S_STATE_MEDIUM_WAIT: begin
	    	steakFat = `FAT_COLOUR_MEDIUM;
		steakMuscle = `MUSCLE_COLOUR_MEDIUM;
	    end

	    S_STATE_MEDIUM_WAIT: begin
	    	steakFat = `FAT_COLOUR_MEDIUM;
		steakMuscle = `MUSCLE_COLOUR_MEDIUM;
	    end

	    S_STATE_MEDIUMWELL: begin
	    	steakFat = `FAT_COLOUR_MEDIUM_RARE;
		steakMuscle = `MUSCLE_COLOUR_MEDIUM_RARE;
	    end

	    S_STATE_MEDIUMWELL_WAIT: begin
	    	steakFat = `FAT_COLOUR_MEDIUM_WELL;
		steakMuscle = `MUSCLE_COLOUR_MEDIUM_WELL;
	    end
	    
	    S_STATE_WELLDONE: begin
	    	steakFat = `FAT_COLOUR_WELL_DONE;
		steakMuscle = `MUSCLE_COLOUR_WELL_DONE;
	    end

	    S_STATE_WELLDONE_WAIT: begin
	    	steakFat = `FAT_COLOUR_WELL_DONE;
		steakMuscle = `MUSCLE_COLOUR_WELL_DONE;
	    end
	    
	    S_STATE_BURNT: begin
	    	steakFat = `FAT_COLOUR_BURNT;
		steakMuscle = `MUSCLE_COLOUR_BURNT;
	    end	    
	
    end
    

endmodule
