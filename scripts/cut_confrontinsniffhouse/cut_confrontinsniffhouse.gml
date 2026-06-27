function cut_confrontinsniffhouse(){
	global.story_beat = STORY_PACE.CONFRONT_IN_SNIFF_HOUSE;
	get_scene_cast(global.story_beat);
	
	var hoots = Ohoots_cutscene;
	
	global.moveOrder = [
		function(){
			set_song_ingame(noone);
			
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
					spr_list = [Spuffy_idle_l_nosmi, Spuffy_idle_b, Spuffy_idle_f_nosmi, Spuffy_idle_l_nosmi];
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
			show_debug_message("Ocmouse pos: " + string(Ocharliemouse_cutscene.x) + ", " + string(Ocharliemouse_cutscene.y));
			if (!instance_exists(Omulti_goto))
			{
				var _x = Ocharliemouse_cutscene.x;
				var _y = Ocharliemouse_cutscene.y;
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ocharliemouse_cutscene;
					origin_x = _x;
					origin_y = _y;
					x_pos = [80];
					y_pos = [108];
					spd = 2;
					spr_list = [Scmouse_walkl];	
					spr_done = Scmouse_interrogate;
					uphill_move = true;
				}
			} else if (Ocharliemouse_cutscene.x = 80 && Ocharliemouse_cutscene.y = 108) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				Ocharliemouse_cutscene.sprite_index = Scmouse_interrogate;
				add_move_order();
			}
		},
		[ hold, [hoots, 5, "frm"] ],
		[ create_textbox, ["stoprightthere", hoots, true] ],
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
			
		//end_scene();	
	}
}