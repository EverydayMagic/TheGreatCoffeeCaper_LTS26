//cycle through rooms
	//housing
	for (var i = 0; i < array_length(global.house_rooms); i++)
	{
		if (room = global.house_rooms[i])
		{
			var l = false;
			if (songAssetString = working_directory + "/Music/Overworld Theme.ogg"){ l = true; }
			set_song_ingame("Indoor Theme.ogg", 0, 0, 0, true, noone, false, l);	
		}
	}
	
	//outside
	for (var q = 0; q < array_length(global.outside_rooms); q++)
	{
		if (room = global.outside_rooms[q])
		{
			var l = false;
			if (songAssetString = working_directory + "/Music/Indoor Theme.ogg"){ l = true; }
			set_song_ingame("Overworld Theme.ogg", 0, 0, 0, true, noone, false, l);
		}
	}
	
	//other
	for (var b = 0; b < array_length(global.other_rooms); b++)
	{
		if (room = global.other_rooms[b])
		{
			switch (room)
			{
				case Rtitle:
					if (instance_exists(Otitle_menu))
					{
						if (Otitle_menu.beat > 1)
						{
							if (songAssetString != (working_directory + "/Music/" + "Title Theme START LOOP.ogg"))
								set_song_ingame("Title Theme CONTINUED LOOP.ogg");
						} else {
							set_song_ingame("Title Theme START LOOP.ogg", 0, 0, 0, false, "Title Theme CONTINUED LOOP.ogg");
						}
					} else {
						set_song_ingame("Title Theme START LOOP.ogg", 0, 0, 0, false, "Title Theme CONTINUED LOOP.ogg");
					}
				break;
			}
		}
	}
	
	//special house rooms
	for (var r = 0; r < array_length(global.special_house_rooms); r++)
	{
		if (room = global.special_house_rooms[r])
		{
			switch (room)
			{
				case Rcoffeecloset:
					set_song_ingame("Cup O' Joe.ogg");
				break;
				
				case Rcoffeeshop:
					if (global.saveslot_story[global.saveslot][STORY_PACE.OPENING_CUTSCENE] = 1)
						set_song_ingame("Cup O' Joe.ogg");
				break;
				
				case Rwoodshop:
					set_song_ingame("Clawdine's Theme.ogg");
				break;
			}
		}
	}
















