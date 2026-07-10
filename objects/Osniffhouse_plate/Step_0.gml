if (instance_exists(Osniffhouse_plateshelf))
{
	if (Osniffhouse_plateshelf.tilt)
	{
		if (y != start_y && !roll)
		{
			y += 1/15;
			image_angle += 3/15;
		} else { roll = true; }
		
		if (roll && !fall)
		{
			if (x > 42)
			{
				x -= (54-42)/FRAME_RATE;
				image_angle += 360/FRAME_RATE;
			} else {
				x = 42;
				image_angle = 3;
				fall = true;
			}
		}
		
		if (fall)
		{
			if (sprite_index = Splate)
			{
				if (image_index = 0){ sprite_index = Splate_fall_big; }
				if (image_index = 1){ sprite_index = Splate_fall_small; }
			} else {
				if (image_index < image_number - 1)
				{
					image_speed = 1;	
				} else { 
					image_index = image_number - 1;
					if (y < 21)
					{
						y += (21 - 6)/15;
					} else {	
						y = 21;
						//break
					}
				}
			}
		}
	}
}