function cut_moleguide(){
	global.story_beat = STORY_PACE.MOLE_MGLASS_TUTORIAL;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var mole = Omole;

	
		//READING STORY BOOK
	global.moveOrder = [
		function(){
			tile_replace("Base", 30, 4, 4, 4, true);
			
			set_pos(Omole, 64, 64);
			
			Omole.sprite_index = Smole_rise;
			Omole.image_index = 0;
			Omole.image_speed = 0;
			add_move_order();
		},
		[ create_textbox, ["wheremissinghat", hoots, false] ],
		[ hold, [hoots, 10, "frm"] ],
		function(){
			with (Ocharshake)
			{
				if (!shake)
				{
					shake = true;
					shake_time = 15;
					shake_magnitude = 0.5;
					shake_fade = 0.25;
					char = [Omole];	
					dir = "horz";
				}
			}
		},
		[ hold, [mole, 5, "frm"] ],
		function(){
			with (Ocharshake)
			{
				if (!shake)
				{
					shake = true;
					shake_time = 15;
					shake_magnitude = 0.5;
					shake_fade = 0.25;
					char = [Omole];	
					dir = "horz";
				}
			}	
		},
		[ hold, [mole, 5, "frn"] ],
		function(){
			with (Ocharshake)
			{
				if (!shake)
				{
					shake = true;
					shake_time = 15;
					shake_magnitude = 0.5;
					shake_fade = 0.25;
					char = [Omole];	
					dir = "horz";
				}
			}	
		},
		[ hold, [hoots, 15, "frm"] ],
		[ create_textbox, ["hootsparkglass", hoots, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				with (Ocharshake)
				{
					if (!shake)
					{
						shake = true;
						shake_time = 30;
						shake_magnitude = 1;
						shake_fade = 1;
						char = [Omole];
						dir = "horz";
					}
				}
			}
		},
		[ costume_change, [mole, Smole_rise, "noloop"] ],
		function() {
			if (!instance_exists(Ochar_jump))
			{
				with (instance_create_depth(0, 0, 0, Ochar_jump))
				{
					char = [Ohoots_cutscene];
					endy = [(Ohoots_cutscene.y - 6)];
					time = 10;
				}
				
				//sound effect
				play_sfx(snd_jumping_highpitch);
				
				//Hootsworth Bubble
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Ohoots_cutscene;
					bubble_type = 5;
					h_mod = 0;
					bounce = false;
					kill_time = 5;
					cut_add = false;	
				}
			}
		},
		[ create_textbox, ["presscglass", hoots, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				audio_pause_sound(Oaudio_manager.songInstance);
				add_move_order();
			}
		},
		[ hold, [hoots, 15, "frm"] ],
		[ create_textbox, ["longenoughhoots", hoots, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				audio_resume_sound(Oaudio_manager.songInstance);
				add_move_order();
			}
		},
		[ create_textbox, ["solongpressc", hoots, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				tile_replace("Base", 42, 4, 4, 4, true);
				with (Omole)
				{
					if (image_index > 0)
					{
						image_speed = -1;	
					
					} else {
						image_index = 0;
						image_speed = 0;
						add_move_order();
					}
				}
			}
		},
		
		
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
			
			global.story_beat = 1;
				
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
	//show_debug_message("MOLE EXISTS: " + string(instance_exists(Omole)));
}