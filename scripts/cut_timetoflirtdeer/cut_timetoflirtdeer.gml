function cut_timetoflirtdeer(){
	global.story_beat = STORY_PACE.TIME_TO_FLIRT_DEER;
	//no scene cast because the trojan deer already exists
	
	global.moveOrder = [
		function(){
			set_song_ingame(noone, 2 * FRAME_RATE);
			if (room = Routchophouse && !instance_exists(Ofade) && instance_exists(Otrojandeer))
			{
				if (!instance_exists(Omulti_goto))
				{
					var _x = Otrojandeer.x;
					var _y = Otrojandeer.y;
					
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Otrojandeer;
						origin_x = _x;
						origin_y = _y;
						x_pos = [56];
						y_pos = [132];
						spd = 2;
						spr_list = [Strojandeer_roll_d];	
					}	
				} else if (Otrojandeer.y = 132) {
					while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					Otrojandeer.sprite_index = Strojandeer_idle;
					Otrojandeer.image_index = 3;
					play_sfx(snd_landing);
					add_move_order();
				}
			}
		},
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
		},
		[ hold, [Otrojandeer, 20, "frm"] ],
		[ create_textbox, ["guesstoflirt", Otrojandeer, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				set_song_ingame("Overworld Theme.ogg");
				with (Otrojandeer)
				{
					dir = 3;
					image_speed = 1;
				}
				add_move_order();
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
			
			//if (global.debugActive)
			//{
			//	with (Odirector)
			//	{
			//		sbeat_debug = false;
			//		sbeat_input = "";
			//		start_cutdebug = false;		
			//	}
			//}
		}
			
	}
		
	//show_debug_message("array_length: " + string(array_length(global.moveOrder)));	
	//show_debug_message("move beat: " + string(global.moveOrder_beat));
}