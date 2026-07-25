function cut_clawdineupgradequest_beforepush(){
	global.story_beat = STORY_PACE.CLAWDINE_UPGRADE_QUEST_BEFOREPUSH;
	get_scene_cast(global.story_beat);
	
	var hoots = Ohoots_cutscene;
	
	global.moveOrder = [
		function(){
			Ohoots_cutscene.visible = false;
			Ocharliemouse_cutscene.visible = false;
			//set_pos(Ohoots_cutscene, 70, 39);
			set_pos(Ohoots_cutscene, 57, 39);
			costume_change(Ohoots_cutscene, Splayer_capidle, 0, "nomove");
			set_pos(Ocharliemouse_cutscene, 57, 39);
			costume_change(Ocharliemouse_cutscene, Scmouse_idle, 0, "nomove");
			if (!instance_exists(Ofade))
			{
				add_move_order();
			}
			Oclawdine.depth_manual = true;
			Oclawdine.depth = Ohoots_cutscene.depth + 5;
		},
		[ hold, [hoots, 10, "frm"] ],
		function(){
			Ohoots_cutscene.visible = true;
			if (!instance_exists(Omulti_goto))
			{
				multigoTo(Ohoots_cutscene, 61, 39, [70], [39], 1, [Splayer_capwalk_r]);	
			} else if (Ohoots_cutscene.x = 70) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				costume_change(Ohoots_cutscene, Splayer_capidle, 0, "nomove");
				add_move_order();
			}
		},
		[ hold, [hoots, 10, "frm"] ],
		function(){
			Ocharliemouse_cutscene.visible = true;
			if (!instance_exists(Omulti_goto))
			{
				multigoTo(Ocharliemouse_cutscene, 57, 39, [61], [39], 1, [Scmouse_walkr]);	
			} else if (Ocharliemouse_cutscene.x = 61) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				costume_change(Ocharliemouse_cutscene, Scmouse_idle, 0, "nomove");
				add_move_order();
			}
		},
		[ hold, [hoots, 15, "frm"] ],
		[ create_textbox, ["clawdineclawdine", hoots, true] ],
		[ hold, [hoots, 15, "frm"] ],
		function(){
			//hey bub what do you bub here?!
			if (!instance_exists(Obubble))
			{
				set_song_ingame(noone, 30, 0);
				
				with (instance_create_depth(0, 0, 0, Obubble))
				{
					char_track = Ohoots_cutscene;
					bubble_type = 4;
					kill_time = 30;
					bounce = true;
					cut_add = true;
					h_mod = 1;
				}
			}
		},
		function(){
			if (!instance_exists(Omulti_goto))
			{
				multigoTo(Ohoots_cutscene, 70, 39, [73], [39], 1, [Splayer_capwalk_r], Splayer_capidle, 0, 0);	
			} else if (Ohoots_cutscene.x = 73) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				costume_change(Ohoots_cutscene, Splayer_capidle, 0, "nomove");
				add_move_order();
			}
		},
		[ hold, [hoots, 10, "frm"] ],
		[ create_textbox, ["clawdineclawdine2", hoots, true] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				if (!instance_exists(Obubble))
				{
					//bub for da lady in red
					with (instance_create_depth(0, 0, 0, Obubble))
					{
						char_track = Oclawdine;
						bubble_type = 11;
						kill_time = 132;
						bounce = true;
						x_mod = 8;
						y_mod = 16;
						cut_add = true;
					}
					play_sfx(snd_snore, 1, 2);
				}
			}
		},
		[ create_textbox, ["howwakeup", hoots, true] ],
		[ costume_change, [Ohoots_cutscene, Splayer_capidle, 3] ],
		
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
		
		with (instance_create_depth(Oclawdine.x, Oclawdine.y, Oclawdine.depth, Opushblock))
		{
			sprite_index = Sclawdine_sleep;		
			col_ignore = true;
		}
		if (instance_exists(Oclawdine)){ instance_destroy(Oclawdine); }
		//clawdine upgrade quest cutscene manager
		instance_create_depth(0, 0, 0, Oclawdineupgradequest_checkpush);
		
		end_scene(true, false, false);
	}
}