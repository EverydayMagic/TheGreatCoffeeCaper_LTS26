function cut_charliedashahead(){
	global.story_beat = STORY_PACE.CHARLIE_DASH_AHEAD;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	
	global.moveOrder = [
		function(){
			//starting values
			Ocharliemouse_cutscene.x = 120;
			Ocharliemouse_cutscene.y = 89;
			Ocharliemouse_cutscene.sprite_index = Ocharliemouse_cutscene.idle_spr;
			Ocharliemouse_cutscene.image_index = 0;
			Ocharliemouse_cutscene.image_speed = 0;
			
			Ohoots_cutscene.sprite_index = Ohoots_cutscene.idle_cap_spr;
			Ohoots_cutscene.image_index = 3;
			Ohoots_cutscene.x = 88;
			Ohoots_cutscene.y = 67;
			if (!instance_exists(Ofade))
				add_move_order();
		},
		
		[ costume_change, [hoots, hoots.walk_d_cap_spr] ],
		[ goTo, [hoots, 88, 67, 88, 89, 1] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 0] ],
		[ hold, [hoots, 10, "frm"] ],
		[ create_textbox, ["mustyoudashahead", hoots, false] ],
		[ costume_change, [charlie, charlie.idle_spr, 2] ],
		[ hold, [charlie, 3, "frm"] ],
		[ create_textbox, ["sorryjustexcited", charlie, false] ],
		[ costume_change, [charlie, charlie.idle_spr, 0] ],
		[ hold, [charlie, 6, "frm"] ],
		[ create_textbox, ["but...", charlie, false] ],
		[ hold, [charlie, 3, "frm"] ],
		[ costume_change, [charlie, charlie.idle_spr, 2] ],
		[ create_textbox, ["ifitmakes", charlie, false] ],
		[ costume_change, [charlie, charlie.walk_l_spr] ],
		[ goTo, [charlie, 120, 89, 104, 89, 1] ],
		[ costume_change, [hoots, hoots.walk_r_cap_spr] ],
		function(){
			var _goto_track = 0;
			Ohoots_cutscene.begin_record = true;
			if (goTo(Ohoots_cutscene, 88, 89, 107, 89, 1, false) = true){ _goto_track++; }
			if (goTo(Ocharliemouse_cutscene, 104, 89, 88, 89, 1, false) = true){ _goto_track++; }
			if (_goto_track = 2){ add_move_order(); }
		},
		[ costume_change, [charlie, charlie.idle_spr, 0] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 2] ],
		function(){ Ohoots_cutscene.begin_record = false; add_move_order(); },
		[ create_textbox, ["stickrightbehind", charlie, false] ],
		[ costume_change, [hoots, hoots.idle_cap_spr, 0] ],
	
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
				
			//replace charlie cutscene with real charlie
			if (instance_exists(Ocharliemouse_cutscene))
			{
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
		}
			
	}
		
	//show_debug_message("array_length: " + string(array_length(global.moveOrder)));	
	//show_debug_message("move beat: " + string(global.moveOrder_beat));
}