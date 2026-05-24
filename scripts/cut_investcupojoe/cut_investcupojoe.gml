
function cut_investcupojoe(){
	global.story_beat = STORY_PACE.INVESTIGATE_CUPOJOE;
	get_scene_cast(global.story_beat);
	var joe = Ojoeturtle;
	var charlie = Ocharliemouse_cutscene;
	var hoots = Ohoots_cutscene;

		global.moveOrder = [
			//start off joe shaking with his proper location set
			function(){
				layer_set_visible("BrokenDec", true);
				audio_stop_sound(Oaudio_manager.songInstance);
				Ojoeturtle.x = 88;
				Ojoeturtle.y = 78;
				Ojoeturtle.sprite_index = Ojoeturtle.shellidle_spr;
				Ojoeturtle.image_index = 1;
				Ojoeturtle.image_speed = 0;
				Ohoots_cutscene.x = 80;
				Ohoots_cutscene.y = 125;
				Ohoots_cutscene.visible = false;
				Ocharliemouse_cutscene.sprite_index = Ocharliemouse_cutscene.idle_interrogate_spr;
				Ocharliemouse_cutscene.visible = true;
				add_move_order();	
			},
			function(){
				with (Ocharshake)
				{
					shake = true;
					shake_time = "infin";
					shake_magnitude = 1;
					char = [Ojoeturtle];
					cut_dontadd = true;
					dir = "horz";
					delay = 2;
				}
				add_move_order();
			},
			function(){
				//charlie and hoots setup
				Ocharliemouse_cutscene.x = 88;
				Ocharliemouse_cutscene.y = 94;
				Ocharliemouse_cutscene.image_index = 1;
				Ohoots_cutscene.visible = false;
				set_song_ingame("Crazy Theme.ogg");
				if (!instance_exists(Ofade))
					add_move_order();	
			},
			[ create_textbox, ["cmonjoe", charlie, false] ],
			[ costume_change, [charlie, charlie.dash_spr] ],
			function(){
				//sound effect
				play_sfx(snd_zippingaway);
				add_move_order();
			},
			[ goTo, [charlie, 88, 94, 99, 108, 6] ],
			[ costume_change, [charlie, charlie.idle_interrogate_bean_spr] ],
			[ tile_replace, ["BrokenDec", 62, 6, 6, 6] ],
			[ create_textbox, ["meanmouth", charlie, false] ],
			[ costume_change, [hoots, hoots.walk_u_cap_spr] ],
			function(){ Ohoots_cutscene.visible = true; add_move_order();},
			[ goTo, [hoots, 80, 125, 80, 115, 1] ],
			[ costume_change, [hoots, hoots.idle_cap_spr, 1] ],
			[ costume_change, [charlie, charlie.idle_spr, 3] ],
			[ tile_replace, ["BrokenDec", 37, 6, 6, 6] ],
			[ create_textbox, ["goodmorning", hoots, false] ],
			function(){ 
				with (Ocharshake) {	shake_time = 0;	cut_dontadd = false; }
				set_song_ingame("Cup O' Joe.ogg", 2 * FRAME_RATE, 2 * FRAME_RATE);
			},
			[ costume_change, [joe, joe.shellout_spr, "noloop"] ],
			[ costume_change, [joe, joe.idle_talk_spr] ],
			[ create_textbox, ["hootsworthfromjoe", joe, false] ],
			[ costume_change, [charlie, charlie.idle_interrogate_bean_spr] ],
			[ tile_replace, ["BrokenDec", 62, 6, 6, 6] ],
			[ create_textbox, ["knowsmorewords", charlie, false] ],
			[ costume_change, [hoots, hoots.walk_l_cap_spr] ],
			[ goTo, [hoots, 80, 115, 68, 112, 1] ],
			[ costume_change, [hoots, hoots.idle_cap_spr, 2] ],
			[ hold, [hoots, 10, "frm"] ],
			[ goTo, [hoots, 68, 112, 56, 104, 1] ],
			[ costume_change, [hoots, hoots.idle_cap_sit_spr] ],
			[ tile_replace, ["BrokenDec", 37, 6, 6, 6] ],
			[ costume_change, [charlie, charlie.idle_spr, 2] ],
			[ costume_change, [hoots, hoots.idle_cap_sit_yawn_spr] ],
			[ create_textbox, ["hazelnutlatte", hoots, false] ],
			[ costume_change, [joe, joe.shocked_spr, 2] ],
			[ costume_change, [charlie, charlie.idle_spr, 1] ],
			[ hold, [hoots, 1, "sec"] ],
			[ costume_change, [hoots, hoots.idle_cap_sit_spr, 0] ],
			[ create_textbox, ["comeonjoe", hoots, false] ],
			[ hold, [hoots, 15, "frm"] ],
			[ costume_change, [charlie, charlie.idle_spr, 1] ],
			[ costume_change, [joe, joe.shocked_spr, 2] ],
			[ hold, [charlie, 0.5, "sec"] ],
			[ costume_change, [charlie, charlie.idle_spr, 2] ],
			[ costume_change, [joe, joe.shocked_spr, 1] ],
			[ hold, [charlie, 0.5, "sec"] ],
			[ costume_change, [charlie, charlie.idle_spr, 1] ],
			[ costume_change, [joe, joe.shocked_spr, 2] ],
			[ hold, [charlie, 0.5, "sec"] ],
			[ costume_change, [charlie, charlie.idle_spr, 2] ],
			[ costume_change, [joe, joe.shocked_spr, 1] ],
			[ hold, [charlie, 0.5, "sec"] ],
			[ costume_change, [charlie, charlie.idle_spr, 1] ],
			[ costume_change, [joe, joe.shocked_spr, 2] ],
			[ hold, [charlie, 0.5, "sec"] ],
			[ costume_change, [charlie, charlie.idle_spr, 2] ],
			[ costume_change, [joe, joe.shocked_spr, 1] ],
			[ hold, [charlie, 1, "sec"] ],
			[ costume_change, [charlie, charlie.idle_sweat_side_spr] ],
			[ create_textbox, ["wellhootsworth", charlie, false] ],
			[ hold, [hoots, 1, "sec"] ],
			[ costume_change, [hoots, hoots.idle_cap_sit_sleep_spr] ],
			[ costume_change, [charlie, charlie.idle_spr, 2] ],
			function(){
				audio_pause_sound(Oaudio_manager.songInstance);
				//sound effect
				play_sfx(snd_shortsnore, 1, 1.5);
				add_move_order();
			},
			function(){
				with (Oscreenshake)
				{
					if (shake = false)
					{
						shake = true;
						shake_time = 10;
						shake_magnitude = 0.25;
						dontadd = false;
					} 
				}
			},
			[ hold, [hoots, 3, "sec"] ],
			function(){
				if (audio_is_playing(snd_shortsnore))
				{
					audio_stop_sound(snd_shortsnore);
				}
				audio_resume_sound(Oaudio_manager.songInstance);
				add_move_order();
			},
			[ create_textbox, ["hootswakeup", charlie, false] ],
			[ costume_change, [hoots, hoots.idle_cap_hoist_spr, "noloop"] ],
			[ create_textbox, ["thegreathootsworth", hoots, false] ],
			[ costume_change, [hoots, hoots.idle_cap_hoist_spr, "noloop"] ],
			[ create_textbox, ["findhoodunit", hoots, false] ],
			[ costume_change, [hoots, hoots.walk_r_cap_spr] ],
			[ goTo, [hoots, 56, 104, 68, 115, 1] ],
			[ costume_change, [hoots, hoots.idle_cap_spr, 0] ],
			[ costume_change, [charlie, charlie.idle_spr, 2] ],
			[ create_textbox, ["ifneedhelp", charlie, false] ],
			
			function(){ 
				Ohoots_cutscene.depth = 100; 
				if (!instance_exists(Otextbox))
				{
					set_song_ingame("Cup O' Joe.ogg");
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
				
				if (global.debugActive)
				{
					with (Odirector)
					{
						sbeat_debug = false;
						sbeat_input = "";
						start_cutdebug = false;		
					}
				}
				
				Ogame.alarm[1] = 5; //autosave
			}
			
		}
		
		//show_debug_message("array_length: " + string(array_length(global.moveOrder)));	
		//show_debug_message("move beat: " + string(global.moveOrder_beat));

}