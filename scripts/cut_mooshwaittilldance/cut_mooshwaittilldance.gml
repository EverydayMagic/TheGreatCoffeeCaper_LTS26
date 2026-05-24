function cut_mooshwaittilldance(){
	get_scene_cast(STORY_PACE.MOOSH_WAIT_TILL_DANCE);
	var moosh = Omooshmushroom;
	
	global.moveOrder = [
		[ costume_change, [moosh, moosh.idle_spawn_spr, "noloop"] ],
		[ create_textbox, ["moosh_waittilldance", moosh, true] ],
		[ costume_change, [moosh, Smoosh_spawn_reverse, "noloop"] ],
		[ costume_change, [moosh, moosh.idle_spawn_spr, 0] ],
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
			
			global.saveslot_story[global.saveslot][STORY_PACE.MOOSH_WAIT_TILL_DANCE] = 1;
			
			if (instance_exists(Ocharliemouse_cutscene))
			{
				instance_destroy(Ocmouse_openupbb_cutcheck);
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