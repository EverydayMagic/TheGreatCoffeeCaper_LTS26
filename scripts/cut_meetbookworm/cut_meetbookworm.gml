function cut_meetbookworm(){
	global.story_beat = STORY_PACE.MEET_BOOKWORM;
	get_scene_cast(global.story_beat);
	var bworm = Obookworm;
	
			//READING STORY BOOK
		global.moveOrder = [
			function(){
				var _dir = round(Ohoots_cutscene.direction/4);
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				if (_dir = 3)
				{
					Ohoots_cutscene.image_index = 3;
				}
				if (_dir = 1)
				{
					Ohoots_cutscene.image_index = 1;
				}
				Ohoots_cutscene.image_speed = 0;
				add_move_order();	
			},
			[ create_textbox, ["clumsyspelling", bworm, false] ],
			[ costume_change, [bworm, idle_spr] ],
			function(){
				//set song back to normal
				set_song_ingame("Overworld Theme.ogg", 0, 30, 0, true, noone, false, false, false, true);
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