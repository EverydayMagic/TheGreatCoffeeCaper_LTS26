if (instance_exists(Ointeractbox) || global.cutsceneActive)
{
	if (place_meeting(x, y, Ointeractbox) || global.cutsceneActive)
	{
		if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_MOOSH] = 1)
		{
			if (global.saveslot_story[global.saveslot][STORY_PACE.OPEN_UP_BANDITS] = 1)
			{
				ex_cutscene("Moosh Again");
			} else {
				ex_cutscene("Moosh Wait Till Dance");
			}
		}
	}
}

//"start act" will only be used if it's your first time discovering the bug
if (start_act)
{
	if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_MOOSH] = 0)
	{
		ex_cutscene("Meet Moosh");
	}
}


depth = -(y - 2);



if (sprite_index = Smoosh_spawn && image_index = 3 && image_speed = 0)
{
	if (!instance_exists(col))
	{
		col = instance_create_layer(113, 73, "Col", Ocol);
		with (col)
		{
			image_xscale = 1.75;
			image_yscale = 1;
		}
	}
} else {
	if (instance_exists(col))
	{
		instance_destroy(col);	
	}
}





