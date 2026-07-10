if (beating)
{
	switch (beat)
	{
		case 0:
			if (img_ang < 90 * rot_dir)
			{
				img_ang += (90 * rot_dir) / 15;	
				image_angle = 0 + img_ang;
			} else {
				rot_tot--;
				img_ang = 90 * rot_dir;
				image_angle = 90 * rot_dir;
				rot_dir = -rot_dir;
				beat++;
			}
		break;
		case 1:
			if (rot_tot > 0)
			{
				if (img_ang < 180 * rot_dir)
				{
					img_ang += (180 * rot_dir) / 15;
					image_angle += img_ang;
				} else {
					img_ang = 0;
					image_angle = 90 * rot_dir;
					rot_dir = -rot_dir;	
					rot_tot--;
				}
			} else {
				beat++;	
			}
		break;
	}
}