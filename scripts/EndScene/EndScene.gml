function end_scene(_reset_points = true, _cutsceneActive = false, _cmouse_create = false){
	//erase the array for the next cutscene 
	//and tell the game we finished with this one
	if (!instance_exists(Otextbox))
	{
		array_delete(global.moveOrder, 0, global.moveOrder_beat - 1);
		global.moveOrder_beat = 0;
		global.cutsceneActive = _cutsceneActive;
			
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
		
		if (_cmouse_create && instance_exists(Ocharliemouse_cutscene))
		{
			Ocharliemouse_cutscene.alarm[0] = 1;
		}
	}
}