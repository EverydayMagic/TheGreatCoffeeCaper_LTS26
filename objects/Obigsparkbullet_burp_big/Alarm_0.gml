/// @description explode
spd = 0;
var _pt_dir = point_direction(x, y, Omglass.x, Omglass.y);
var _mid_shot = irandom(1);

for (var i = -1; i < 2; i++)
{
	if (_mid_shot = 0)
	{
		if (i != 0)
		{
			with (instance_create_depth(x, y, depth, Obigsparkbullet_burp_small))
			{
				direction = _pt_dir + (24 * i);
		
				//show_debug_message("dir: " + string(direction));
			}
		}
		
	} else {
		if (i = 0)
		{
			with (instance_create_depth(x, y, depth, Obigsparkbullet_burp_small))
			{
				direction = _pt_dir + (24 * i);
		
				//show_debug_message("dir: " + string(direction));
			}		
		}
	}
}

//sound effect
play_sfx(snd_explosion);

instance_destroy();

















