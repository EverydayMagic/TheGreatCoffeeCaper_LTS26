if (global.story_beat >= 17 && global.story_beat < 21)
{
	if (instance_exists(Ointeractbox) && sprite_index != Sstroller_hop)
	{
		if (place_meeting(x, y, Ointeractbox))
		{
			sprite_index = Sstroller_hop;
			image_index = 0;
			image_speed = 1;
		}
	}
}

if (sprite_index = Sstroller_hop)
{
	
	if (image_index >= (image_number - 1))
	{
		sprite_index = Sstroller;
		image_index = 1;
		image_speed = 0;
	}
}



depth = -y;












