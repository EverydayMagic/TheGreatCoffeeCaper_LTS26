if (global.saveslot_story[global.saveslot][STORY_PACE.FOUND_ALL_MAIN_CLUES] = 1)
{
	with (instance_create_depth(70, 128, -bbox_bottom, Owarp_block))
	{
		target_x = 88;
		target_y = 67;
		dest = Routcoffeehouse;
		inout = true;
		trans_type = "iris";
		party_dir = 1;
		image_xscale = 2.5;
	}
	
	instance_destroy();
} else {
	if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 1  && global.saveslot_story[global.saveslot][STORY_PACE.FOUND_ALL_MAIN_CLUES] = 0)
	{
		if (!instance_exists(Ocharliemouse) && !instance_exists(Ocharliemouse_cutscene))
		{
			//create temporary collision
			with (instance_create_layer(70, 128, "Col_Broken", Ocol)){ image_xscale = 2.5; image_yscale = 1; temp = true; }
		}
	
		if (place_meeting(x, y, Oplayer) && !instance_exists(Otextbox) && !global.gamePaused)
		{
			if (!instance_exists(Otextbox))
				Oplayer.y -= 1;
			if (instance_exists(Ocharliemouse) || instance_exists(Ocharliemouse_cutscene))
				create_textbox("cupojoedontleave");
		}
	
	}
}
















