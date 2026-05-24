switch (beat)
{
	case 0:
		//moving away from mglass
		if (point_distance(x, y, start_x, start_y) < 16)
		{
			motion_set(direction, 16/7);
		} else {
			motion_set(direction, 0);
			beat++;
		}
	break;
	case 1:
	//rotating towards healthbar
	//80 for 1
	//85 for 2
		image_angle = direction;
		
		var _pt_dir = round(point_direction(x, y, target_x, target_y));
		if (direction < _pt_dir)
		{	
			direction += _pt_dir/7;	
		} else {
			//hold for a moment
			if (hold_time < 8)
				hold_time++;
			else
				beat++;
		}
	break;
	
	case 2:
	//moving to healthbar
		if (!path_exists(path))
		{
			path = path_add();
			path_set_closed(path, false);
			path_add_point(path, x, y, 100);
			path_add_point(path, target_x, target_y, 100);
			path_start(path, 16, path_action_stop, true);
			
			//sound effect
			play_sfx(snd_falling, 1, 2);
		}
			//if (hbar_dist = -1)
			//	hbar_dist = point_distance(x, y, target_x, target_y);
			//var _hbar_dir = point_direction(x, y, target_x, target_y);
			//motion_set(_hbar_dir, hbar_dist/15);
		beat++;
	break;
	
	case 3:
		if (path_exists(path))
		{
			if (path_position = 1)
			{
				//sound effect
				play_sfx(snd_hurt);
				
				path_delete(path);
				var _ch = Ocluebattle_healthbar;
				if (_ch.healthhearts_curscale > 0)
				{
					_ch.healthhearts_curscale -= hp_part;
				}
				_ch.reset_shake_vars();
				_ch.shake = true;
				//with (Ocluebattle_healthbar)
				//{
				//	//subtracting health
				//		if (healthhearts_xscale >= 0.65)
				//			healthhearts_xscale -= _self.hh_mod;
				//	//shake
				//		reset_shake_vars();
				//		shake = true;

				//}
			
				instance_destroy();
			}
		}
	break;
}







