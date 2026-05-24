
function cut_bookworm_again(){
	global.story_beat = STORY_PACE.BOOKWORM_AGAIN;
	get_scene_cast(global.story_beat);
	var bworm = Obookworm;

	//READING STORY BOOK
	global.moveOrder = [
		
		[ create_textbox, ["tsktsk", bworm, false] ],
		[ costume_change, [bworm, idle_spr] ],
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
			
			Obookworm.alarm[0] = 1;
			
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