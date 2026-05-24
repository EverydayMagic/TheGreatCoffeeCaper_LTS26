if (global.saveslot_story[global.saveslot][STORY_PACE.OPEN_UP_BANDITS] = 0 && global.saveslot_story[global.saveslot][STORY_PACE.MEET_BEAN_BANDITS] = 1)
{
	//create sprites
		with (instance_create_depth(24, 49, 100, Ocmouse_openupbb_cutcheck))
		{
			sprite_index = Scmouse_doorbang;
			
			if (instance_exists(Oplayer)){ depth = Oplayer.depth + 1; }
		}
	
	//create collisions
		//for charlie
			with (instance_create_layer(15, 43, "Col", Ocol))
			{
				image_xscale = 2.25;
				image_yscale = 1;
			}
			
}

if (global.saveslot_story[global.saveslot][STORY_PACE.OPEN_UP_BANDITS] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.MEET_CLAWDINE] = 0)
{
	//after cut invis sign
	with (instance_create_depth(15, 40, 0, Oopenupbandits_aftercut))
	{
		image_xscale = 0.2880;
		image_yscale = 0.125;
	}
}