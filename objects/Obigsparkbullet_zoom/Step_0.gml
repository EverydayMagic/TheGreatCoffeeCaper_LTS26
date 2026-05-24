//image rotation
switch (direction)
{
	case 315: //corner 1
		image_angle = 0;
	break;
	case 225: //corner 2
		image_angle = 270;
	break;
	case 45: //corner 3
		image_angle = 90;
	break;
	case 135: //corner 4
		image_angle = 180;
	break;
}

motion_set(direction, 10);




if ((x > room_width + 10) || (x < -10) || (y > room_height + 10) || (y < -10))
{
	instance_destroy();	
}



//hit mglass
if (place_meeting(x, y, Omglass))
{
	if (Omglass.invincible = false)
	{		
		Omglass.bullet_parent = Obigsparkboss;
		Omglass.damage_taken = damage;
		with (Omglass)
		{
			//sound effect
			play_sfx(snd_smallglassshatter);
			
			invincible = true;
			alarm[0] = 1; //invincible blinking
		}
		instance_destroy();
		exit;
	}
}











