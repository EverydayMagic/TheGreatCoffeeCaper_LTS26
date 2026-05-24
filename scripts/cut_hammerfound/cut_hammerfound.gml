function cut_hammerfound(){
	global.story_beat = STORY_PACE.HAMMER_FOUND;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	var clawdine = Oclawdine;

	global.moveOrder = [
		function(){
			if (!instance_exists(Omulti_goto))
			{
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				Ohoots_cutscene.image_index = 0;
				Ohoots_cutscene.image_speed = 0;
				Ohoots_cutscene.visible = true;
				Ocharliemouse_cutscene.visible = true;
				var _x = Ohoots_cutscene.x;
				var _y = Ohoots_cutscene.y;
				
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = _x;
					origin_y = _y;
					x_pos = [104, 104, 80, 80, 63, 63];
					y_pos = [46, 58, 58, 70, 70, 81];
					spd = 1;
					spr_list = [Splayer_capwalk_r, Splayer_capwalk_d, Splayer_capwalk_l, Splayer_capwalk_d, Splayer_capwalk_l, Splayer_capwalk_d];
				}
			} else if (Ohoots_cutscene.x = 63 && Ohoots_cutscene.y = 81) {
				while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				Ohoots_cutscene.image_index = 0;
				Ohoots_cutscene.image_speed = 0;
				add_move_order();
			}
		},
		
		[ create_textbox, ["handedhammer", hoots, false] ],
		[ costume_change, [clawdine, Sclawdine_idle, 2] ],
		function(){
			if (!instance_exists(Obubble))
			{
				with (instance_create_depth(0, 0, Oclawdine.depth - 10, Obubble))
				{
					char_track = Oclawdine;
					bubble_type = 5;
					h_mod = 2;
					bounce = true;
					kill_time = 10;
					cut_add = true;
				}
			}
		},
		[ hold, [clawdine, 3, "frm"] ],
		function(){
			with (instance_create_depth(0, 0, 0, Ochar_jump))
			{
				char = [Oclawdine];
				time = 5;
				endy = [(Oclawdine.y - 4)];
				cut_dontadd = true;
				infin = true;
				wait_time = 5;
			}
			//sparkle sfx
			play_sfx(snd_sparkle);
			
			add_move_order();
		},
		[ create_textbox, ["myhammer", clawdine, true] ],
		[ hold, [clawdine, 10, "frm"] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				with (Ochar_jump)
				{
					var _check = false;
					for (var i = 0; i < array_length(char); i++)
					{
						if (char[i].y = starty[i])
							_check = true;
						else
							_check = false;
					}
					if (_check)
					{
						char = [];
						instance_destroy();
						add_move_order();
					}
				}
			}
		},
		[ create_textbox, ["hammerthanks", clawdine, true] ],
		[ hold, [clawdine, 3, "frm"] ],
		function(){
			play_sfx(snd_jumping);
			add_move_order();
		},
		function(){
			if (!instance_exists(Opath_arc) && !instance_exists(Otextbox))
			{
				//change clawdine sprite
				Oclawdine.sprite_index = Sclawdine_roll_notail;
				Oclawdine.image_index = 0;
				Oclawdine.image_speed = 2;
				//change hoots sprite
				Ohoots_cutscene.sprite_index = Splayer_lookup;
				Ohoots_cutscene.image_index = 1;
				//change charlie sprite
				Ocharliemouse_cutscene.sprite_index = Scmouse_diag_shock;
				
				var _x = Oclawdine.x;
				var _y = Oclawdine.y;
				
				//PATH ARC
				with (instance_create_depth(0, 0, 0, Opath_arc))
				{
					curving = true;
					x1 = _x;
					y1 = _y;
					x2 = 32;
					y2 = 61;
					curve_height = 56;
					max_points_per_side = 15;
					obj = Oclawdine;
					spd = 8;
				}
			}
		},
		function(){
			play_sfx(snd_building);
			add_move_order();
		},
		[ costume_change, [clawdine, Sclawdine_dustcloud] ],
		function() {
			if (!instance_exists(Omulti_goto))
			{	
				//HOOTS MULTI GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = 63;
					origin_y = 81;
					x_pos = [63, 96, 96];
					y_pos = [89, 89, 110];
					spd = 1;
					spr_list = [Splayer_capwalk_d, Splayer_capwalk_r, Splayer_capwalk_d];
				}
				
				//CHARLIE MULTI GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ocharliemouse_cutscene;
					origin_x = 48;
					origin_y = 111;
					x_pos = [64];
					y_pos = [111];
					spd = 1;
					spr_list = [Scmouse_walkr];
				}
			} else {
				if (Ohoots_cutscene.x = 96 && Ohoots_cutscene.y = 110)
				{
					while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); global.multi_goto_done = 0;}
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
		[ hold, [hoots, 0.75, "sec"] ],
		[ costume_change, [hoots, Splayer_capsit_sleep] ],
		[ hold, [hoots, 0.75, "sec"] ],
		function()
		{ 
			Oclawdine.sprite_index = Sclawdine_walk_r;
			Oclawdine.image_index = 3;
			Oclawdine.image_speed = 0;
			
			if (!audio_is_playing(snd_zippingaway))
			{
				audio_stop_sound(snd_building);
				play_sfx(snd_zippingaway);	
			}
			
			with (instance_create_depth(0, 0, Oclawdine.depth - 10, Omultispr_char_fade))
			{
				char = [Oclawdine];
				frequency = 1;
				total_time = 10;
				fade_time = 15;
			}
			
			add_move_order(); 
		},
		[ goTo, [clawdine, 32, 61, 41, 73, 4] ],
		function(){
			Oclawdine.sprite_index = Sclawdine_deerhold;
			Oclawdine.image_index = 0;
			with (instance_create_depth(42, 62, Oclawdine.depth + 1, Oshine))
			{
				image_speed = 2;
			}
			play_sfx(snd_fanfareshort);
			add_move_order();
		},
		[ hold, [clawdine, 2, "sec"] ],
		function(){
			if (instance_exists(Oshine))
			{
				instance_destroy(Oshine);
				add_move_order();
			}
		},
		[ create_textbox, ["sayididgood", clawdine, true] ],
		[ create_textbox, ["didntshehoots", charlie, false] ],
		[ create_textbox, ["carryha", clawdine, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				play_sfx(snd_jumping);
				add_move_order();
			}
		},
		function(){
			if (!instance_exists(Opath_arc) && !instance_exists(Otextbox))
			{
				//change clawdine sprite
				Oclawdine.sprite_index = Sclawdine_deerhold_lunge;
				Oclawdine.image_index = 1;
				//change hoots sprite
				Ohoots_cutscene.sprite_index = Splayer_diag_shock;
				//change charlie sprite
				Ocharliemouse_cutscene.sprite_index = Scmouse_diag_shock;
				
				var _x = Oclawdine.x;
				var _y = Oclawdine.y;
				
				//PATH ARC
				with (instance_create_depth(0, 0, 0, Opath_arc))
				{
					curving = true;
					x1 = _x;
					y1 = _y;
					x2 = 81;
					y2 = 82;
					curve_height = 36;
					max_points_per_side = 15;
					obj = Oclawdine;
					spd = 8;
				}
				
			}
		},
		function(){
			play_sfx(snd_throwing);
			add_move_order();
		},
		[ costume_change, [clawdine, Sclawdine_deerthrow, "noloop"] ],
		function(){
			instance_create_depth(80, 92, Oclawdine.depth - 1, Otrojandeer);
			with (Oscreenshake)
			{
				if (!shake)
				{
					shake = true;
					shake_time = 5;
					shake_magnitude = 1;
					shake_fade = 0.5;
					dontadd = true;
				}
			}
			play_sfx(snd_landing);
			add_move_order();
		},
		[ costume_change, [clawdine, Sclawdine_getup, "noloop"] ],
		function(){
			if (Oscreenshake.shake = false)
				add_move_order();
		},
		[ hold, [clawdine, 3, "frm"] ],
		function(){
			Oclawdine.sprite_index = Sclawdine_smile;
			add_move_order();
		},
		[ create_textbox, ["youfitinside", clawdine, false] ],
		function(){
			if (!instance_exists(Opath_arc) && !instance_exists(Otextbox))
			{
				play_sfx(snd_jumping_highpitch);
				
				//change clawdine sprite
				Oclawdine.sprite_index = Sclawdine_roll_notail;
				Oclawdine.image_index = 0;
				Oclawdine.image_speed = 1;
				//change hoots sprite
				Ohoots_cutscene.sprite_index = Splayer_diag_shock;
				//change charlie sprite
				Ocharliemouse_cutscene.sprite_index = Scmouse_diag_shock;
				
				var _x = Oclawdine.x;
				var _y = Oclawdine.y;
				
				//PATH ARC
				with (instance_create_depth(0, 0, 0, Opath_arc))
				{
					curving = true;
					x1 = _x;
					y1 = _y;
					x2 = 95;
					y2 = 105;
					curve_height = 72;
					max_points_per_side = 15;
					obj = Oclawdine;
					spd = 8;
				}
			} else if (instance_exists(Opath_arc)) {
				
				with (Opath_arc)
				{
					if (obj.path_position >= 0.5)
					{
						if (instance_exists(Otrojandeer))
						{
							obj.depth_manual = true;
							obj.depth = Ohoots_cutscene.depth + 1;
							Otrojandeer.depth = obj.depth + 10;
						}
						obj.sprite_index = Sclawdine_roll;
					}
				}
				
			}
		
		},
		[ costume_change, [clawdine, Sclawdine_idle, 3] ],
		[ hold, [clawdine, 3, "frm"] ],
		function(){
			//change clawdine sprites
			Oclawdine.sprite_index = Sclawdine_hold_f;
			Oclawdine.image_index = 0;
			Oclawdine.image_speed = 0;
			
			//change hoots sprites
			Ohoots_cutscene.sprite_index = Splayer_cap_carriedflap;
			set_pos(Ohoots_cutscene, Oclawdine.x, Oclawdine.y - 12);
			Ohoots_cutscene.depth_manual = true;
			Ohoots_cutscene.depth = Oclawdine.depth - 1;
			
			//bubble
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
			play_sfx(snd_grabbing);
			
			add_move_order();
		},
		[ hold, [clawdine, 1, "frm"] ],
		function(){
			if (!instance_exists(Opath_arc))
			{
				//change clawdine sprite
				Oclawdine.sprite_index = Sclawdine_hold_b;
				Oclawdine.image_index = 0;
				Oclawdine.image_speed = 0;
				
				var _x = Oclawdine.x;
				var _y = Oclawdine.y;
				
				//PATH ARC
				with (instance_create_depth(0, 0, 0, Opath_arc))
				{
					curving = true;
					x1 = _x;
					y1 = _y;
					x2 = 81;
					y2 = 82;
					curve_height = 72;
					max_points_per_side = 15;
					obj = Oclawdine;
					spd = 8;
				}
			} else {
				set_pos(Ohoots_cutscene, Oclawdine.x, Oclawdine.y - 12);
				
				with (Opath_arc)
				{
					if (obj.path_position >= 0.5)
					{
						if (instance_exists(Otrojandeer))
						{
							obj.depth_manual = true;
							obj.depth = Ohoots_cutscene.depth + 1;
							Otrojandeer.depth_manual = true;
							Otrojandeer.depth = Ohoots_cutscene.depth - 10;
							
							Ohoots_cutscene.depth = Oclawdine.depth - 1;
						}
					}
				}
			}
		},
		[ costume_change, [clawdine, Sclawdine_hold_f, 0] ],
		[ costume_change, [Otrojandeer, Strojandeer_open, "noloop"] ],
		function(){
			show_debug_message("we are here!");
			if (!instance_exists(Omulti_goto))
			{
				play_sfx(snd_jumping_highpitch);
				
				Oclawdine.sprite_index = Sclawdine_hoots_jumpthrow;
				Oclawdine.image_index = 0;
				Oclawdine.image_speed = 1;
				
				var _x = Ohoots_cutscene.x;
				var _y = Ohoots_cutscene.y;
				
				//HOOTS MULTI GOTO
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = _x;
					origin_y = _y;
					x_pos = [_x];
					y_pos = [_y - 10];
					spd = 5;
					spr_list = [Splayer_cap_carriedflap];
				}	
			} else {
				Ohoots_cutscene.depth = Otrojandeer.depth - 1;
				
				if (Oclawdine.image_index >= (Oclawdine.image_number - 1))
				{
					Oclawdine.image_speed = 0;	
				} else { Oclawdine.image_speed = 1; }
				
				if (Oclawdine.image_index > 3 && (Oclawdine.image_index < (Oclawdine.image_number - 1)))
				{
					Ohoots_cutscene.visible = false;
					Oclawdine.depth = Otrojandeer.depth - 1;
					
					if (!audio_is_playing(snd_throwing)){ play_sfx(snd_throwing); }
				} else {
					if (Oclawdine.image_index >= (Oclawdine.image_number - 1))
					{
						Oclawdine.depth = Otrojandeer.depth + 1;
					}
				}
				show_debug_message("hoots x = " + string(Ohoots_cutscene.x));
				show_debug_message("hoots y = " + string(Ohoots_cutscene.y));
				show_debug_message("claw x = " + string(Oclawdine.x));
				show_debug_message("claw y = " + string(Oclawdine.y));
				show_debug_message("claw img: " + string(Oclawdine.image_index) + " / " + string(Oclawdine.image_number));
				if (Ohoots_cutscene.visible = false && (Oclawdine.image_index >= (Oclawdine.image_number - 1)))
				{
					while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					Oclawdine.sprite_index = Sclawdine_land;
					Oclawdine.depth = Otrojandeer.depth + 10;
					Oclawdine.image_index = 3;
					Oclawdine.image_speed = 0;
					
					with (Ocharshake)
					{
						shake = true;
						shake_time = 10;
						shake_magnitude = 0.5;
						shake_fade = 0.25;
						char = [Otrojandeer];
						cut_dontadd = true;
						dir = "horz";		
					}
					play_sfx(snd_landing);
					add_move_order();
				}
			}
		},
		[ hold, [clawdine, 8, "frm"] ],
		function(){
			if (!instance_exists(Opath_arc))
			{
				play_sfx(snd_jumping_highpitch);
				
				//change clawdine sprite
				Oclawdine.sprite_index = Sclawdine_roll;
				Oclawdine.image_index = 0;
				Oclawdine.image_speed = 1;
				
				var _x = Oclawdine.x;
				var _y = Oclawdine.y;
				
				//PATH ARC
				with (instance_create_depth(0, 0, 0, Opath_arc))
				{
					curving = true;
					x1 = _x;
					y1 = _y;
					x2 = 60;
					y2 = 93;
					curve_height = 72;
					max_points_per_side = 15;
					obj = Oclawdine;
					spd = 16;
				}
			} else {
				with (Opath_arc)
				{
					if (obj.path_position >= 0.5)
					{
						if (instance_exists(Otrojandeer))
						{
							obj.depth = Ocharliemouse_cutscene.depth + 1;
						}
					}
				}
			}
		},
		[ costume_change, [clawdine, Sclawdine_fire] ],
		[ hold, [clawdine, 5, "frm"] ],
		[ create_textbox, ["clawdinefire...", clawdine, false] ],
		[ hold, [charlie, 7, "frm"] ],
		function(){
			
			with (instance_create_depth(0, 0, 0, Osweatbeads))
			{
				char_track = Ocharliemouse_cutscene;
				h_mod = 3;
			}
			with (Ocharshake)
			{
				shake = true;
				shake_time = 10;
				shake_magnitude = 0.25;
				shake_fade = 0.1;
				char = [Ocharliemouse_cutscene];
				cut_dontadd = true;
				dir = "horz";		
			}
			//charlie depth
			Ocharliemouse_cutscene.depth_manual = true;
			Ocharliemouse_cutscene.depth = Ocoffee_barrel.depth + 1;
			
			add_move_order();
		},
		[ goTo, [charlie, 64, 111, 64, 115, 1] ],
		[ hold, [charlie, 8, "frm"] ],
		[ create_textbox, ["seemyselfin", charlie, false] ],
		[ hold, [charlie, 8, "frm"] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				if (!instance_exists(Omulti_goto))
				{
					if (instance_exists(Otrojandeer))
					{
						Otrojandeer.depth_manual = false;	
					}
					
					if (instance_exists(Osweatbeads)){ instance_destroy(Osweatbeads); }
				
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Ocharliemouse_cutscene;
						origin_x = 64;
						origin_y = 115;
						x_pos = [64, 80];
						y_pos = [108, 108];
						spd = 1;
						spr_list = [Scmouse_diag_shock, Scmouse_diag_shock];	
					}
				} else if (Ocharliemouse_cutscene.x = 80 && Ocharliemouse_cutscene.y = 108) {
					while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
					Ocharliemouse_cutscene.sprite_index = Scmouse_idle;
					Ocharliemouse_cutscene.image_index = 1;
					Ocharliemouse_cutscene.image_speed = 0;
				
					Oclawdine.sprite_index = Sclawdine_idle;
					Oclawdine.image_index = 0;
					Oclawdine.image_speed = 0;
				
					if (instance_exists(Osweatbeads)){ instance_destroy(Osweatbeads); }
				
					add_move_order();
				}
			}
		},
		function(){
			if (!instance_exists(Opath_arc))
			{
				Ocharliemouse_cutscene.depth_manual = true;
				
				var _x = Ocharliemouse_cutscene.x;
				var _y = Ocharliemouse_cutscene.y;
				
				//PATH ARC
				with (instance_create_depth(0, 0, 0, Opath_arc))
				{
					curving = true;
					x1 = _x;
					y1 = _y;
					x2 = _x;
					y2 = 84;
					curve_height = 72;
					max_points_per_side = 15;
					obj = Ocharliemouse_cutscene;
					spd = 4;
				}	
			} else {
				Ocharliemouse_cutscene.depth = Otrojandeer.depth - 1;
			}
		},
		function(){
			if (instance_exists(Ocharliemouse_cutscene))
			{
				Ocharliemouse_cutscene.visible = false;
				add_move_order();
			}
		},
		[ costume_change, [Otrojandeer, Strojandeer_close, "noloop"] ],
		[ hold, [clawdine, 15, "frm"] ],
		[ costume_change, [Otrojandeer, Strojandeer_idle, 3] ],
		function(){
			if (!instance_exists(Opath_arc))
			{
				play_sfx(snd_jumping_highpitch);
				
				Oclawdine.sprite_index = Sclawdine_roll;
				Oclawdine.image_index = 0;
				Oclawdine.image_speed = 1;
				
				var _x = Oclawdine.x;
				var _y = Oclawdine.y;
				
				//PATH ARC
				with (instance_create_depth(0, 0, 0, Opath_arc))
				{
					curving = true;
					x1 = _x;
					y1 = _y;
					x2 = 81;
					y2 = 78;
					curve_height = 72;
					max_points_per_side = 15;
					obj = Oclawdine;
					spd = 16;
				}
			} else {
				Oclawdine.depth = Otrojandeer.depth + 1;		
			}
		},
		[ costume_change, [Oclawdine, Sclawdine_idle, 3] ],
		[ create_textbox, ["readytoride", clawdine, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				Oclawdine.sprite_index = Sclawdine_slash;
				Oclawdine.image_index = 0;
				Oclawdine.image_speed = 1;
				
				add_move_order();
			}
		},
		function(){
			if ((Oclawdine.sprite_index = Sclawdine_slash) && (Oclawdine.image_index >= (Oclawdine.image_number - 1)))
			{	
				Oclawdine.sprite_index = Sclawdine_laugh;
				Oclawdine.image_index = 0;
				Oclawdine.image_speed = 1;
				
				add_move_order();
			}
			
			if (Oclawdine.image_index > 2 && !instance_exists(Omulti_goto))
			{
				play_sfx(snd_throwing, 1, 1.5);
				
				//screenshake
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
				
				var _x = Otrojandeer.x;
				var _y = Otrojandeer.y;
				
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Otrojandeer;
					origin_x = _x;
					origin_y = _y;
					x_pos = [80];
					y_pos = [127];
					spd = 2;
					spr_list = [Strojandeer_roll_d];	
				}
			}
		},
		function(){
			if (instance_exists(Omulti_goto) && Otrojandeer.y = 127){ instance_destroy(Omulti_goto); }
			if (!instance_exists(Ofade) && !instance_exists(Omulti_goto))
			{
				with (instance_create_depth(0, 0, -999, Ofade))
				{
					trans_type = "iris";
					newRoom = Routchophouse;
					newX = 56;
					newY = 93;
				}
				
				add_move_order();
			}
		},

		
		//DEMO ENDING
		//function(){
		//	if (!instance_exists(Ofade))
		//	{
		//		set_song_ingame(noone, 3 * FRAME_RATE, 0, 0, false);
				
		//		with (instance_create_depth(0, 0, -999, Ofade))
		//		{
		//			trans_type = "iris fade";
		//			newRoom = Rdemo_credits;
		//			fadeColor = white_col;
		//			fadeSpd = 0.015;
		//			start_iris_timer = 90;
		//		}
				
		//		add_move_order();
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