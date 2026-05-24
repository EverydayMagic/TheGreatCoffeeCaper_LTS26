function BigSparkStateAtk_DVD(){
	emotion = "laugh";
	
	if (dvd_bullet_body_alpha < 1)
	{
		dvd_speed_mod = animcurve_channel_evaluate(dvd_speed_mod_curve, dvd_speed_mod_curve_percent);
		
		dvd_bullet_body_alpha = 1 * dvd_speed_mod;
		image_angle = 360 * dvd_speed_mod;
		
		if (dvd_speed_mod_curve_percent < 1)
			dvd_speed_mod_curve_percent += 1/dvd_wind_up_time;
	} else {
		
		if (!dvd_set)
		{
			dvd_bullet_body_alpha = 1;
			image_angle = 0;
			
			if (alarm[5] = -1){ alarm[5] = dvd_time; }
		
			hspeed = choose(-dvd_speed_choice, dvd_speed_choice);
			vspeed = choose(-dvd_speed_choice, dvd_speed_choice);
		
			dvd_set = true;
		}
	}
	
	if (dvd_set)
	{
	
		if (bbox_bottom > room_height - 16 || bbox_top < 0)
		{
		    vspeed = -vspeed;
			
			//play sfx
			play_sfx(snd_bumpwall);
			
			with (Oscreenshake)
			{
				if (shake = false)
				{
					shake = true;
					shake_time = 3;
					shake_magnitude = 1;
				}
			}
		}
		if (bbox_right > room_width || bbox_left < 0)
		{
		    hspeed = -hspeed;
			
			//play sfx
			play_sfx(snd_bumpwall);
			
			with (Oscreenshake)
			{
				if (shake = false)
				{
					shake = true;
					shake_time = 3;
					shake_magnitude = 1;
				}
			}
		}


		image_angle += 360/(2 * FRAME_RATE);
		
		//hit mglass
		mask_index = Sbigsparkbullet_body;
		
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
			}
		}
		
	}
}