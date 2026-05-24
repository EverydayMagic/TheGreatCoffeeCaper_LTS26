function cut_meetclawdine(){
	global.story_beat = STORY_PACE.MEET_CLAWDINE;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	var clawdine = Oclawdine;

	global.moveOrder = [
		function(){
			set_song_ingame(noone, 30);
			
			//set sprites
				//clawdine
					Oclawdine.sprite_index = Sclawdine_roll;
					if (instance_exists(Olog_scratch)){ Oclawdine.depth = Olog_scratch.depth - 10; }
					Oclawdine.image_index = 0;
					Oclawdine.image_speed = 0;
				//hootsworth
					Ohoots_cutscene.sprite_index = Splayer_capidle;
					Ohoots_cutscene.image_index = 1;
					Ohoots_cutscene.image_speed = 0;
				//charlie
					Ocharliemouse_cutscene.sprite_index = Scmouse_idle;
					Ocharliemouse_cutscene.image_index = 1;
					Ocharliemouse_cutscene.image_speed = 0;
					Ocharliemouse_cutscene.y = Ohoots_cutscene.y + 1;
					Ocharliemouse_cutscene.old_depth = Ocharliemouse_cutscene.depth;
			
			//set pos
				set_pos(Ohoots_cutscene, 80, 125);
				set_pos(Ocharliemouse_cutscene, 80, 128);
				set_pos(Oclawdine, 81, -1);
			if (!instance_exists(Ofade))	
				add_move_order();
		},
		function(){
			if (!instance_exists(Omulti_goto))
			{
				set_pos(Ocharliemouse_cutscene, 80, 128);
				
				//hootsworth
					Ohoots_cutscene.sprite_index = Splayer_capwalk_u;
					Ohoots_cutscene.image_index = 0;
					Ohoots_cutscene.image_speed = 1;
				//charlie
					Ocharliemouse_cutscene.sprite_index = Scmouse_walkb;
					Ocharliemouse_cutscene.image_index = 0;
					Ocharliemouse_cutscene.image_speed = 1;
				
				//HOOTS MULTI-GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = 80;
					origin_y = 125;
					x_pos = [80, 96];
					y_pos = [118, 110];
					spd = 1;
					spr_list = [Splayer_capwalk_u, Splayer_capwalk_r];
				}
				
				//CHARLIE MULTI-GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ocharliemouse_cutscene;
					origin_x = 80;
					origin_y = 128;
					x_pos = [80, 64];
					y_pos = [118, 111];
					spd = 1;
					spr_list = [Scmouse_walkb, Scmouse_walkl];
				}
			} else {
				if (Ocharliemouse_cutscene.x = 64 && Ocharliemouse_cutscene.y = 111)
				{
					while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					Ohoots_cutscene.sprite_index = Splayer_capidle;
					Ohoots_cutscene.image_index = 1;
					Ohoots_cutscene.image_speed = 0;
					Ocharliemouse_cutscene.sprite_index = Scmouse_idle;
					Ocharliemouse_cutscene.image_index = 1;
					Ocharliemouse_cutscene.image_speed = 0;
					add_move_order();
				}
			}
		},
		[ hold, [hoots, 1, "sec"] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 2] ],
		[ hold, [hoots, 15, "frm"] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 3] ],
		[ hold, [hoots, 15, "frm"] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 0] ],
		[ hold, [hoots, 15, "frm"] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 1] ],
		[ create_textbox, ["clawdine?", hoots, false] ],
		[ hold, [charlie, 1, "sec"] ],
		[ costume_change, [charlie, charlie.idle_spr, 0] ],
		[ create_textbox, ["maybenothere", charlie, false] ],
		function(){ 
			if (!instance_exists(Otextbox))
			{
				Oclawdine.image_speed = 1;
				
				with (instance_create_depth(0, 0, Oclawdine.depth - 10, Omultispr_char_fade))
				{
					char = [Oclawdine];
					frequency = 2;
					total_time = 20;
					fade_time = 10;
				}
				
				//sound effect
				play_sfx(snd_falling);
				
				add_move_order(); 
			}
		},
		[ goTo, [clawdine, 81, -1, 81, 82, 4] ],
		[ costume_change, [clawdine, Sclawdine_land, 3] ],
		function(){
			
			if (instance_exists(Oscreenshake))
			{
				with (Oscreenshake)
				{
					if (shake = false)
					{
						shake = true;
						shake_time = 10;
						shake_magnitude = 0.5;
						shake_fade = 0.25;
					}
				}
				
			}
			
			if (instance_exists(Ocharshake))
			{
				with (Ocharshake)
				{
					if (shake = false)
					{
						shake = true;
						shake_time = 10;
						shake_magnitude = 0.5;
						shake_fade = 0.25;
						char = [Oclawdine];
						cut_dontadd = true;
						dir = "horz";
						
						//sound effect
						play_sfx(snd_landing);
					}
				}
			}
			
			if (!instance_exists(Ochar_jump))
			{
				//change hoots and charlie sprites
				Ohoots_cutscene.sprite_index = Splayer_diag_shock;
				Ocharliemouse_cutscene.sprite_index = Scmouse_diag_shock;
				Ocharliemouse_cutscene.image_xscale = 1;
				
				with (instance_create_depth(0, 0, 0, Ochar_jump))
				{
					char = [Ohoots_cutscene, Ocharliemouse_cutscene];
					endy = [(Ohoots_cutscene.y - 12), (Ocharliemouse_cutscene.y - 12)];
					cut_dontadd = true;
					time = 15;
				}
				
				//sound effect
				play_sfx(snd_jumping_highpitch, 2);
				
			}
			
			if (!instance_exists(Obubble))
			{
				//Charlie Bubble
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Ocharliemouse_cutscene;
					bubble_type = 5;
					h_mod = 1;
					bounce = false;
					kill_time = 10;
					cut_add = false;	
				}
				
				//Hootsworth Bubble
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Ohoots_cutscene;
					bubble_type = 5;
					h_mod = 0;
					bounce = false;
					kill_time = 10;
					cut_add = false;	
				}
				
				//sound effect
				play_sfx(snd_exclamationpoint);
			}
			
		},
		[ hold, [clawdine, 10, "frm"] ],
		[ costume_change, [clawdine, Sclawdine_laugh] ],
		function(){
			set_song_ingame("Clawdine's Theme.ogg");
			add_move_order();
		},
		[ create_textbox, ["someonesaybuild", clawdine, false] ],
		[ costume_change, [clawdine, Sclawdine_sad, 0] ],
		[ costume_change, [hoots, hoots.idle_cap_hoist_spr, "noloop"] ],
		[ create_textbox, ["detectivecantfind", hoots, false] ],
		function(){
			with(instance_create_depth(0, 0, 0, Omultispr_char_fade))
			{
				char = [Ocharliemouse_cutscene];
				frequency = 1;
				total_time = 15;
				fade_time = 10;
			}
			add_move_order();
		},
		[ costume_change, [charlie, Scmouse_dash, "flip"] ],
		[ goTo, [charlie, 64, 111, 48, 111, 4] ],
		[ costume_change, [charlie, Scmouse_invest] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 3] ],
		//function(){
		//	if (!instance_exists(Ofade))
		//	{
		//		set_song_ingame("Credits.ogg", 3 * FRAME_RATE, 0, 0, false);
				
		//		with (instance_create_depth(0, 0, -999, Ofade))
		//		{
		//			trans_type = "fade";
		//			newRoom = Rdemo_credits;
		//			fadeColor = white_col;
		//			fadeSpd = 0.015;
		//		}
		//	}
		//},
		
		

	]
	
	if (global.moveOrder_beat < array_length(global.moveOrder))
	{
		var entry = global.moveOrder[global.moveOrder_beat];
		if (is_array(entry) == true)
			script_execute_ext(entry[0], entry[1]);      
		else
			entry();

	} else {
		/////////////////////////////////////////////
		//Uncomment this once cutscene is finished!//
		/////////////////////////////////////////////
			
			
		//erase the array for the next cutscene 
		//and tell the game we finished with this one
		if (!instance_exists(Otextbox))
		{
			array_delete(global.moveOrder, 0, global.moveOrder_beat - 1);
			global.moveOrder_beat = 0;
			global.cutsceneActive = false;
			
			global.saveslot_story[global.saveslot][global.story_beat] = 1;
			
			if (global.debugActive)
			{
				with (Odirector)
				{
					sbeat_debug = false;
					sbeat_input = "";
					start_cutdebug = false;		
				}
			}
		}
			
	}
		
	//show_debug_message("array_length: " + string(array_length(global.moveOrder)));	
	//show_debug_message("move beat: " + string(global.moveOrder_beat));
}