if (ring)
{
	image_speed = 1;
} else {
	if (round(image_index) != 0)
	{
		image_speed = 1;	
	} else { image_speed = 0; image_index = 0; }
}


if (instance_exists(Oplayer))
	depth = Oplayer.depth + 10;




//show_debug_message("ring: " + string(ring));




