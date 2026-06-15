function end_scene(_reset_points = true){
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
	
	
		if (_reset_points){ Opartypoint_manager.reset_points(); }
	
	}
}