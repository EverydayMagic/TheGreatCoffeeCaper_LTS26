if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
{
	//jitters
	with (instance_create_layer(21, 95, "Instances", Ojitters))
	{
		sprite_index = Sjitters_passout;	
	}
	
	//jitters collision
	with (instance_create_layer(13, 82, "Col", Ocol))
	{
		image_xscale = 2.375;
		image_yscale = 1.75;
	}
	
	//harmony
	instance_create_layer(56, 127, "Instances", Oharmony);
	
	//collision for harmony
	with (instance_create_layer(48, 120, "Col", Ocol))
	{
		image_xscale = 2;
		image_yscale = 1;
	}
	
	//mother duck
	instance_create_layer(73, 96, "Instances", Omotherduck);
	
	//baby duck 1
	instance_create_layer(86, 96, "Instances", Obabyduck);
	//baby duck 2
	with (instance_create_layer(96, 96, "Instances", Obabyduck))
	{
		duck_type = 1;	
	}
	//yellow duck
	with (instance_create_layer(110, 96, "Instances", Obabyduck))
	{
		image_index = 1;
		duck_type = 2;
	}
	
	//collision for ducks
	with (instance_create_layer(72, 91, "Col", Ocol))
	{
		image_xscale = 6.25;
		image_yscale = 0.5;
	}
}