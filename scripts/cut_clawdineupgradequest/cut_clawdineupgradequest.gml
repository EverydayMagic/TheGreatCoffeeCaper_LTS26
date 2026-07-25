function cut_clawdineupgradequest(){
	global.story_beat = STORY_PACE.CLAWDINE_UPGRADE_QUEST;
	get_scene_cast(global.story_beat);
	
	var hoots = Ohoots_cutscene;
	
	global.moveOrder = [
		function(){
			set_pos(Ocharliemouse_cutscene, 61, 39);
			costume_change(Ocharliemouse_cutscene, Scmouse_diag_shock, "nomove");
			costume_change(Ohoots_cutscene, Splayer_capidle, 0, "nomove");
			if (!instance_exists(Omulti_goto))
			{
				if (instance_exists(Opushblock))
				{
					costume_change(Oclawdine, Sclawdine_sleep, "nomove");
					set_pos(Oclawdine, Opushblock.x, Opushblock.y);
					instance_destroy(Opushblock);
				}
				
				//bub for bubgirl
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Oclawdine;
					bubble_type = 5;
					up_fade = true;
				}
				//bub for bubboy (mousey)
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Ocharliemouse_cutscene;
					bubble_type = 5;
					kill_time = 10;
				}
				play_sfx(snd_exclamationpoint);
				
				var _x = Oclawdine.x;
				var _y = Oclawdine.y;
				
				//clawdine fall
				multigoTo(Oclawdine, _x, _y, [_x], [49], 2, [Sclawdine_sleep], -1, -1, -1, -1);
				
			} else if (Oclawdine.y = 49) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				add_move_order();
			}
		},
		function(){
			//arc move for clawdine
			if (!instance_exists(Opath_arc))
			{
				costume_change(Oclawdine, Sclawdine_roll, "nomove");
				set_pos(Oclawdine, 106, 64);
				
				play_sfx(snd_jumping_highpitch);
				
				var _x = Oclawdine.x;
				var _y = Oclawdine.y;	
				
				with (instance_create_depth(0, 0, 0, Opath_arc))
				{
					curving = true;
					obj = Oclawdine;
					x1 = _x;
					y1 = _y;
					x2 = 120;
					y2 = 86;
					max_points_per_side = 8;
					curve_height = 32;
					spd = 4;
				}
			}
		},
		function(){
			//jumping jackrabbits it's clawdine
			if (!instance_exists(Ochar_jump))
			{
				costume_change(Oclawdine, Sclawdine_idle, 0, "nomove");	
				
				play_sfx(snd_exclamationpoint);
				
				with (instance_create_depth(0, 0, 0, Ochar_jump))
				{
					char = [Oclawdine];
					time = 5;
					endy = [(Oclawdine.y - 4)];
					infin = true;
					wait_time = 5;
					cut_dontadd = true;
					char_spr_swap = [[Sclawdine_idle, Sclawdine_idle]];
					char_img_swap = [[2, 0]];
					fade_bubble = true;
				}
			}
			add_move_order();
		},
		[ hold, [hoots, 45, "frm"] ],
		[ create_textbox, ["illriptoshreds", hoots, false] ],
		[ hold, [hoots, 10, "frm"] ], //maybe have an animation of hoots pull/pushing charlie to the front???
		[ create_textbox, ["goodchapcheck", hoots, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				if (instance_exists(Ochar_jump))
				{
					if (Oclawdine.y = 86)
					{
						instance_destroy(Ochar_jump);
						if (instance_exists(Obubble)){ instance_destroy(Obubble); }
						Oclawdine.y = 86;
						
						add_move_order();
					}
				}
			}
		},
		[ create_textbox, ["ahabehindthis", hoots, false] ],
		[ create_textbox, ["behindohdear", hoots, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				if (!instance_exists(Osimple_iris))
				{
					with (instance_create_depth(0, 0, 0, Osimple_iris))
					{
						delay = 15;	
					}
					
				} else if (Osimple_iris.flip) {
				
					//set characters
					set_pos(Ohoots_cutscene, 94, 107);
					set_pos(Ocharliemouse_cutscene, 112, 108);
					set_pos(Oclawdine, 103, 86);
					
					costume_change(Ohoots_cutscene, Splayer_capidle, 1, "nomove");
					costume_change(Ocharliemouse_cutscene, Scmouse_idle, 1, "nomove");
					costume_change(Oclawdine, Sclawdine_hips_eyebrow, 0, "nomove");
				
					add_move_order();
				}
			}
		},
		function(){
			if (!instance_exists(Osimple_iris))
			{
				add_move_order();			
			}
		},
		[ hold, [hoots, 15, "frm"] ],
		[ create_textbox, ["whyincident", hoots, false] ],
		[ costume_change, [Oclawdine, Sclawdine_idle, 3] ],
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
		
		end_scene(true, false, true);
	}
}