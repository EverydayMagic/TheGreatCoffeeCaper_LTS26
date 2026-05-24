function BigSparkStateGoToCenter(){
	emotion = "happy";
	
	if (!goingtocenter)
	{
		reset_atk_vars();
		reset_zoom_atk_vars();
		reset_burp_atk_vars();
		reset_dvd_atk_vars();
		
		//origin
		gotocenter_origin_x = x;
		gotocenter_origin_y = y;
		
		goingtocenter = true;
	} else {
		
		var _x_dist = gotocenter_target_x - gotocenter_origin_x;
		var _y_dist = gotocenter_target_y - gotocenter_origin_y;
		
		//moving to destination
		if (x != gotocenter_target_x || y != gotocenter_target_y)
		{
			
			//play dash sfx
			if (!audio_is_playing(snd_sparkdash)){ play_sfx(snd_sparkdash); }
			
			gotocenter_speed_mod = animcurve_channel_evaluate(gotocenter_speed_mod_curve, gotocenter_speed_mod_curve_percent);
		
			x = gotocenter_origin_x + (_x_dist * gotocenter_speed_mod);
			y = gotocenter_origin_y + (_y_dist * gotocenter_speed_mod);
			image_angle = 0 + (360 * gotocenter_speed_mod);
			if (dvd_bullet_body_alpha > 0){ dvd_bullet_body_alpha = 1 - gotocenter_speed_mod; }
		
			if (gotocenter_speed_mod_curve_percent < 1)
				gotocenter_speed_mod_curve_percent += 1/15; //<-- the denominator determines how long the travel takes :)
		} else {
			image_angle = 0;
			reset_goingtocenter_vars();
			state = BigSparkStateAttack;
			
			if (audio_is_playing(snd_sparkdash)){ audio_stop_sound(snd_sparkdash); }
			
			exit;
		}
		
	}
}