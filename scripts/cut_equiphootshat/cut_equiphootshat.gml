
function cut_equiphootshat(){
	global.story_beat = STORY_PACE.EQUIP_HOOTSHAT;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	
	global.moveOrder = [
		//[ costume_change, [hoots, Splayer_idle, 0] ],
		[ costume_change, [hoots, Splayer_nocapspin_flipped, "noloop"] ],
		[ costume_change, [hoots, Splayer_capidle, 3] ],
		[ create_textbox, ["hootshousehootshat", hoots, true] ],
		function(){
			for (var i = 0; i < array_length(global.battleTutorial); i++)
			{
				global.battleTutorial[i] = false;	
			}	
			add_move_order();
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
			
			
		//erase the array for the next cutscene 
		//and tell the game we finished with this one
		if (!instance_exists(Otextbox))
		{
			array_delete(global.moveOrder, 0, global.moveOrder_beat - 1);
			global.moveOrder_beat = 0;
			global.cutsceneActive = false;
			
			global.saveslot_story[global.saveslot][global.story_beat] = 1;
			
			global.playerIdle = Splayer_capidle;
			global.playerWalk = Splayer_capwalk;
						
				
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