if (image_index >= (image_number - 1))
{
	image_index = image_number - 1;
	
	if (image_alpha > 0)
	{
		if (fade_out)
		{
			image_alpha -= 1/30;	
		} else {
			if (alarm[0] = -1){ alarm[0] = 30; }	
		}
	} else {
		instance_destroy();	
	}
}



