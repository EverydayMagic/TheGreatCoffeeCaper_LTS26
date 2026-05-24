if (global.saveslot_story[global.saveslot][STORY_PACE.CLOUDPUFF_FOUND] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.FOUND_ALL_MAIN_CLUES] = 0)
{
	//create collision where charlie will be for finding 3 clues
	with (instance_create_layer(129, 118, "Col", Ocol)){ image_xscale = 1.875; image_yscale = 0.625; special = true;}	
	
	//create charlie
	with (instance_create_depth(136, 122, 90, Ocharliemouse_cutscene))
	{
		sprite_index = idle_spr;
		image_index = 2;
		image_speed = 0;
	}
	
	//create tripwire if needed
	if (global.saveslot_story[global.saveslot][STORY_PACE.MUSICSHEET_FOUND] = 1)
	{
		with (instance_create_layer(96, 112, "Instances", Oclueincloset_tripwire))
		{
			cutscene = "Found All Clues";
			image_xscale = 0.03125;
			image_yscale = 0.25;
		}	
	}
	
	
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
	
	set_song_ingame("Cup O' Joe.ogg");
	
}

if (Oitem_manager.inv[5].display_name != "Music Sheet")
{
	
	#region barrel placement
			
			if (Oitem_manager.inv[3].display_name != "Cloud Puff")
			{
				
				#region for cloud puff
			
					with (instance_create_layer(80, 80, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					with (instance_create_layer(80, 48, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					with (instance_create_layer(64, 48, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					with (instance_create_layer(32, 80, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					
					//goal
					instance_create_layer(80, 64, "Instances", Opushblock_goal);
				
				#endregion
				
			} else if (Oitem_manager.inv[4].display_name != "Blue Hat") {
				
				#region for top hat
					
					with (instance_create_layer(80, 64, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					with (instance_create_layer(80, 48, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					with (instance_create_layer(64, 48, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					with (instance_create_layer(32, 80, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					
					//goal
					with (instance_create_layer(64, 32, "Instances", Opushblock_goal))
					{
						effect = function() {
							with (Opushblock_goal)
							{
								instance_destroy();	
							}
						}
					}
					with (instance_create_layer(48, 48, "Instances", Opushblock_goal))
					{
						effect = function() {
							with (Opushblock_goal)
							{
								instance_destroy();	
							}
						}	
					}
					
				#endregion
				
			} else if (Oitem_manager.inv[5].display_name != "Music Sheet") {
				
				#region for music sheet
					
					with (instance_create_layer(80, 32, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					with (instance_create_layer(48, 48, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					with (instance_create_layer(64, 64, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					with (instance_create_layer(32, 80, "Instances", Opushblock))
					{
						sprite_index = Scoffee_barrel;	
					}
					
					//goal
					instance_create_layer(16, 80, "Instances", Opushblock_goal);
					
				#endregion
				
			}
		
	#endregion	
	
} else {
	
	#region barrel placement
	
		with (instance_create_layer(80, 32, "Instances", Opushblock))
		{
			sprite_index = Scoffee_barrel;	
		}
		with (instance_create_layer(48, 48, "Instances", Opushblock))
		{
			sprite_index = Scoffee_barrel;	
		}
		with (instance_create_layer(64, 64, "Instances", Opushblock))
		{
			sprite_index = Scoffee_barrel;	
		}
		with (instance_create_layer(16, 80, "Instances", Opushblock))
		{
			sprite_index = Scoffee_barrel;	
		}
	
	#endregion

}