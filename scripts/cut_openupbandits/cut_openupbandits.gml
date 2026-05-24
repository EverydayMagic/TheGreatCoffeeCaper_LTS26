function cut_openupbandits(){
	global.story_beat = STORY_PACE.OPEN_UP_BANDITS;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;

	global.moveOrder = [
		function(){
			//hoots sprite change based on direction
			if (round(Ohoots_cutscene.direction/90) = 0)
			{
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				Ohoots_cutscene.image_index = 0;
				Ohoots_cutscene.image_speed = 0;	
			} else if (round(Ohoots_cutscene.direction/90) = 1) {
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				Ohoots_cutscene.image_index = 1;
				Ohoots_cutscene.image_speed = 0;	
			}
			Ocharliemouse_cutscene.sprite_index = Scmouse_doorbang;
			Ocharliemouse_cutscene.image_speed = 1;
			
			set_song_ingame("Crazy Theme.ogg", 0, 0, 0, true, noone, false, false, true);
			
			add_move_order();
		},
		function(){
			if (Ohoots_cutscene.x != 24 || Ohoots_cutscene.y != 65)
			{
				if (!instance_exists(Omulti_goto))
				{
					var _x = Ohoots_cutscene.x;
					var _y = Ohoots_cutscene.y;
					var _spr = Splayer_capwalk_d;
					if (Ohoots_cutscene.image_index != 1){ _spr = Splayer_capwalk_r; }
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Ohoots_cutscene;
						origin_x = _x;
						origin_y = _y;
						x_pos = [24];
						y_pos = [65];
						spd = 1;
						spr_list = [_spr];
					}
				}
			} else {
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				Ohoots_cutscene.image_index = 1;
				Ohoots_cutscene.image_speed = 0;
				Ohoots_cutscene.direction = 90;
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				add_move_order();
			}
		
		},
		[ create_textbox, ["openupbandits", charlie, true] ],
		[ hold, [charlie, 10, "frm"] ],
		[ create_textbox, ["itnouse", charlie, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				if (!instance_exists(Omulti_goto))
				{
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Ohoots_cutscene;
						origin_x = 24;
						origin_y = 65;
						x_pos = [24, 43];
						y_pos = [72, 72];
						spd = 1;
						spr_list = [Splayer_capwalk_d, Splayer_capwalk_r];
						hoots_track_start = 0;
					}
				} else {
					if (Ohoots_cutscene.x = 43 && Ohoots_cutscene.y = 72)
					{
						while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
						
						Ohoots_cutscene.sprite_index = Splayer_capidle;
						Ohoots_cutscene.image_index = 3;
						Ohoots_cutscene.image_speed = 0;
						
						Ocharliemouse_cutscene.sprite_index = Scmouse_idle;
						Ocharliemouse_cutscene.image_index = 3;
						Ocharliemouse_cutscene.image_speed = 0;
						
						add_move_order();
					}
				}
			}
		},
		[ hold, [hoots, 10, "frm"] ],
		[ create_textbox, ["hmmthink", hoots, true] ],
		[ hold, [hoots, 15, "frm"] ],
		[ costume_change, [hoots, Splayer_capsit_sleep] ],
		//PLAY SNORING SFX
		[ hold, [hoots, 2, "sec"] ],
		[ costume_change, [charlie, charlie.walk_d_spr] ],
		[ goTo, [charlie, 24, 49, 24, 73, 2] ],
		[ costume_change, [charlie, Scmouse_distressed_side] ],
		[ create_textbox, ["charlieyellhoots", charlie, true] ],
		[ hold, [hoots, 10, "frm"] ],
		[ create_textbox, ["ahyes", hoots, true] ],
		[ hold, [hoots, 1, "sec"] ],
		[ create_textbox, ["mrstumplongwords", hoots, true] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 2] ],
		[ hold, [hoots, 10, "frm"] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 3] ],
		[ costume_change, [charlie, Scmouse_readpaper, 0] ],
		[ hold, [charlie, 1, "sec"] ],
		[ create_textbox, ["ohmydisturbing", charlie, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				set_song_ingame("Overworld Theme.ogg", 0, 0, 0, true, noone, false, false, false, true);	
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
			
			//after cut invis sign
			with (instance_create_depth(15, 40, 0, Oopenupbandits_aftercut))
			{
				image_xscale = 0.2880;
				image_yscale = 0.125;
			}
			
			Ogame.alarm[1] = 5; //demo autosave
		}
			
	}
		
	//show_debug_message("array_length: " + string(array_length(global.moveOrder)));	
	//show_debug_message("move beat: " + string(global.moveOrder_beat));	

}