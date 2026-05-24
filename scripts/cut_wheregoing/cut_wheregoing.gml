function cut_wheregoing(){
	global.story_beat = STORY_PACE.WHERE_GOING;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	
	global.moveOrder = [
		function(){
			Ocharliemouse_cutscene.sprite_index = Scmouse_idle;
			Ocharliemouse_cutscene.image_index = 0;
			Ohoots_cutscene.sprite_index = Splayer_capidle;
			Ohoots_cutscene.image_index = 0;
			add_move_order();
		},
		[ create_textbox, ["doyouknowwheregoing", charlie, false] ],
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