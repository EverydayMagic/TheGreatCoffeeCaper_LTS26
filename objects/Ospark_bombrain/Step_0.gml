if (!babied)
{
	if (path_position >= 0.25)
	{
		parent.attack_again = true;	
		parent.pt_dir = -1;
		parent.bubbled = false;
		babied = true;
	}
}

if (path_position >= 1)
{
	sprite_index = Ssparkexplosion;
	if (instance_exists(shadow)){ instance_destroy(shadow); }
	
	//damage mglass
	if (place_meeting(x, y, Omglass))
	{
		if (image_index < (round((image_number - 1)/2)))
		{
			if (Omglass.invincible = false)
			{
				Omglass.bullet_parent = parent;
				Omglass.damage_taken = damage;
				with (Omglass)
				{
					invincible = true;
					alarm[0] = 1; //invincible blinking
				}
			}	
		}
	}
	
	//destroy itself after animating
	if (image_index >= (image_number - 1))
	{
		image_speed = 0;
		image_index = (image_number - 1);
		if (instance_exists(patharc_id))
		{
			with (patharc_id)
			{
				if (path_exists(path)){ path_delete(path); }
				instance_destroy();
			}
		}
		if (path_exists(shadow_path)){ path_delete(shadow_path); }
		instance_destroy(shadow);
		instance_destroy();
	}
}

if (instance_exists(shadow))
{
	var p = path_position;
	with (shadow){ path_position = p; }
}



