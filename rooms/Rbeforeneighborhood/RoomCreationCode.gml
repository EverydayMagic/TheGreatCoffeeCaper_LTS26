if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.MEET_BEAN_BANDITS] = 0)
{
	//Create Puffy and Stump
	with (instance_create_depth(24, 91, 100, Opuffy))
	{
		sprite_index = Spuffy_idle_r;
		image_speed = 0;
	}
	with (instance_create_depth(38, 92, 100, Ostump))
	{
		sprite_index = Sstump_idle;
		image_index = 2;
		image_speed = 0;
	}
}

if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0) //Invest CupOJoe not done
{
	//create book that blocks you
	instance_create_layer(128, 96, "Instances", Obookdown);
	
	//create collision for book
	with (instance_create_layer(128, 96, "Col", Ocol))
	{
		image_xscale = 2;
		image_yscale = 3.25;
	}
}

if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_BOOKWORM] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.FOUND_ALL_MAIN_CLUES] = 0) //if meet bookworm is done
{
	instance_create_depth(121, 85, 0, Obookworm);
}