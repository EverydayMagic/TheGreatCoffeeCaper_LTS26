function BigSparkStateAtk_Zoom(){
	#region go to corner
		
		//if we are done attacking
		if (zoom_shots >= zoom_max_shots)
		{
			atk_performed++;
			state = BigSparkStateGoToCenter;
			exit;
		}
		
		//for face direction
		if (zoom_cur_corner = 2 || zoom_cur_corner = 4)
		{
			face_xscale = -1;		
		} else face_xscale = 1;
		
		if (!attacking)
		{
		
			if (!zooming)
			{
				emotion = "sneer";
				
				//pick a corner
				///corner nums are right to left (top left is 1, bottom left is 3, etc)
				var _corner = 0;
				if (zoom_cur_corner = 0) //currently not in a corner (likely beginning of the atk)
				{
					_corner = irandom_range(1, 4);
			
				} else {
					_corner = choose(zoom_available_corners[0], zoom_available_corners[1]);
				}
		
				//edit available corners (for next zoom)
				switch (_corner)
				{
					case 1:
						zoom_available_corners = [2, 3];
					break;
					case 2:
						zoom_available_corners = [1, 4];
					break;
					case 3:
						zoom_available_corners = [1, 4];
					break;
					case 4:
						zoom_available_corners = [2, 3];
					break;
				}
		
		
				//not using paths because I dont think I can adjust the speed while moving (idk for sure though) (also hi future hackerman)
		
				//setting origin
				zoom_origin_x = x;
				zoom_origin_y = y;	
		
				//getting target pos
				switch (_corner)
				{
					case 1:
						zoom_target_x = 16;
						zoom_target_y = 16;	
					break;
					case 2:
						zoom_target_x = 144;
						zoom_target_y = 16;	
					break;
					case 3:
						zoom_target_x = 16;
						zoom_target_y = 112;	
					break;
					case 4:
						zoom_target_x = 144;
						zoom_target_y = 112;	
					break;
				}
				
				zoom_cur_corner = _corner;
				
				zooming = true;
		
			}
	
			var _x_dist = zoom_target_x - zoom_origin_x;
			var _y_dist = zoom_target_y - zoom_origin_y;
	
			//moving to destination
			if (x != zoom_target_x || y != zoom_target_y)
			{
				//stop machine gun sfx
				if (audio_is_playing(snd_machinegun)){ audio_stop_sound(snd_machinegun); }
				//play dash sfx
				if (!audio_is_playing(snd_sparkdash)){ play_sfx(snd_sparkdash); }
				
				zoom_speed_mod = animcurve_channel_evaluate(zoom_speed_mod_curve, zoom_speed_mod_curve_percent);
		
				x = zoom_origin_x + (_x_dist * zoom_speed_mod);
				y = zoom_origin_y + (_y_dist * zoom_speed_mod);
				image_angle = 0 + (360 * zoom_speed_mod);
		
				if (zoom_speed_mod_curve_percent < 1)
					zoom_speed_mod_curve_percent += 1/zoom_travel_time; //<-- the denominator determines how long the travel takes :)
			} else {
				//change variables
				zooming = false;
				zoom_speed_mod = 0;
				zoom_speed_mod_curve_percent = 0;
				attacking = true;
				zoom_warning_block_alpha = -1;
				image_angle = 0;
				
				//change direction (for bullets and warning block)
				switch (zoom_cur_corner)
				{
					case 1:
						direction = 315;
						zoom_warning_block_dir = 45;
					break;
					case 2:
						direction = 225;
						zoom_warning_block_dir = 315;
					break;
					case 3:
						direction = 45;
						zoom_warning_block_dir = 135;
					break;
					case 4:
						direction = 135;
						zoom_warning_block_dir = 225;
					break;
				}
			}
		
		}
	
	#endregion
	
	#region attacking
		
		if (attacking)
		{
			//if we haven't shot any bullets yet
			if (!shooting)
			{
				//run warning flash
				///alpha
				if (zoom_warning_block_alpha = -1){ zoom_warning_block_alpha = 0.5; }
				zoom_warning_block_alpha -= 0.5/zoom_warning_block_time;
				
				//wait till atk
				if (alarm[0] = -1)
				{ 
					alarm[0] = (zoom_warning_block_time + 5); 
					
					//flash sfx
					play_sfx(snd_warnflash);
				}
				
			} else {
				
				image_angle += (360)/zoom_shoot_time;
				
				if (alarm[1] = -1)
				{ 
					alarm[1] = zoom_shoot_time; //how long the shooting will last
					
					//sound effect
					play_sfx(snd_machinegun);
				} 
				
				if (zoom_shoot_gap_time = 0)
				{
					emotion = "sneer open";
					
					//making bullets
					for (var i = 0; i < 2; i++) //two per row
					{
						var _basex = 0;
						var _basey = 0;
						switch (zoom_cur_corner)
						{
							case 1:
								_basex = 24;
								_basey = 24;
							break;
							case 2:
								_basex = 136;
								_basey = 24;
							break;
							case 3:
								_basex = 23;
								_basey = 102;
							break;
							case 4:
								_basex = 136;
								_basey = 104;
							break;
						}
						var _dir = direction;
						
						if (i = 0)
						{
							with (instance_create_depth(_basex + 8, _basey, depth - 50, Obigsparkbullet_zoom))
							{						
								direction = _dir;
							}
						} else {
							with (instance_create_depth(_basex - 8, _basey, depth - 50, Obigsparkbullet_zoom))
							{
								direction = _dir;
							}	
						}
					}
					
					//reset gap time
					zoom_shoot_gap_time = zoom_shoot_gap_time_const;
					
				} else {
					zoom_shoot_gap_time--;
				}
			}
			
		}
		
	#endregion
	
}