depth = -y;

if (instance_exists(Ointeractbox) && image_speed = 0)
{
	if (place_meeting(x, y, Ointeractbox) && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle && !instance_exists(Ofade) && Oplayer.state = PlayerStateFree && !Oplayer.hoots_push && !global.cutsceneActive)
	{
		open =! open;
	}	
}

if (open)
{
	if (sprite_index = Sumbrellatable_idle && image_index = 1)
	{
		//open the umbrella
		sprite_index = Sumbrellatable_open_anim;
		image_speed = 1;
	} else {
		if (sprite_index = Sumbrellatable_open_anim) //currently opening
		{
			if (image_index >= image_number - 1) //done animating
			{
				sprite_index = Sumbrellatable_idle;
				image_index = 0;
				image_speed = 0;
			}
		}
	}
	
} else {
	if (sprite_index = Sumbrellatable_idle && image_index = 0)
	{
		//close the umbrella
		sprite_index = Sumbrellatable_close_anim;
		image_speed = 1;
	} else {
		if (sprite_index = Sumbrellatable_close_anim)
		{
			if (image_index >= image_number - 1) //done animating
			{
				sprite_index = Sumbrellatable_idle;
				image_index = 1;
				image_speed = 0;
			}	
		}
	}
}

















