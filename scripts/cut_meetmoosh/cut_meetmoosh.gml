
function cut_meetmoosh(){
	get_scene_cast(STORY_PACE.MEET_MOOSH);
	var moosh = Omooshmushroom;
	
	global.moveOrder = [
		function(){
			
			//move hoots and charlie
			if (!instance_exists(Omulti_goto))
			{
				//setting sprites
				Ohoots_cutscene.sprite_index = Splayer_capwalk_u;
				Ohoots_cutscene.image_index = 0;
				Ohoots_cutscene.image_speed = 1;
				
				var _hoots_x = Ohoots_cutscene.x;
				var _hoots_y = Ohoots_cutscene.y;
				
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = _hoots_x;
					origin_y = _hoots_y;
					x_pos = [130];
					y_pos = [102];
					spd = 1;
					spr_list = [Splayer_capwalk_u];	
				}
				
				if (instance_exists(Ocharliemouse_cutscene))
				{
					Ocharliemouse_cutscene.sprite_index = Scmouse_walkb;
					Ocharliemouse_cutscene.image_index = 0;
					Ocharliemouse_cutscene.image_speed = 1;
					
					var _cmouse_x = Ocharliemouse_cutscene.x;
					var _cmouse_y = Ocharliemouse_cutscene.y;
					
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Ocharliemouse_cutscene;
						origin_x = _cmouse_x;
						origin_y = _cmouse_y;
						x_pos = [110];
						y_pos = [103];
						spd = 1;
						spr_list = [Scmouse_walkb];	
					}
				}
				
				set_song_ingame(noone, 30, 0, 0, true, noone, false, false, true);
				
			} else {
				if (Ohoots_cutscene.x = 130 && Ohoots_cutscene.y = 102) 
				{
					while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					Ohoots_cutscene.sprite_index = Splayer_capidle;
					Ohoots_cutscene.image_index = 1;
					Ohoots_cutscene.image_speed = 0;
					if (instance_exists(Ocharliemouse_cutscene))
					{
						Ocharliemouse_cutscene.sprite_index = Scmouse_idle;
						Ocharliemouse_cutscene.image_index = 1;
						Ocharliemouse_cutscene.image_speed = 0;
					}
					add_move_order();
				}
			}
		},
		[ create_textbox, ["hmmm?", moosh, true] ],
		//function(){
		//	if (!instance_exists(Otextbox))
		//	{
		//		with (Ocharshake)
		//		{
		//			shake = true;
		//			shake_time = 15;
		//			shake_magnitude = 0.25;
		//			shake_fade = 0.1;
		//			char = [Omooshmushroom];	
		//			dir = "horz";
		//		}
		//	}
		//},
		//[ hold, [moosh, 10, "frm"] ],
		//function(){
		//	if (!instance_exists(Otextbox))
		//	{
		//		with (Ocharshake)
		//		{
		//			shake = true;
		//			shake_time = 25;
		//			shake_magnitude = 0.5;
		//			shake_fade = 0.25;
		//			char = [Omooshmushroom];	
		//			dir = "horz";
		//		}
		//	}
		//},
		[ costume_change, [moosh, moosh.idle_spawn_spr, "noloop"] ],
		[ create_textbox, ["finally audience", moosh, true] ],
		[ hold, [moosh, 10, "frm"] ],
		[ costume_change, [moosh, moosh.idle_spr, 0] ],
		[ create_textbox, ["investigate dance", moosh, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				set_song_ingame("Mushroom Dance.ogg", 0, 0, 0, false);
				add_move_order();
			}
		},
		[ costume_change, [moosh, moosh.idle_spr] ],
		[ hold, [moosh, 5.75, "sec"] ],
		[ costume_change, [moosh, moosh.idle_jumpkick_spr] ],             
		[ hold, [moosh, 1.65, "sec"] ],
		[ costume_change, [moosh, moosh.idle_spr] ],
		[ hold, [moosh, 0.95, "sec"] ],
		[ costume_change, [moosh, moosh.idle_spin_spr, "noloop"] ],
		[ hold, [moosh, 0.25, "sec"] ],
		[ costume_change, [moosh, moosh.idle_jumpkick_spr] ],
		[ hold, [moosh, 1.90, "sec"] ],
		[ costume_change, [moosh, moosh.idle_spin_spr, "noloop"] ],
		[ hold, [moosh, 0.15, "sec"] ], 
		[ costume_change, [moosh, moosh.idle_splits_spr, "noloop"] ],
		[ hold, [moosh, 1.34, "sec"] ],
		function(){
			if (instance_exists(Omooshmushroom))
			{
				for (var i = 0; i < 3; i++)
				{
					var moosh = Omooshmushroom;
					instance_create_depth(moosh.x, moosh.y, moosh.depth + 1, Omoosh_confetti_motion);
				}
				add_move_order();
			}
		},
		[ hold, [moosh, 3, "sec"] ],
		[ create_textbox, ["applause", moosh, true] ],
		[ costume_change, [moosh, Smoosh_spawn_reverse, "noloop"] ],
		[ costume_change, [moosh, moosh.idle_spawn_spr, 0] ],
		function(){
			//set song back to normal
			set_song_ingame("Overworld Theme.ogg", 0, 30, 0, true, noone, false, false, false, true);
			
			////make collision for where mushroom is
			//with (instance_create_layer(113, 73, "Col", Ocol))
			//{
			//	image_xscale = 1.75;
			//	image_yscale = 1;
			//}
			
			add_move_order();
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
			
			global.saveslot_story[global.saveslot][STORY_PACE.MEET_MOOSH] = 1;
			
			if (global.debugActive)
			{
				with (Odirector)
				{
					sbeat_debug = false;
					sbeat_input = "";
					start_cutdebug = false;		
				}
			}

			Opartypoint_manager.reset_points();
	
		}
	}
		
	//show_debug_message("array_length: " + string(array_length(global.moveOrder)));	
	//show_debug_message("move beat: " + string(global.moveOrder_beat));
	
	
}