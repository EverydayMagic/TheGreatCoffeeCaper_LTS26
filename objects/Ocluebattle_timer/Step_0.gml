if (Ocluebattle_manager.item = global.item_list.hammer){ total_time = 60; }

if (global.battle_result = 1){ depth = Ocluebattle_cluereward.depth + 10; }

#region time ran out

	if (abs(handle_rot) >= 360 && !Ocluehunt.trans_to_battle && !instance_exists(Ocluebattle_sendsparkles) && (global.battle_result < 0 || global.battle_result = 0))
	{
		global.battle_lock = true;
		global.battle_result = 0;
		
		//grey iris
		switch (beat)
		{
			case 0:
				if (radius > 44)
				{
					if (!audio_is_playing(snd_iris_exiting))
					{
						play_sfx(snd_iris_exiting);	
					}
					
					radius -= 16;	
				} else {
					//dinging sfx
					play_sfx(snd_timerdinging);
					
					beat++;
					shake = true;
				}
			break;
			
			case 1:
				if (shake)
				{
					if (xval <= 0) { xval = shake_magnitude; } else { xval = -shake_magnitude; }
					
					if (alarm[1] = -1){ alarm[1] = shake_time; }

					x += xval;
	
					if (shake_time <= 0)
					{
						shake_magnitude -= shake_fade;
		
						if (shake_magnitude <= 0)
						{
							x = old_x;
							shake = false;
							shake_magnitude = shake_magnitude_const;
						}
					}
				}
			break;

		}
		
	}

#endregion



#region warnings

	//warning with 30 sec left
	if (time_elapsed >= time_before_finalcount && time_elapsed < total_time - 20)
	{
		if (pie_alpha_gain)
			if (pie_alpha < 1)
				pie_alpha += 0.1;
			else
				pie_alpha_gain = false;
		else
			if (pie_alpha > 0)
				pie_alpha -= 0.1;
			else
				pie_alpha_gain = true;
	}
	//warning with 20 sec left
	if (time_elapsed >= (time_before_finalcount + 10) && time_elapsed < total_time - 10)
	{
		if (pie_alpha_gain)
			if (pie_alpha < 1)
				pie_alpha += 0.25;
			else
				pie_alpha_gain = false;
		else
			if (pie_alpha > 0)
				pie_alpha -= 0.25;
			else
				pie_alpha_gain = true;
	}
	//warning with 10 sec left
	if (time_elapsed >= (time_before_finalcount + 20) && time_elapsed < total_time)
	{
		if (pie_alpha_gain)
			if (pie_alpha < 1)
				pie_alpha += 0.5;
			else
				pie_alpha_gain = false;
		else
			if (pie_alpha > 0)
				pie_alpha -= 0.5;
			else
				pie_alpha_gain = true;
	}
	if (time_elapsed = total_time)
		pie_alpha = 1;
	

	//show_debug_message("te: " + string(time_elapsed));
#endregion

