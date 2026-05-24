if (visible && !global.battle_lock)
	motion_add(direction, spd);
else {
	if (global.battle_lock)
		motion_set(direction, 0);
}



//hit mglass
if (place_meeting(x, y, Omglass))
{
	if (Omglass.invincible = false)
	{
		if (instance_exists(parent))
		{
			if (point_distance(x, y, parent.x, parent.y) <= min_dist)
			{
				//give variables to parent spark
				parent.pt_dir = -1;
				parent.bubbled = false;
			}
		}
		
		Omglass.bullet_parent = parent;
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

if ((x > room_width || x < 0) || (y > room_height || y < 0))
	instance_destroy();












