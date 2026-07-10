function cut_confrontinsniffhouse(){
	global.story_beat = STORY_PACE.CONFRONT_IN_SNIFF_HOUSE;
	get_scene_cast(global.story_beat);
	
	var hoots = Ohoots_cutscene;
	
	global.moveOrder = [
		function(){
			set_song_ingame("Bean Bandits.ogg");
			
			//destroy deer if it's still alive
			if (instance_exists(Otrojandeer)){ instance_destroy(Otrojandeer); }
			if (!instance_exists(Omulti_goto))
			{
				set_pos(Opuffy, 80, 60);
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Opuffy;
					origin_x = 80;
					origin_y = 60;
					x_pos = [56, 72, 72, 80];
					y_pos = [60, 44, 60, 60];
					spd = 2;
					spr_list = [Spuffy_idle_l_nosmi, Spuffy_idle_b, Spuffy_idle_f_nosmi, Spuffy_idle_r_nosmi];
					pause_after_beat = 10;
					loop_move = true;
				}
			}
			Ohoots_cutscene.sprite_index = Splayer_capidle;
			Ohoots_cutscene.image_index = 1;
			Ohoots_cutscene.image_speed = 0;
			set_pos(Ohoots_cutscene, 80, 125);
			Ocharliemouse_cutscene.sprite_index = Scmouse_idle;
			Ocharliemouse_cutscene.image_index = 1;
			Ocharliemouse_cutscene.image_speed = 0;
			set_pos(Ocharliemouse_cutscene, 80, 128);
				
			if (!instance_exists(Ofade)){ add_move_order(); }	
		},
		function(){
			//hoots and charlie are going to move while puffy is moving
				//hoots
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = 80;
					origin_y = 125;
					x_pos = [98, 119];
					y_pos = [123, 106];
					spd = 0.75;
					spr_list = [Splayer_capwalk_u, Splayer_capwalk_u];
					spr_done = Splayer_capidle;
					img_done = 3;
				}
				
				//charlie
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ocharliemouse_cutscene;
					origin_x = 80;
					origin_y = 128;
					x_pos = [103];
					y_pos = [107];
					spd = 0.75;
					spr_list = [Scmouse_walkb];	
					spr_done = Scmouse_idle;
					img_done = 3;
				}
			add_move_order();
		},
		function(){
			if (Ohoots_cutscene.x = 119 && Ohoots_cutscene.y = 106 && Ocharliemouse_cutscene.x = 103 && Ocharliemouse_cutscene.y = 107) 
			{
				with (Omulti_goto)
				{
					if (object = Ohoots_cutscene || object = Ocharliemouse_cutscene)
					{
						instance_destroy();
					}
				}
				add_move_order();
			}
		},
		function(){
			if (instance_exists(Omulti_goto))
			{
				if (Opuffy.x = 80 && Opuffy.y = 60)
				{
					Opuffy.sprite_index = Spuffy_lookaround;
					Opuffy.image_speed = 1;
					while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					add_move_order();
				}
			}
		},
		[ hold, [hoots, 20, "frm"] ],
		[ create_textbox, ["notovahhere", hoots, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				Opuffy.sprite_index = Spuffy_stormy_f;
				
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
		[ create_textbox, ["teardishouse", hoots, true] ],
		[ hold, [hoots, 10, "frm"] ],
		function(){
			with (Ocharshake)
			{
				shake = false;	
			}
			add_move_order();
		},
		function(){
			if (!instance_exists(Omulti_goto))
			{
				//charlie forward roll
				var _x = Ocharliemouse_cutscene.x;
				var _y = Ocharliemouse_cutscene.y;
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ocharliemouse_cutscene;
					origin_x = _x;
					origin_y = _y;
					x_pos = [80];
					y_pos = [108];
					spd = 3;
					spr_list = [Scmouse_walkl];	
					spr_done = Scmouse_interrogate;
					uphill_move = true;
				}
				
				//hoots move to a more convienient spot
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = 119;
					origin_y = 106;
					x_pos = [103];
					y_pos = [106];
					spd = 1;
					spr_list = [Splayer_capidle];	
					spr_done = Splayer_capidle;
					img_done = 3;
					imagespd_manual = -0.5;
				}
				
			} else if (Ocharliemouse_cutscene.x = 80 && Ocharliemouse_cutscene.y = 108) {
				Ocharliemouse_cutscene.sprite_index = Scmouse_interrogate;
				if (Ohoots_cutscene.x = 103)
				{
					Ohoots_cutscene.sprite_index = Splayer_capidle;
					Ohoots_cutscene.image_index = 3;
					Ohoots_cutscene.image_speed = 0;
					while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					add_move_order();
				}
			}
		},
		[ hold, [hoots, 5, "frm"] ],
		[ create_textbox, ["stoprightthere", hoots, false] ],
		[ create_textbox, ["youagainpuff", hoots, true] ],
		[ costume_change, [hoots, Splayer_cornerpophead, "noloop"] ],
		[ hold, [hoots, 5, "frm"] ],
		[ create_textbox, ["hespreoccu", hoots, false] ],
		[ create_textbox, ["hemessespwans", hoots, true] ],
		[ hold, [hoots, 5, "frm"] ],
		function(){
			set_song_ingame(noone);
			add_move_order();
		},
		[ create_textbox, ["whatrelaxingwalk", hoots, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				//all da boyz get mor bubs
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Opuffy;
					bubble_type = 5;
					kill_time = 15;
				}
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Ohoots_cutscene;
					bubble_type = 5;
					kill_time = 15;
				}
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Ocharliemouse_cutscene;
					bubble_type = 5;
					kill_time = 15;
				}
				play_sfx(snd_exclamationpoint);
			
				//shake and bake wit da boyz
				with (Ocharshake)
				{
					shake = true;
					shake_time = 5;
					shake_magnitude = 1;
					shake_fade = 0.5;
					char = [Opuffy, Ohoots_cutscene, Ocharliemouse_cutscene];
					cut_dontadd = true;
					dir = "horz";
				}
				
				add_move_order();
			}
		},
		function(){
			if (!instance_exists(Otextbox))
			{
				//change da boyz sprites (thirst thirstiest time)
				Opuffy.sprite_index = Spuffy_shocked_f;
				Opuffy.image_speed = 0;
				//change hoots spr once drawn
				costume_change(Ocharliemouse_cutscene, Scmouse_distressed_front, 0, "nomove");
				
				//sniffles comes in	
				if (!instance_exists(Omulti_goto))
				{
					play_sfx(snd_landing, 1, 0.5);
					set_pos(Osniffles, 87, 127);
					Osniffles.sprite_index = Ssniffles_stroller;
					instance_create_depth(70, 127, Osniffles.depth, Oegg_stroller);
				
					//sniffles
						with (instance_create_depth(0, 0, 0, Omulti_goto))
						{
							object = Osniffles;
							origin_x = 87;
							origin_y = 127;
							x_pos = [87];
							y_pos = [120];
							spd = 2;
							spr_list = [Ssniffles_stroller];
						}
					//egg stroller
						with (instance_create_depth(0, 0, 0, Omulti_goto))
						{
							object = Oegg_stroller;
							origin_x = 70;
							origin_y = 127;
							x_pos = [70];
							y_pos = [120];
							spd = 2;
							spr_list = [Sstroller];
						}
				} else if (Osniffles.y = 120 && Oegg_stroller.y = 120) {
					while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					add_move_order();	
				}
			}
		},
		[ hold, [hoots, 10, "frm"] ],
		[ costume_change, [Osniffles, Ssniffles_stroller_shock] ],
		[ costume_change, [Oegg_stroller, Sstroller_hop, "noloop"] ],
		[ create_textbox, ["doesntmatchnarration", hoots, false] ],
		[ hold, [hoots, 5, "frm"] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				costume_change(Opuffy, Spuffy_determined_f, "nomove");
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Opuffy;
					bubble_type = 5;
					kill_time = 15;
				}
				play_sfx(snd_exclamationpoint);
				add_move_order();
			}
		},
		[ hold, [hoots, 5, "frm"] ],
		[ create_textbox, ["datwooksimpor", hoots, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				if (!instance_exists(Omulti_goto))
				{
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Opuffy;
						origin_x = 80;
						origin_y = 60;
						x_pos = [80];
						y_pos = [96];
						spd = 2;
						spr_list = [Spuffy_determined_f];		
					}
				} else if (Opuffy.y = 96) {
					while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					add_move_order();
				}
			}
		},
		//knock into charlie
		function(){
			if (!instance_exists(Omulti_goto))
			{
				//puffy
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Opuffy;
						origin_x = 80;
						origin_y = 96;
						x_pos = [80];
						y_pos = [111];
						spd = 2;
						spr_list = [Spuffy_determined_f];
					}
				//charlie
					var _x = Ocharliemouse_cutscene.x;
					var _y = Ocharliemouse_cutscene.y;
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Ocharliemouse_cutscene;
						origin_x = _x;
						origin_y = _y;
						x_pos = [53];
						y_pos = [108];
						spd = 3;
						spr_list = [Scmouse_diag_shock];
						uphill_move = true;	
					}
			} else if (Opuffy.y = 111) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				add_move_order();	
			}
		},
		//knock into sniffles and stroller
		function(){
			if (!instance_exists(Omulti_goto))
			{
				//puffy
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Opuffy;
						origin_x = 80;
						origin_y = 111;
						x_pos = [80];
						y_pos = [122];
						spd = 2;
						spr_list = [Spuffy_eggcarry_f];
						img_spd_done = 1;
					}
				//sniffles
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Osniffles;
						origin_x = 87;
						origin_y = 120;
						x_pos = [87];
						y_pos = [96];
						spd = 3;
						spr_list = [Ssniffles_stroller];
						uphill_move = true;
						img_spd_done = 0;
					}
				//egg stroller
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Oegg_stroller;
						origin_x = 70;
						origin_y = 120;
						x_pos = [57];
						y_pos = [120];
						spd = 3;
						spr_list = [Sstroller_noegg];
						uphill_move = true;	
					}
			} else if (Opuffy.y = 122 && Osniffles.y = 96 && Oegg_stroller.x = 57) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				add_move_order();			
			}
		},
		[ hold, [hoots, 5, "frm"] ],
		[ costume_change, [Opuffy, Spuffy_eggcarry_b] ],
		[ create_textbox, ["seesuckahs", hoots, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				if (!instance_exists(Omulti_goto))
				{
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Opuffy;
						origin_x = 80;
						origin_y = 122;
						x_pos = [80];
						y_pos = [128];
						spd = 2;
						spr_list = [Spuffy_eggcarry_f];	
					}
				} else if (Opuffy.y = 128) {
					while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					Opuffy.visible = false;
					add_move_order();
				}
			}
		},
		[ costume_change, [Osniffles, Ssniffles_idle] ],
		function(){
			with (Ocharshake)
			{
				shake = true;
				shake_time = 5;
				shake_magnitude = 1;
				shake_fade = 0.5;
				char = [Osniffles];
				cut_dontadd = true;
				dir = "horz";
			}
			add_move_order();
		},
		[ hold, [hoots, 10, "frm"] ],
		[ create_textbox, ["myniece", hoots, false] ],
		[ create_textbox, ["mynieceachoo", hoots, true] ],
		function(){
			if (!instance_exists(Omulti_goto))
			{	
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Osniffles;
					origin_x = 87;
					origin_y = 96;
					x_pos = [87];
					y_pos = [52];
					spr_list = [Ssniffles_achoo];
					spd = 6;
					spr_done = Ssniffles_idle;
				}
			} else if (Osniffles.y = 52) {
				while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				
				//shake screen
				with (Oscreenshake)
				{
					shake = true;
					shake_time = 15;
					shake_magnitude = 0.5;
					shake_fade = 0.25;
					dontadd = true;
				}
				
				//bubs on da mayne boyz
				costume_change(Ohoots_cutscene, Splayer_diag_shock, "nomove");
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Ohoots_cutscene;
					bubble_type = 5;
					kill_time = 15;
				}
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Ocharliemouse_cutscene;
					bubble_type = 5;
					kill_time = 15;
				}
				play_sfx(snd_exclamationpoint);
				
				//tilt shelf
				with (Osniffhouse_plateshelf){ tilt = true; }
				
				add_move_order();
			}
		},
		[ hold, [hoots, 10, "frm"] ],
		function(){
			if (!instance_exists(Omulti_goto))
			{
				//hoots
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Ohoots_cutscene;
						origin_x = 103;
						origin_y = 106;
						x_pos = [87, 87];
						y_pos = [106, 80];
						spd = 2;
						spr_list = [Splayer_capwalk_l, Splayer_capwalk_u];
						spr_done = Splayer_capidle;
						img_done = 1;
					}
				//charlie
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Ocharliemouse_cutscene;
						origin_x = 53;
						origin_y = 108;
						x_pos = [70, 70];
						y_pos = [108, 52];
						spd = 2;
						spr_list = [Scmouse_walkr, Scmouse_walkb];
						spr_done = Scmouse_distressed_side;
						img_spd_done = 1;
					}
			} else if (Ocharliemouse_cutscene.y = 52 && Ohoots_cutscene.y = 80) {
				while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }	
				add_move_order();
			}
		},
		[ hold, [hoots, 15, "frm"] ],
		[ create_textbox, ["sinusesterrible", hoots, true] ],
		[ hold, [hoots, 10, "frm"] ],
		[ costume_change, [Ocharliemouse_cutscene, Scmouse_sweat_side] ],
		[ hold, [hoots, 30, "frm"] ],
		[ costume_change, [Osniffles, Ssniffles_idle, "flip"] ],
		[ hold, [hoots, 30, "frm"] ],
		[ costume_change, [Osniffles, Ssniffles_idle] ],
		[ hold, [hoots, 30, "frm"] ],
		[ costume_change, [Osniffles, Ssniffles_idle, "flip"] ],
		[ hold, [hoots, 30, "frm"] ],
		[ costume_change, [Osniffles, Ssniffles_idle] ],
		[ hold, [hoots, 15, "frm"] ],
		[ create_textbox, ["letsmovecharlie", hoots, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				with (instance_create_depth(0, 0, -room_height, Ofade))
				{
					trans_type = "fade";	
					newRoom = Rneighborhood;
					newX = 0;
					newY = 0;
					fadeColor = darkbrown_col;
					fadeSpd = 0.015;
					delay_out = 15;
				}
				add_move_order();
			}
		},
		function(){
			with (instance_create_depth(0, 0, 0, Omulti_goto))
			{
				object = Ohoots_cutscene;
				origin_x = 87;
				origin_y = 80;
				x_pos = [87, 80];
				y_pos = [120, 126];
				spd = 1;
				spr_list = [Splayer_capwalk_d, Splayer_capwalk_d];
				spr_done = Splayer_capidle;
				img_done = 3;	
			}
			add_move_order();
		},
		[ hold, [hoots, 15, "frm"] ],
		[ costume_change, [Ocharliemouse_cutscene, Scmouse_idle, 0] ],
		[ hold, [hoots, 15, "frm"] ],
		function(){
			with (instance_create_depth(0, 0, 0, Omulti_goto))
			{
				object = Ocharliemouse_cutscene;
				origin_x = 70;
				origin_y = 52;
				x_pos = [70];
				y_pos = [121];
				spd = 1;
				spr_list = [Scmouse_walkf];
				spr_done = Scmouse_idle;
				img_spd_done = 3;
			}
			add_move_order();
		},
		function(){
			if (Ohoots_cutscene.y = 126)
			{
				Ohoots_cutscene.visible = false;
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
			
		end_scene(true, true);
	}
}