
if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_MOOSH] = 1)
{
	//mushroom
	with (instance_create_layer(120, 81, "Instances", Omooshmushroom))
	{
		image_alpha = 1;
		image_index = 0;
		image_speed = 0;
	}
	
	////mushroom collision
	//with (instance_create_layer(113, 73, "Col", Ocol))
	//{
	//	image_xscale = 1.75;
	//	image_yscale = 1;
	//}
}