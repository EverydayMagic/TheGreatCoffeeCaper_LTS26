
if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_BEAN_BANDITS] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.OPEN_UP_BANDITS] = 0)
{
	//Sniffles
	with(instance_create_depth(56, 87, 100, Osniffles))
	{
		sprite_index = Ssniffles_stroller;
		image_index = 1;
		image_speed = 0;
		depth = Oplayer.depth + 10;
		
		if (global.saveslot_story[global.saveslot][STORY_PACE.SNIFFLES_STROLLER_OUTSTAGE_3] = 1)
		{
			sprite_index = Ssniffles_stroller_shock;	
		}
	}
	
	//Stroller
	with(instance_create_depth(39, 87, 100, Oegg_stroller))
	{
		sprite_index = Sstroller;
		image_index = 1;
		image_speed = 0;
		depth = Oplayer.depth + 10;
	}
	
	//Collisions for them
	with (instance_create_layer(30, 80, "Col", Ocol))
	{
		image_xscale = 4.25;
		image_yscale = 1;
	}
}


