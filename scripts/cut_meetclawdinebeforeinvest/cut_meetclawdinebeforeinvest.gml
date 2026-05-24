function cut_meetclawdinebeforeinvest(){
	global.story_beat = STORY_PACE.MEET_CLAWDINE_BEFORE_INVEST;
	get_scene_cast(global.story_beat);
	var clawdine = Oclawdine;
	
	global.moveOrder = [
		[ create_textbox, ["pluckmywhiskers", clawdine, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				Oclawdine.sprite_index = Sclawdine_slash;
				Oclawdine.image_index = 0;
				Oclawdine.image_speed = 1;
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

	}else {
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
			
			if (instance_exists(Omeetclawdinebeforeinvest_tripwire))
			{
				instance_destroy(Omeetclawdinebeforeinvest_tripwire);	
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