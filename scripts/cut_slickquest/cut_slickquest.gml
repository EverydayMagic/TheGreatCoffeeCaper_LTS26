function cut_slickquest(){
	global.story_beat = STORY_PACE.SLICK_QUEST;
	get_scene_cast(global.story_beat);
	
	var hoots = Ohoots_cutscene;
	
	global.moveOrder = [
		function(){
			if (instance_exists(Obubble)){ instance_destroy(Obubble); play_sfx(snd_select); }
			//get to points
			if (!instance_exists(Omulti_goto))
			{
				var _x = Ohoots_cutscene.x;
				var _y = Ohoots_cutscene.y;
				multigoTo(Ohoots_cutscene, _x, _y, [72], [104], 1, [Splayer_capwalk_l], Splayer_capidle, 1, 0);
				
				var _x = Ocharliemouse_cutscene.x;
				var _y = Ocharliemouse_cutscene.y;
				multigoTo(Ocharliemouse_cutscene, _x, _y, [88], [104], 1, [Scmouse_walkl], Scmouse_idle, 1, 0);
			} else if (Ohoots_cutscene.x = 72 && Ohoots_cutscene.y = 104 && Ocharliemouse_cutscene.x = 88 && Ocharliemouse_cutscene.y = 104) {
				while(instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				costume_change(Ohoots_cutscene, Splayer_capidle, 1, "nomove");
				costume_change(Ocharliemouse_cutscene, Scmouse_idle, 1, "nomove");
				add_move_order();
			}
		},
		[ hold, [hoots, 10, "frm"] ],
		[ create_textbox, ["salutationsfox", hoots, false] ],
		//have slick look around sprite
		[ hold, [hoots, 30, "frm"] ],
		[ create_textbox, ["maybeididnt", hoots, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				costume_change(Ohoots_cutscene, Splayer_diag_shock, 0, "flip", "nomove");
				costume_change(Ocharliemouse_cutscene, Scmouse_diag_shock, 0, "flip", "nomove");
			
				//shake the bakery till da boyz drop (dey shake)
				with (Ocharshake)
				{
					shake = true;	
					char = [Ohoots_cutscene, Ocharliemouse_cutscene];
					cut_dontadd = true;
					shake_time = 3;
					shake_magnitude = 1;
					shake_fade = 0.25;
					dir = "horz";
				}
			
				add_move_order();
			}
		},
		[ create_textbox, ["moolahbirdy", hoots, false] ],
		[ hold, [hoots, 15, "frm"] ],
		[ create_textbox, ["tellyawhatdeal", hoots, false] ],
		[ costume_change, [Ohoots_cutscene, Splayer_caphoist, "noloop"] ],
		//make mglass hoist
		[ create_textbox, ["greathootsoncase", hoots, false] ],
		[ hold, [hoots, 10, "frm"] ],
		[ create_textbox, ["aintgonnafind", hoots, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{	
				costume_change(Ohoots_cutscene, Splayer_capidle, 1);
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
		
		Ofox.slickquest = false;
		
		end_scene(true, false, true);	
	}
}