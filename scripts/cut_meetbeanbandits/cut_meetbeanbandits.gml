function cut_meetbeanbandits(){
	global.story_beat = STORY_PACE.MEET_BEAN_BANDITS;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	var puffy = Opuffy;
	var stump = Ostump;
	var sniffles = Osniffles;
	var stroller = Oegg_stroller;
	
	global.moveOrder = [
		function(){
			//Starting Positions
			set_pos(Ohoots_cutscene, 72, -3);
			set_pos(Ocharliemouse_cutscene, 72, -15);
			set_pos(Opuffy, 24, 91);
			set_pos(Ostump, 38, 92);
			set_pos(Osniffles, 185, 109);
			set_pos(Oegg_stroller, 168, 109);
			
			//Starting Sprites
			Ohoots_cutscene.sprite_index = Splayer_capwalk_d;
			Ocharliemouse_cutscene.sprite_index = Scmouse_walkf;
			Opuffy.sprite_index = Spuffy_idle_r;
			Ostump.sprite_index = Sstump_idle;
			Ostump.image_index = 2;
			
			Ocharliemouse_cutscene.image_speed = 1;
			Ohoots_cutscene.image_speed = 1;
			Opuffy.image_speed = 1;
			Oegg_stroller.image_speed = 0;
			Osniffles.image_speed = 0;
			
			
			
			add_move_order();
		},
		function(){
			if (!instance_exists(Ofade))
			{
				set_song_ingame("Bean Bandits.ogg", 0, 0, 0, true, noone, false, false, true);
				add_move_order();
			}
		},
		function(){
			var _checkgo = 0;
			if (goTo(Ohoots_cutscene, 72, -3, 72, 32, 1, false) = true)
			{ 
				_checkgo++; 
				Ohoots_cutscene.sprite_index = Splayer_capidle; 
				Ohoots_cutscene.image_index = 3;
				Ohoots_cutscene.image_speed = 0;
			}
			if (goTo(Ocharliemouse_cutscene, 72, -15, 90, 33, 1, false) = true)
			{ 
				_checkgo++; 
				Ocharliemouse_cutscene.sprite_index = Scmouse_idle; 
				Ocharliemouse_cutscene.image_index = 3;
				Ocharliemouse_cutscene.image_speed = 0;
			}
			if (_checkgo = 2){ add_move_order(); }
		},
		[ create_textbox, ["wegotdis", puffy, false] ],
		[ hold, [hoots, 5, "frm"] ],
		function(){
			Ohoots_cutscene.depth = 401;
			Ohoots_cutscene.sprite_index = Splayer_happywave;
			Ohoots_cutscene.image_speed = 1;
			add_move_order();
		},
		[ create_textbox, ["morningpuffy", hoots, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				set_pos(Ocharliemouse_cutscene, 80, 33);
				Ohoots_cutscene.sprite_index = Splayer_mmph;
				Ohoots_cutscene.depth = 401;
				Ohoots_cutscene.image_speed = 1;
				Ocharliemouse_cutscene.sprite_index = Scmouse_mmph;
				with (Ocharshake)
				{
					shake = true;
					shake_time = 5;
					shake_magnitude = 0.5;
					char = [Ohoots_cutscene, Ocharliemouse_cutscene];
					dir = "horz";
					cut_dontadd = true;
				}
				add_move_order();
			}
		},
		[ create_textbox, ["hootsmmph", hoots, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				with(instance_create_depth(0, 0, Opuffy.depth, Obubble))
				{
					char_track = Opuffy;
					bubble_type = 5;
					kill_time = 5;
				}
				
				add_move_order();
			}
		},
		[ create_textbox, ["didyahearsomething", puffy, false] ],
		function(){
			set_pos(Ocharliemouse_cutscene, 90, 32);
			
			Ocharliemouse_cutscene.sprite_index = Scmouse_whisper;
			Ohoots_cutscene.sprite_index = Splayer_capidle;
			Ohoots_cutscene.image_index = 3;
			Ohoots_cutscene.image_speed = 0;
			add_move_order();
		},
		[ create_textbox, ["nogoodbandits", charlie, true] ],
		[ costume_change, [hoots, Splayer_whisper, 0] ],
		[ create_textbox, ["treeandspy", hoots, true] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 3] ],
		[ costume_change, [charlie, charlie.idle_spr, 3] ],
		[ hold, [charlie, 2, "sec"] ],
		[ costume_change, [charlie, charlie.idle_spr, 2] ],
		[ hold, [charlie, 2, "sec"] ],
		function(){
			if (!instance_exists(Obubble))
			{
				with (instance_create_depth(0, 0, Ocharliemouse_cutscene.depth, Obubble))
				{
					char_track = Ocharliemouse_cutscene;
					bubble_type = 1;
					bounce = true;
					kill_time = 30;
					cut_add = true;
					h_mod = 1;
				}
			}
		},
		[ hold, [charlie, 15, "frm"] ],
		[ costume_change, [charlie, Scmouse_push] ],
		function(){
			set_pos(Ocharliemouse_cutscene, 87, 33);
			with (instance_create_depth(0, 0, Ocharliemouse_cutscene.depth, Osweatbeads)){ char_track = Ocharliemouse_cutscene; }
			add_move_order();
		},
		function(){
			var _gotrack = 0;
			if (goTo(Ohoots_cutscene, 72, 31, 45, 41, 0.5, false) = true){ _gotrack++; }
			if (goTo(Ocharliemouse_cutscene, 87, 33, 45, 41, 0.5, false) = true){ _gotrack++; }
			if (_gotrack = 2)
			{
				if (instance_exists(Osweatbeads))
				{
					with (Osweatbeads)
					{
						if (char_track = Ocharliemouse_cutscene)
						{
							instance_destroy();	
						}
					}
				}
				add_move_order(); 
			}
		},
		function(){
			//create charlie's tree arm
			if (!instance_exists(Ocmouse_treehang_arm))
			{
				set_pos(Ohoots_cutscene, 52, 41);
				set_pos(Ocharliemouse_cutscene, 44, 44);
				Ohoots_cutscene.sprite_index = Splayer_treehang;
				Ohoots_cutscene.image_speed = 0;
				Ocharliemouse_cutscene.sprite_index = Scmouse_treehang;
				instance_create_depth(44, 44, Ocharliemouse_cutscene.depth, Ocmouse_treehang_arm);
			}
			
			//MULTI GO-TO
			if (!instance_exists(Omulti_goto))
			{
				//HOOTS MULTI-GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = 52;
					origin_y = 41;
					x_pos = [41];
					y_pos = [41];
					spd = 1;	
				}
				
				//CHARLIE MULTI-GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ocharliemouse_cutscene;
					origin_x = 44;
					origin_y = 44;
					x_pos = [55];
					y_pos = [44];
					spd = 1;	
				}
			} else {
				
				if (Ohoots_cutscene.x = 41 && Ocharliemouse_cutscene.x = 55)
				{
					if (instance_exists(Ocmouse_treehang_arm)){ Ocmouse_treehang_arm.treed = true; }	
					while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					add_move_order();
				}
				
			}
		},
		[ hold, [hoots, 1, "sec"] ],
		[ create_textbox, ["anywayeasypeesy", puffy, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				with (Ocharshake)
				{
					shake = true;
					shake_time = "infin";
					shake_magnitude = 0.5;
					char = [Opuffy];
					dir = "horz";
					cut_dontadd = true;
				}
				add_move_order();
			}
		},
		[ create_textbox, ["illooo", puffy, false] ],
		[ costume_change, [puffy, puffy.idle_stormy_shocked_f_spr] ],
		function(){
			with (Ocharshake)
			{
				shake = false;
				shake_time = 0;
			}
			set_pos(Opuffy, 24, 91);
			//audio_pause_sound(Oaudio_manager.songInstance);
			add_move_order();
		},
		[ create_textbox, ["morningstroll", sniffles, false] ],
		[ costume_change, [puffy, puffy.idle_b_spr] ],
		//function(){
		//	audio_resume_sound(Oaudio_manager.songInstance);
		//	add_move_order();
		//},
		function(){
			if (!instance_exists(Omulti_goto))
			{
				
				set_song_pitch(1.5);
				
				//PUFFY MULTI-GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Opuffy;
					origin_x = 24;
					origin_y = 91;
					x_pos = [24, 42];
					y_pos = [44, 44];
					spd = 2;
					spr_list = [Opuffy.idle_b_spr, Opuffy.idle_shocked_r_spr];
				}
				
				//STUMP MULTI-GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ostump;
					origin_x = 38;
					origin_y = 92;
					x_pos = [71, 71, 51];
					y_pos = [72, 43, 43];
					spd = 2;
					spr_list = [Ostump.walk_br_spr, Ostump.walk_bl_spr, Ostump.walk_l_spr];
				}
			} else {
				//if puffy should be behind hootsworth
				if (Opuffy.y <= 48)
				{
					Opuffy.depth_manual = true;
					Opuffy.depth = Ohoots_cutscene.depth + 10;
				}
				if (Ostump.y <= 48)
				{
					Ostump.depth_manual = true;
					Ostump.depth = Ohoots_cutscene.depth + 10;	
				}
				
				//check and see if they're all done moving
				if (Opuffy.x = 42 && Opuffy.y = 44)
				{
					if (Ostump.x = 51 && Ostump.y = 43)
					{
						if (instance_exists(Osweatbeads)){ instance_destroy(Osweatbeads); }
						while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
						Opuffy.depth_manual = false;
						Ostump.depth_manual = false;
						add_move_order();	
					}
				}
			}
		},
		[ costume_change, [sniffles, Ssniffles_stroller] ],
		function(){
			set_pos(Opuffy, 49, 25);
			set_pos(Ostump, 49, 28);
			
			Opuffy.sprite_index = Spuffy_treehang;
			Ostump.sprite_index = Sstump_treehang;
			
			Opuffy.image_speed = 0;
			add_move_order();
		},
		function(){
			if (!instance_exists(Omulti_goto))
			{
				set_song_ingame("Overworld Theme.ogg", 15, 2 * FRAME_RATE, 0, true, noone, false, false, true);
				//SNIFFLES MULTI-GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Osniffles;
					origin_x = 185;
					origin_y = 109;
					x_pos = [98];
					y_pos = [109];
					spd = 0.5;
				}
			
				//STROLLER MULTI-GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Oegg_stroller;
					origin_x = 168;
					origin_y = 111;
					x_pos = [81];
					y_pos = [109];
					spd = 0.5;
				}
				Oegg_stroller.image_speed = 1;
				
				//PUFFY AND STUMP BEHIND TREE//
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Opuffy;
					origin_x = 49;
					origin_y = 25;
					x_pos = [40];
					y_pos = [25];
					spd = 1;
				}
				
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ostump;
					origin_x = 49;
					origin_y = 28;
					x_pos = [59];
					y_pos = [28];
					spd = 1;
				}
			} else {
				//check and see if they're all done moving
				if (Osniffles.x = 98 && Oegg_stroller.x = 81 && Opuffy.x = 40 && Ostump.x = 59)
				{
					while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					Osniffles.image_index = 1;
					Oegg_stroller.image_index = 1;
					add_move_order();	
				}
			}
		},
		[ create_textbox, ["wonderfultolive", sniffles, false] ],
		[ costume_change, [stroller, Sstroller_hop, "noloop"] ],
		[ costume_change, [stroller, Sstroller, 1] ],
		[ create_textbox, ["youdagree", sniffles, false] ],
		[ costume_change, [sniffles, Ssniffles_stroller_whistle] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				if (!instance_exists(Omulti_goto))
				{
					//SNIFFLES MULTI-GOTO
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Osniffles;
						origin_x = 98;
						origin_y = 109;
						x_pos = [-7];
						y_pos = [109];
						spd = 1;
					}
					
					//STROLLER MULTI-GOTO
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Oegg_stroller;
						origin_x = 81;
						origin_y = 109;
						x_pos = [-23];
						y_pos = [109];
						spd = 1;
					}
					Osniffles.image_index = 1;
					Oegg_stroller.image_index = 1;
					Osniffles.image_speed = 2;
					Oegg_stroller.image_speed = 2;
				} else {
					//check and see if they're all done moving
					if (Osniffles.x = -7 && Oegg_stroller.x = -23)
					{
						set_song_ingame("Bean Bandits.ogg", 1 * FRAME_RATE, 0, 0, true, noone, false, false, false, true);
						while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
						add_move_order();
					}
				}
			}
		},
		[ create_textbox, ["nowsourchance", puffy, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				Opuffy.image_index = 4;
				with (Ocharshake)
				{
					shake = true;
					shake_time = 5;
					shake_magnitude = 0.5;
					char = [Opuffy];
					dir = "horz";
					cut_dontadd = true;
				}
				add_move_order();
			}
		},
		[ create_textbox, ["oof", puffy, true] ],
		function(){
			if (!instance_exists(Omulti_goto) && !instance_exists(Otextbox))
			{
				//setting sprites first
				Opuffy.sprite_index = Spuffy_shocked_r;
				Opuffy.image_speed = 1;
				Ostump.sprite_index = Sstump_idle;
				Ostump.image_index = 2;
				
				//positions
				set_pos(Opuffy, 31, 31);
				set_pos(Ostump, 63, 33);
				
				//MUTLI GO-TO
				
				//PUFFY MULTI GO-TO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Opuffy;
					origin_x = 31;
					origin_y = 31;
					x_pos = [24];
					y_pos = [60];
					spd = 3;
				}
				
				//STUMP MULTI GO-TO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ostump;
					origin_x = 63;
					origin_y = 33;
					x_pos = [70];
					y_pos = [60];
					spd = 3;
				}
			} else {
				if (Opuffy.x = 24 && Opuffy.y = 60 && Ostump.x = 70 && Ostump.y = 60)
				{
					while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					add_move_order();
				}
			}
		},
		[ hold, [puffy, 5, "frm"] ],
		[ create_textbox, ["dafuzz", puffy, true] ],
		function(){
			if (!instance_exists(Omulti_goto) && !instance_exists(Otextbox))
			{
				set_song_pitch(2);
				
				//PUFFY MULTI GO-TO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Opuffy;
					origin_x = 24
					origin_y = 60;
					x_pos = [24, 170];
					y_pos = [102, 102];
					spd = 3;
					imagespd_manual = 2;
					spr_list = [Opuffy.idle_shocked_f_spr, Opuffy.idle_shocked_r_spr];
				}
				
				//STUMP MULTI-GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ostump;
					origin_x = 70;
					origin_y = 60;
					x_pos = [70, 170];
					y_pos = [102, 102];
					spd = 3;
					imagespd_manual = 2;
					spr_list = [Ostump.run_l_spr, Ostump.run_r_spr];
				}
			} else {
				if (Opuffy.x = 170 && Ostump.x = 170)
				{
					while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					add_move_order();		
				}
				
				//create falling letter
				if (Ostump.x > 135 && !instance_exists(Oloveletter_fall))
				{
					instance_create_depth(137, 93, -bbox_bottom, Oloveletter_fall);
				}
				
			}
		},
		[ hold, [hoots, 4, "sec"] ],
		function(){
			if (!instance_exists(Omulti_goto))
			{
				set_song_ingame(noone, 30);
				//setting sprites
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				Ohoots_cutscene.image_index = 3;
				Ohoots_cutscene.image_speed = 0;
				Ocharliemouse_cutscene.sprite_index = Scmouse_idle;
				Ocharliemouse_cutscene.image_index = 3;
				Ocharliemouse_cutscene.image_speed = 0;
				
				//setting positions
				set_pos(Ohoots_cutscene, 33, 50);
				set_pos(Ocharliemouse_cutscene, 63, 51);
				
				if (instance_exists(Ocmouse_treehang_arm)){ instance_destroy(Ocmouse_treehang_arm); }
				
				//MULTI GO-TO
				
				//HOOTSWORTH MULTI GO-TO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = 33;
					origin_y = 50;
					x_pos = [24];
					y_pos = [62];
					spd = 1;		
				}
				
				//CHARLIE MULTI GO-TO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ocharliemouse_cutscene;
					origin_x = 63;
					origin_y = 51;
					x_pos = [72];
					y_pos = [63];
					spd = 1;		
				}
				
			} else {
				if (Ohoots_cutscene.x = 24 && Ohoots_cutscene.y = 62 && Ocharliemouse_cutscene.x = 72 && Ocharliemouse_cutscene.y = 63)
				{
					while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					add_move_order();	
				}
				
				set_song_ingame("Crazy Theme.ogg");
			}
		},
		[ hold, [charlie, 10, "frm"] ],
		[ create_textbox, ["whatpuffysaid", charlie, true] ],
		[ costume_change, [charlie, charlie.walk_d_spr] ],
		[ goTo, [charlie, 72, 63, 72, 104, 2] ],
		[ costume_change, [charlie, charlie.walk_r_spr] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 3] ],
		[ create_textbox, ["waitcharlie", hoots, false] ],
		function(){
			if (!instance_exists(Omulti_goto))
			{
				with(instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ocharliemouse_cutscene;
					origin_x = 72;
					origin_y = 104;
					x_pos = [170];
					y_pos = [104];
					spd = 2;
				}
			} else {
				if (Ocharliemouse_cutscene.x = 170 && Ocharliemouse_cutscene.y = 104)
				{
					while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					add_move_order();	
				}
				
				set_song_ingame(noone, 60);
			}
		},
		[ create_textbox, ["ohwellsuchbold", hoots, true] ],
		[ hold, [hoots, 1, "sec"] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				instance_create_depth(136, 104, -bbox_bottom, Oletter_flash);
				add_move_order();
			}
		},
		[ hold, [hoots, 2, "sec"] ],
		[ create_textbox, ["hootwhatsthat", hoots, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				set_song_ingame("Overworld Theme.ogg");
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
				
			//destroy all cutscene characters (we wont need them till later)
			var _inst = [charlie, puffy, sniffles, stump, stroller];
			for (var i = 0; i < array_length(_inst); i++)
			{
				if (instance_exists(_inst[i]))
					instance_destroy(_inst[i]);
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
			
			Ogame.alarm[1] = 5; //autosave
		}
			
	}
		
	//show_debug_message("array_length: " + string(array_length(global.moveOrder)));	
	//show_debug_message("move beat: " + string(global.moveOrder_beat));
}