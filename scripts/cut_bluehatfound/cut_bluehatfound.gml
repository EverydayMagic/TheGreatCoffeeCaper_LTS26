function cut_bluehatfound(){
	global.story_beat = STORY_PACE.BLUEHAT_FOUND;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	
	global.moveOrder = [
		function(){
			with (Ocluesteps_manager)
			{
				scripted_footssplaced = false;
				all_empty = true;
				diced_it = false;
				spark_placed = false;
				global.scripted_print_data = [];
			}
			with (Ocluesteps)
			{
				for (var i = 0; i < array_length(Ocluesteps_manager.footprint_id); i++)
				{
					if (Ocluesteps_manager.footprint_id[i] = self.id)
					{
						array_delete(Ocluesteps_manager.footprint_id, i, 1);
						break;
					}
				}
				if (array_length(Ocluesteps_manager.footprint_id) <= 0)
					Ocluesteps_manager.footprint_id[0] = -1;

				instance_destroy();	
			}
			set_song_ingame("Cup O' Joe.ogg");
			add_move_order();	
		},
		
		[ costume_change, [hoots, hoots.idle_cap_spr, 3] ],
		[ costume_change, [charlie, charlie.idle_spr, 2] ],
		[ create_textbox, ["dappercap", hoots, false] ],
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
		}
			
	}
		
	//show_debug_message("array_length: " + string(array_length(global.moveOrder)));	
	//show_debug_message("move beat: " + string(global.moveOrder_beat));
}