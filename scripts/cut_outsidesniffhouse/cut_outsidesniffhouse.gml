function cut_outsidesniffhouse(){
	get_scene_cast(STORY_PACE.OUTSIDE_SNIFF_HOUSE);
	var hoots = Ohoots_cutscene;
	
	global.moveOrder = [
		[ hold, [hoots, 15, "frm"] ],
		function(){
			set_song_ingame(noone);
			add_move_order();
		},
		function(){
			set_pos(Ohoots_cutscene, 24, 54);
			costume_change(Ohoots_cutscene, Splayer_capwalk_d, "nomove");
			Ocharliemouse_cutscene.visible = false;
			add_move_order();
		},
		function(){
			if (!instance_exists(Omulti_goto))
			{
				multigoTo(Ohoots_cutscene, 24, 54, [24, 40], [73, 73], 1, [Splayer_capwalk_d, Splayer_capwalk_r], Splayer_capidle, 0, 0);
			} else if (Ohoots_cutscene.x = 40) {
				instance_destroy(Omulti_goto);
				add_move_order();
			}
		},
		[ hold, [hoots, 15, "frm"] ],
		function(){
			if (!instance_exists(Omulti_goto))
			{
				Ocharliemouse_cutscene.visible = true;
				set_pos(Ocharliemouse_cutscene, 24, 54);
				multigoTo(Ocharliemouse_cutscene, 24, 54, [24], [73], 1, [Scmouse_walkf], Scmouse_idle, 3, 0);
				
			} else if (Ocharliemouse_cutscene.y = 73) {
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
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
			
		end_scene();	
	}
}