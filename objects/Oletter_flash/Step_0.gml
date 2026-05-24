if (image_index >= (image_number - 1))
{
	image_index = (image_number - 1);
	image_speed = 0;
}

if ((image_index >= ((image_number - 1)/2)))
{
	if (image_alpha > 0)
	{
		image_alpha -= 1/30;	
	} else {
		instance_destroy();	
	}
}
















