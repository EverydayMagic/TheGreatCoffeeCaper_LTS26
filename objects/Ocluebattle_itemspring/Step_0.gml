keyPause = keyboard_check_pressed(vk_lshift);

if (keyPause)
{
	if (image_speed = 0){ image_speed = 1; }	
}


if (image_index < (image_number - 1))
{
	if (image_index > 1)
	{
		if (!launched)
		{
			Ocluebattle_item.y = y + 3; 
		}
	}
	if (image_index > 2)
	{
		if (!launched)
		{
			Ocluebattle_item.y = y + 4;	
		}
	}
	if (image_index >= 3 && !launched)
	{
		Ocluebattle_item.y = y - 8;
		
		launched = true;
		
		target_x = x;
		target_y = y;
		
		//FOR FUTURE CALEB:
		///I'M TRYING TO SEE IF I CAN USE SINE WAVE FOR ITEM LAUNCHING
		
		
		//PATH ARC
		//with (instance_create_depth(0, 0, 0, Opath_arc))
		//{
		//	curving = true;
		//	x1 = Ocluebattle_item.x;
		//	y1 = Ocluebattle_item.y;
		//	x2 = Omglass.x;
		//	y2 = Omglass.y;
		//	curve_height = 64;
		//	max_points_per_side = 15;
		//	obj = Ocluebattle_item;
		//	spd = 8;
		//	cut_dontadd = true;
		//}
		
	}
} else {
	image_index = 0;
	image_speed = 0;	
}


















