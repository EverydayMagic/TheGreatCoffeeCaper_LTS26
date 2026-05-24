show_debug_message("hh: " + string(healthhearts_curscale));

#region lost battle

if (healthhearts_curscale <= 0 && !instance_exists(Ocluebattle_sendsparkles) && (global.battle_result < 0 || global.battle_result = 2))
{
	global.battle_lock = true;
	global.battle_result = 2;
	
	
	
	switch (beat)
	{
		case 0:
			with (Omglass)
			{
				alarm[0] = -1;
				invincible = false;
				iframes_run = 0;
				sharded = false;
				image_alpha = 1;
				sprite_index = Smglass_battle_hurt_progress;
				image_index = 0;
			}
			
			if (radius > 44)
			{
				if (!audio_is_playing(snd_iris_exiting))
				{
					play_sfx(snd_iris_exiting);	
				}
				
				radius -= 16;	
			} else {
				if (alarm[0] = -1 && !instance_exists(Oglassshard))
					alarm[0] = 15;
			}
		break;
		
		case 1:
			if (!audio_is_playing(snd_glassshattering))
			{
				//sound effects
				play_sfx(snd_glassshattering);		
			}
		
			Omglass.image_index = 0;
			
			with (Ocharshake)
			{
				if (!shake)
				{
					shake = true;
					char = [Omglass];
					dir = "horz"
					shake_time = 10;
					shake_magnitude = 0.5;
					shake_fade = 0.25;
					cut_dontadd = true;
				}
			}
			
			if (instance_number(Omglass_gshard_dead) < 2)
			{
				instance_create_depth(Omglass.x, Omglass.y, Omglass.depth - 1, Omglass_gshard_dead);	
				
			} else beat++;
		break;
		
		case 2:
			if (alarm[0] = -1)
				alarm[0] = 15;
			if (audio_is_playing(snd_glassshattering))
			{
				audio_stop_sound(snd_glassshattering);	
			}
		break;
		
		case 3:
			if (!audio_is_playing(snd_glassshattering))
			{
				//sound effects
				play_sfx(snd_glassshattering);		
			}
		
			Omglass.image_index = 1;
			
			with (Ocharshake)
			{
				if (!shake)
				{
					shake = true;
					char = [Omglass];
					dir = "horz"
					shake_time = 10;
					shake_magnitude = 0.5;
					shake_fade = 0.25;
					cut_dontadd = true;
				}
			}
			
			if (instance_number(Omglass_gshard_dead) < 4)
			{
				instance_create_depth(Omglass.x, Omglass.y, Omglass.depth - 1, Omglass_gshard_dead);	
				
			} else beat++;
		break;
		
		case 4:
			if (alarm[0] = -1)
				alarm[0] = 15;
			if (audio_is_playing(snd_glassshattering))
			{
				audio_stop_sound(snd_glassshattering);	
			}
		break;
		
		case 5:
			if (!audio_is_playing(snd_glassshattering))
			{
				//sound effects
				play_sfx(snd_glassshattering);		
			}
			
			Omglass.image_index = 2;
			
			with (Ocharshake)
			{
				if (!shake)
				{
					shake = true;
					char = [Omglass];
					dir = "horz"
					shake_time = 10;
					shake_magnitude = 0.5;
					shake_fade = 0.25;
					cut_dontadd = true;
				}
			}
			
			if (instance_number(Omglass_gshard_dead) < 6)
			{
				instance_create_depth(Omglass.x, Omglass.y, Omglass.depth - 1, Omglass_gshard_dead);	
				
			} else beat++;
		break;
		
		case 6:
			if (alarm[0] = -1)
				alarm[0] = 15;
				
			if (audio_is_playing(snd_glassshattering))
			{
				audio_stop_sound(snd_glassshattering);	
			}
		break;
		
		case 7:
			if (!audio_is_playing(snd_glassshattering))
			{
				//sound effects
				play_sfx(snd_glassshattering);		
			}
		
			Omglass.image_index = 3;
			
			with (Ocharshake)
			{
				if (!shake)
				{
					shake = true;
					char = [Omglass];
					dir = "horz"
					shake_time = 10;
					shake_magnitude = 0.5;
					shake_fade = 0.25;
					cut_dontadd = true;
				}
			}
			
			if (instance_number(Omglass_gshard_dead) < 9)
			{
				instance_create_depth(Omglass.x, Omglass.y, Omglass.depth - 1, Omglass_gshard_dead);	
				
			} else beat++;
		break;
		
		case 8:
			if (alarm[0] = -1)
				alarm[0] = 15;
			if (audio_is_playing(snd_glassshattering))
			{
				audio_stop_sound(snd_glassshattering);	
			}
		break;
	}
	
}

#endregion

if (shake)
{
	if (xval <= 0) { xval = shake_magnitude; } else { xval = -shake_magnitude; }
	
	if (shake_time > 0)
		shake_time--;
		
	var _xval = xval;
	for (var i = 0; i < array_length(healthbar_obj); i++)
	{
		with (healthbar_obj[i])
			x += _xval;
	}
	
	if (shake_time <= 0)
	{
		shake_magnitude -= shake_fade;
		
		if (shake_magnitude <= 0)
		{
			for (var i = 0; i < array_length(healthbar_obj); i++)
			{
				with (healthbar_obj[i])
					x = old_x;
			}
			shake = false;
			shake_magnitude = shake_magnitude_const;
		}
	}
}











