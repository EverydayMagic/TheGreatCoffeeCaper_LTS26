if (curving && obj != noone)
{
	if (instance_exists(obj))
	{
		// --- Midpoint ---
		var mid_x = (x1 + x2) / 2;
		var mid_y = (y1 + y2) / 2;

		// --- Control Point: ABOVE midpoint = curve bows downward (∩) ---
		var control_x = mid_x;
		var control_y = mid_y - curve_height;

		// Clamp control point within room
		control_y = max(0, control_y);

		// --- Generate curve points ---
		var total_points = max_points_per_side * 2;
		curve_points_x = [];
		curve_points_y = [];

		for (var i = 0; i <= total_points; i++) {
		    var t = i / total_points;

		    var xt = round((1 - t) * (1 - t) * x1 + 2 * (1 - t) * t * control_x + t * t * x2);
		    var yt = round((1 - t) * (1 - t) * y1 + 2 * (1 - t) * t * control_y + t * t * y2);

		    xt = clamp(xt, 0, room_width);
		    yt = clamp(yt, 0, room_height);

		   curve_points_x[i] = xt;
		   curve_points_y[i] = yt;
		}
	
		if (path_exists(path))
			path_delete(path);
		path = path_add();
		path_set_kind(path, 0);
		path_set_closed(path, false);
	
		for (var i = 0; i < array_length(curve_points_x) - 1; i++)
		{
			path_add_point(path, curve_points_x[i], curve_points_y[i], 100);		
		}
		if (path_exists(path))
		{
			var p = path;
			var _spd = spd;
			with (obj) {
				path_start(p, _spd, path_action_stop, true);
			}
			curving = false;
		}
	}
}

if (obj != noone && !curving) //if we just made curve
{
	if (instance_exists(obj))
	{
		if (obj.path_position = 1)
		{
			//add to cutscene
			if (global.cutsceneActive)
			{
				if (!cut_dontadd)
					add_move_order();
		
				instance_destroy();
			}
			
			if (path_exists(path))
				path_delete(path);
		}
	}
}






