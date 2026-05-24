function cut_cluesincloset(){
	global.story_beat = STORY_PACE.CLUES_IN_CLOSET;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	
	global.moveOrder = [
		function(){
			Ocharliemouse_cutscene.x = 128;
			Ocharliemouse_cutscene.y = 130;
			Ocharliemouse_cutscene.sprite_index = Scmouse_walkb;
			Ocharliemouse_cutscene.depth = 90;
			add_move_order();	
		},
		
		[ create_textbox, ["surelythereareclues", charlie, false] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				with (instance_create_layer(120, 112, "Col", Ocol))
				{ 
					image_xscale = 2; 
					image_yscale = 2; 
					special = true;
					
					if (instance_exists(Ospecialcol_manager))
					{
						array_push(Ospecialcol_manager.special_col, self.id);		
					}
				}
				with (instance_create_layer(120, 112, "Instances", Oinvissign)){ text_id = "surelythereareclues"; }
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
			
			
		//erase the array for the next cutscene 
		//and tell the game we finished with this one
		if (!instance_exists(Otextbox))
		{
			array_delete(global.moveOrder, 0, global.moveOrder_beat - 1);
			global.moveOrder_beat = 0;
			global.cutsceneActive = false;
						
			global.saveslot_story[global.saveslot][global.story_beat] = 1;
			
			//door collision
			with (instance_create_layer(118, 128, "Col", Ocol)){ image_xscale = 2.5; image_yscale = 0.75; temp = true; }
			
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