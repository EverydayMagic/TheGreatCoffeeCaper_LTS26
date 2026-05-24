if (shake)
{
	
	shake_time -= 1;
	var _xval = choose(-shake_magnitude, shake_magnitude);
	var _yval = choose(-shake_magnitude, shake_magnitude);
	camera_set_view_pos(VIEW, _xval, _yval);
	
	if (shake_time <= 0)
	{
		shake_magnitude -= shake_fade;
		
		if (shake_magnitude <= 0)
		{
			camera_set_view_pos(VIEW, 0, 0);
			shake = false;
			if (!loop)
			{
				shake_time = 0;
				shake_magnitude = 0;
			} else alarm[0] = loop_freq;
			if (global.cutsceneActive && dontadd = false)
				add_move_order(add_move_mod);
			dontadd = false;
		}
	}
}



