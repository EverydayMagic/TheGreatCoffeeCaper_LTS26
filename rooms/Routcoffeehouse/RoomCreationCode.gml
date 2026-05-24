if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)//Invest Cup O Joe not done
{
	//create business fish
	with (instance_create_layer(25, 80, "Instances", Obusinessfish))
	{
		image_index = 0;
		image_speed = 0;
	}
	
	//business fish briefcase
	instance_create_layer(16, 96, "Instances", Obusinessfish_briefcase);
	
	//business fish invis sign
	with (instance_create_depth(16, 64, 0, Oinvissign))
	{
		text_id = "businessfishlate";	
		image_xscale = 1.749421;
		image_yscale = 1.9375;
	}
	
	//create fox
	instance_create_layer(62, 63, "Instances", Ofox);
	
	//fox collision
	with (instance_create_layer(56, 48, "Col", Ocol))
	{
		image_xscale = 1;
		image_yscale = 2;
	}
	
	//create hedgehog
	with (instance_create_layer(136, 111, "Instances", Ohedgehog))
	{
		image_index = 3;
		image_speed = 0;
	}
	
	//hedgehog collision
	with (instance_create_layer(128, 96, "Col", Ocol))
	{
		image_xscale = 2.25;
		image_yscale = 1.75;
	}
	
	//create sniffles
	with (instance_create_layer(120, 73, "Instances", Osniffles))
	{
		sprite_index = Ssniffles_future;
		image_speed = 1;
	}
}