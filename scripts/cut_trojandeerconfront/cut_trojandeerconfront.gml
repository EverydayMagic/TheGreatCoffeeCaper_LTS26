function cut_trojandeerconfront(){
	global.story_beat = STORY_PACE.TROJAN_DEER_CONFRONT;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	var stump = Ostump;
	var trojandeer = Otrojandeer;

	global.moveOrder = [
		function(){
			if (!instance_exists(Omulti_goto))
			{
				set_song_ingame(noone, 2 * FRAME_RATE);
			
				//set characters visibility
				//Ohoots_cutscene.visible = false;
				Ocharliemouse_cutscene.visible = false;
				Ostump.visible = false;
				
				
				var _x = Otrojandeer.x;
				var _y = Otrojandeer.y;
				
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Otrojandeer;
					origin_x = _x;
					origin_y = _y;
					x_pos = [24];
					y_pos = [58];
					spd = 2;
					spr_list = [Strojandeer_roll_u];
				}
			} else if (Otrojandeer.y = 58) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				play_sfx(snd_landing);
				Otrojandeer.xspd = false;
				Otrojandeer.yspd = false;
				//stop sfx
				if (audio_is_playing(snd_woodencartrolling))
				{
					audio_stop_sound(snd_woodencartrolling);	
				}
				add_move_order();
			}
			
		},
		function(){
			//back up deer slowly
			if (!instance_exists(Omulti_goto))
			{
				var _x = Otrojandeer.x;
				var _y = Otrojandeer.y;
				
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Otrojandeer;
					origin_x = _x;
					origin_y = _y;
					x_pos = [24];
					y_pos = [74];
					spd = 1;
					spr_list = [Strojandeer_roll_u];
				}	
			}
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
		function(){
			if (instance_exists(Omulti_goto) && Otrojandeer.y = 74) 
			{
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				Otrojandeer.sprite_index = Strojandeer_idle;
				Otrojandeer.image_index = 1;
				Otrojandeer.image_speed = 0;
				add_move_order();	
			}
		},
		[ hold, [trojandeer, 45, "frm"] ],
		[ create_textbox, ["layoncharm", charlie, true] ],
		[ hold, [trojandeer, 15, "frm"] ],
		[ create_textbox, ["zzzidont", charlie, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				play_sfx(snd_slidewhistle_up, 1, 2);
				add_move_order();
			}
		},
		[ costume_change, [trojandeer, Strojandeer_openvert, "noloop"] ],
		[ hold, [trojandeer, 10, "frm"] ],
		function(){
			//hootsworth thrown out
			if (!instance_exists(Ohoots_cutscene))
			{
				play_sfx(snd_rumble, 1, 3);
				
				with (instance_create_depth(24, 68, Otrojandeer.depth - 10, Ohoots_cutscene))
				{
					depth_manual = true;
					sprite_index = Splayer_cap_carriedflap;
					image_speed = 1;
					visible = true;
				}
				
				var _x = Ohoots_cutscene.x;
				var _y = Ohoots_cutscene.y;
				
				//PATH ARC
				with (instance_create_depth(0, 0, 0, Opath_arc))
				{
					curving = true;
					x1 = _x;
					y1 = _y;
					x2 = 54;
					y2 = 78;
					curve_height = 56;
					max_points_per_side = 15;
					obj = Ohoots_cutscene;
					spd = 4;
				}
			}
			
		},
		function(){
			if (!instance_exists(Omulti_goto))
			{
				var _x = Ohoots_cutscene.x;
				var _y = Ohoots_cutscene.y;
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = _x;
					origin_y = _y;
					x_pos = [_x + 6];
					y_pos = [_y];
					spd = 1;	
				}
			} else if (Ohoots_cutscene.x = 58) {
				while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }	
				Ohoots_cutscene.image_speed = 1;
			}
			play_sfx(snd_landing, 1, 0.5);
			add_move_order();
		},
		function(){
			if (instance_exists(Omulti_goto) && Ohoots_cutscene.x = 58)
			{
				while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				Ohoots_cutscene.image_speed = 1;
			}
			if (instance_exists(Oscreenshake))
			{
				with (Oscreenshake)
				{
					if (shake = false)
					{
						shake = true;
						shake_time = 10;
						shake_magnitude = 1;
						shake_fade = 0.25;
					}
				}
				
			}
		},
		function(){
			if (instance_exists(Omulti_goto) && Ohoots_cutscene.x = 58)
			{
				while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				Ohoots_cutscene.image_speed = 1;
				add_move_order();
			}	
			add_move_order();
		},
		[ hold, [hoots, 10, "frm"] ],
		function(){
			if (!instance_exists(Obubble))
			{
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Ohoots_cutscene;
					bubble_type = 5;
					h_mod = 0;
					bounce = false;
					kill_time = 15;
					cut_add = false;	
				}
			}
			
			//sound effect
			play_sfx(snd_exclamationpoint);
			
			add_move_order();
		},
		[ costume_change, [hoots, Splayer_capsit_shock_side] ],
		[ create_textbox, ["hootwhatgoing", hoots, true] ],
		[ hold, [hoots, 10, "frm"] ],
		[ costume_change, [trojandeer, Strojandeer_charlie_popout, "noloop"] ],
		[ create_textbox, ["justknockondoor", hoots, true] ],
		[ costume_change, [trojandeer, Strojandeer_idle, 1] ],
		function(){
			with (Ocharshake)
			{
				shake = true;
				shake_time = 10;
				shake_magnitude = 0.5;
				char = [Otrojandeer];
				dir = "horz";
				cut_dontadd = true;
			}
			
			play_sfx(snd_landing, 1, 0.5);
			
			add_move_order();
		},
		[ hold, [hoots, 25, "frm"] ],
		function(){
			//play_sfx(snd_bumpwall, 1, 1.5);
			add_move_order();
		},
		[ costume_change, [hoots, Splayer_capidle, 2] ],
		[ hold, [hoots, 15, "frm"] ],
		[ costume_change, [hoots, Splayer_capwalk_l] ],
		function(){
			if (!instance_exists(Omulti_goto))
			{
				var _x = Ohoots_cutscene.x;
				var _y = Ohoots_cutscene.y;
				Ohoots_cutscene.depth_manual = false;
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = _x;
					origin_y = _y;
					x_pos = [24, 24];
					y_pos = [64, 53];
					spd = 1;
					spr_list = [Splayer_capwalk_l, Splayer_capwalk_u];		
				}
			} else if (Ohoots_cutscene.x = 24 && Ohoots_cutscene.y = 53) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				Ohoots_cutscene.image_index = 1;
				Ohoots_cutscene.image_speed = 0;
				add_move_order();
			}
		},
		[ hold, [hoots, 10, "frm"] ],
		function(){
			play_sfx(snd_doorknock);
			add_move_order();
		},
		[ hold, [hoots, 35, "frm"] ],
		[ costume_change, [hoots, Splayer_capwalk_l] ],
		[ goTo, [hoots, 24, 53, 8, 47, 1] ],
		[ costume_change, [hoots, Splayer_treehug] ],
		[ hold, [hoots, 15, "frm"] ],
		[ create_textbox, ["ohstumpy", hoots, true] ],
		[ hold, [hoots, 15, "frm"] ],
		function(){
			//DOOR CREAK OPEN SFX
			
			//door object that cracks open
			instance_create_depth(16, 33, -33, Ostump_doorcrack);
			
			add_move_order();
		},
		[ costume_change, [Ostump_doorcrack, Sstump_doorcrack, "noloop"] ],
		[ hold, [hoots, 10, "frm"] ],
		[ create_textbox, ["igotyourletterand", hoots, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				Ostump_doorcrack.sprite_index = Sstump_dooropen;
				play_sfx(snd_landing, 1, 1.5);
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
							dontadd = true;
						}
					}
				
				}
				set_pos(Ostump, 24, 48);
				Ostump.visible = true;
				Ostump.sprite_index = Sstump_run_r;
			
				//ROMEO AND JULIET MUSIC
			
				add_move_order();
			}
		},
		[ goTo, [Ostump, 24, 48, 24, 60, 2] ],
		function(){
			Otrojandeer.visible = false;
			Ostump.sprite_index = Sstump_kisstrojan;
			set_pos(Ostump, 26, 69);
			
			if (!instance_exists(Obubble))
			{
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Ostump;
					bubble_type = 12;
					h_mod = -4;
					bounce = true;
					cut_add = false;	
				}
			}
			
			//KISSING SFX
			
			add_move_order();
		},
		[ hold, [hoots, 15, "frm"] ],
		[ create_textbox, ["heynowwhats", hoots, true] ],
		[ hold, [hoots, 15, "frm"] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				//destroy love bubble
				if (instance_exists(Obubble)){ instance_destroy(Obubble); }
				//RECORD SCREETCH SFX
			
			
				add_move_order();
			}
		},
		[ create_textbox, ["stumpyyell", hoots, true] ],
		[ hold, [hoots, 15, "frm"] ],
		function(){
			with (instance_create_depth(150, 100, -100, Ogirldeer))
			{
				sprite_index = Sgirldeer_walk_l;
				image_speed = 2;
			}
			add_move_order();
		},
		function(){
			if (!instance_exists(Omulti_goto))
			{
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ogirldeer;
					origin_x = 150;
					origin_y = 100;
					x_pos = [121];
					y_pos = [100];
					spd = 2;
					spr_list = [Sgirldeer_walk_l];		
				}
			} else if (Ogirldeer.x = 121) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				Ogirldeer.sprite_index = Sgirldeer_idle;
				Ogirldeer.image_index = 0;
				Ogirldeer.image_speed = 0;
				add_move_order();
			}
		},
		function(){
			Otrojandeer.visible = true;
			Otrojandeer.image_index = 0;
			set_pos(Otrojandeer, 12, 71);
			
			//all da boyz get da bubb
			with (instance_create_depth(0, 0, 0, Obubble))
			{
				char_track = Ohoots_cutscene;
				bubble_type = 5;
				h_mod = 0;
				y_mod = -2;
				bounce = false;
				kill_time = 15;
				cut_add = false;	
			}
			with (instance_create_depth(0, 0, 0, Obubble))
			{
				char_track = Otrojandeer;
				bubble_type = 5;
				h_mod = 0;
				bounce = false;
				kill_time = 15;
				cut_add = false;	
			}
			with (instance_create_depth(0, 0, 0, Obubble))
			{
				char_track = Ostump;
				bubble_type = 5;
				h_mod = 0;
				x_mod = 10;
				bounce = false;
				kill_time = 15;
				cut_add = false;	
			}
			
			play_sfx(snd_exclamationpoint);
			add_move_order();
		},
		[ hold, [hoots, 20, "frm"] ],
		[ create_textbox, ["lovingwildbuck", hoots, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				if (!instance_exists(Omulti_goto))
				{
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Ogirldeer;
						origin_x = 121;
						origin_y = 100;
						x_pos = [151];
						y_pos = [100];
						spd = 2;
						spr_list = [Sgirldeer_walk_r];		
					}
				} else if (Ogirldeer.x = 151) {
					while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					instance_destroy(Ogirldeer);
					add_move_order();
				}
			}
		},
		[ hold, [hoots, 30, "frm"] ],
		[ costume_change, [stump, Sstump_kisstrojan_backforth] ],
		[ hold, [hoots, 3, "sec"] ],
		function(){
			set_pos(Ostump, 33, 70);
			Ostump.sprite_index = Sstump_idle;
			Ostump.image_index = 2;
			add_move_order();
		},
		[ hold, [hoots, 15, "frm"] ],
		function(){
			if (!instance_exists(Omulti_goto))
			{
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ostump;
					origin_x = 33;
					origin_y = 77;
					x_pos = [151];
					y_pos = [105];
					spd = 2;
					spr_list = [Sstump_run_r];		
				}
			} else if (Ostump.x = 151 && Ostump.y = 105) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				Ostump.visible = false;
				add_move_order();
			}
		},	
		function(){
				
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
		
			if (instance_exists(Ocharliemouse_cutscene))
			{
				instance_destroy(Ocmouse_openupbb_cutcheck);
				Ocharliemouse_cutscene.alarm[0] = 1;
				
			}
		
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