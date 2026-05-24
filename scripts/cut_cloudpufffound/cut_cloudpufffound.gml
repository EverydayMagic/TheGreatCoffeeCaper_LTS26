function cut_cloudpufffound(){
	global.story_beat = STORY_PACE.CLOUDPUFF_FOUND;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	
	global.moveOrder = [
		function(){
			//charlie position
			Ocharliemouse_cutscene.x = 128;
			Ocharliemouse_cutscene.y = 130;
			Ocharliemouse_cutscene.sprite_index = Scmouse_walkb;
			Ocharliemouse_cutscene.image_index = 1;
			Ocharliemouse_cutscene.image_speed = 1;
			Ocharliemouse_cutscene.depth = 90;
			
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
		[ goTo, [charlie, 128, 130, 128, 122, 1] ],
		[ costume_change, [charlie, charlie.walk_r_spr] ],
		[ goTo, [charlie, 128, 122, 136, 122, 1] ],
		[ costume_change, [charlie, charlie.idle_spr, 1] ],
		[ hold, [charlie, 10, "frm"] ], 
		[ costume_change, [hoots, hoots.idle_cap_spr, 3] ],
		[ create_textbox, ["whatfluffything", hoots, false] ],
		[ costume_change, [charlie, charlie.idle_spr, 2] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				//charlie collision
				with (instance_create_layer(129, 118, "Col", Ocol))
				{ 
					image_xscale = 1.875; 
					image_yscale = 0.625; 
					special = true;
					
					if (instance_exists(Ospecialcol_manager))
					{
						array_push(Ospecialcol_manager.special_col, self.id);		
					}
				}
				
				//charlie textbox
				with(instance_create_layer(129, 118, "Instances", Oinvissign))
				{
					image_xscale = 0.9375;
					image_yscale = 0.3125;
		
					dir_needed = [0, 1, 3];
		
					if (Oitem_manager.inv[3] != global.item_list.cloud_puff)
						text_id = "surelythereareclues";
					else if (Oitem_manager.inv[4] != global.item_list.blue_hat)
						text_id = "sparkbybarrel";
					else if (Oitem_manager.inv[5] != global.item_list.music_sheet)
						text_id = "oneclueleft";
					else
						instance_destroy();
				}
				
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