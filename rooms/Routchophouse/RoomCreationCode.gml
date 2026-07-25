if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0) //if Invest CupOJoe not done yet
{
	with (instance_create_layer(57, 86, "Instances", Oclawdine))
	{
		sprite_index = Sclawdine_slash;
	}
	
	instance_create_depth(56, 90, Oclawdine.depth + 1, Olog_scratch);
	
	with (instance_create_layer(46, 80, "Instances", Omeetclawdinebeforeinvest_tripwire))
	{
		image_xscale = 0.3125;
		image_yscale = 0.14062;
	}
	
	with (instance_create_layer(46, 80, "Col", Ocol))
	{
		image_xscale = 2.5;
		image_yscale = 1.625;
	}
}

if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 1) //done with tutorial havent met Bean Bandits
{
	if (global.saveslot_story[global.saveslot][STORY_PACE.OPEN_UP_BANDITS] = 0)
	{
		//create log to block the way
		instance_create_layer(56, 80, "Instances", Olog_scratch);
		
		//collision for log
		with (instance_create_layer(47, 80, "Col", Ocol))
		{
			image_xscale = 2.25;
			image_yscale = 0.625;
		}
	}
	
	//if (global.saveslot_story[global.saveslot][15][1] = 1 && global.saveslot_story[global.saveslot][16][1] = 0)
	//{
	//	with (instance_create_depth(32, 32, 0, Owheregoing2_tripwire))
	//	{
	//		cutscene = "Where Going?2";
	//		x = 32;
	//		y = 32;
	//		image_xscale = 1.25;
	//		image_yscale = 0.1838685;
	//	}
	//}
}

if (global.saveslot_story[global.saveslot][STORY_PACE.CONFRONT_IN_SNIFF_HOUSE] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.CLAWDINE_UPGRADE_QUEST] = 0)
{
	//sleeping clawdine
	with (instance_create_layer(81, 28, "Instances", Oclawdine))
	{
		sprite_index = Sclawdine_sleep;
		image_speed = 1;
		depth_manual = true;
		depth = -room_height;
	}
	
	//collision for before push
	with (instance_create_layer(52, 32, "Col", Ocol))
	{
		image_xscale = 1.5;
		image_yscale = 2;
	}
	
	//charlie invis text
	with (instance_create_depth(52, 32, 0, Oinvissign))
	{
		text_id = "charlie_clawdinequestbeforepush";
		dir_needed = 2;
	}
	
	//destroy certain collision
	//with (Ocol)
	//{
	//	if (x = 96 && y = 32 && image_yscale = 2){ instance_destroy(); }	
	//}
}