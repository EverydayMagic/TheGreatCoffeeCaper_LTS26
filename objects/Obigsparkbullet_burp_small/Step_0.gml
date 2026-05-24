motion_set(direction, 4);



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














