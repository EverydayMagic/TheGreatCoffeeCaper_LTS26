if (object != noone && instance_exists(object) && !multi_goto_done && pause_done)
{
	if (uphill_move)
	{
		//need to calc dists (calc is short for calculate)
		if (array_length(dist_x) <= 0)
		{
			for (var b = 0; b < array_length(x_pos); b++)
			{
				if (b > 0)
				{
					array_push(dist_x, x_pos[b] - x_pos[b - 1]);
					array_push(dist_y, y_pos[b] - y_pos[b - 1]);
				} else {
					array_push(dist_x, x_pos[0] - origin_x);
					array_push(dist_y, origin_y - y_pos[0]);
				}
			}
		}
		
		if (percent < 1)
		{
			percent += spd/FRAME_RATE;
			position = animcurve_channel_evaluate(anim_curve, percent);
			
			if (object.x != x_pos[goto_track] && object.y != y_pos[goto_track])
			{
				if (goto_track = 0)
				{
					object.x = origin_x + (dist_x[goto_track] * position);
					object.y = origin_y + (dist_y[goto_track] * position);
				} else {
					object.x = dist_x[goto_track - 1] + (dist_x[goto_track] * position);
					object.y = dist_y[goto_track - 1] + (dist_y[goto_track] * position);
				}
			}
		} else {
			percent = 0;
			object.x = x_pos[goto_track];
			object.y = y_pos[goto_track];
			add_goto_track();
		}
	}
	
	//setting the sprite of the object
	if (array_length(spr_list) > 0)
	{
		object.sprite_index = spr_list[goto_track];	
		if (imagespd_manual = noone)
			object.image_speed = spd;
		else
			object.image_speed = imagespd_manual;
	}
	
	//turning on hoots_cutscene tracking (for charlie) if needed
	if (hoots_track_start != -1)
	{
		if (goto_track = hoots_track_start && instance_exists(Ohoots_cutscene))
			Ohoots_cutscene.begin_record = true;
	}
	
	if (uphill_move){ exit; }
	
	var _checkx = false;
	var _checky = false;
	var _xTo = x_pos[goto_track];
	var _yTo = y_pos[goto_track];
	if (goto_track = 0)
	{
		var _xFrom = origin_x;
		var _yFrom = origin_y;
		
		var _xdis = _xFrom - _xTo;
		var _ydis = _yFrom - _yTo;
	} else {
		var _xFrom = x_pos[goto_track - 1];
		var _yFrom = y_pos[goto_track - 1];
		
		var _xdis = _xFrom - _xTo;
		var _ydis = _yFrom - _yTo;
	}
	
	if (spd != 1)
	{
		//check to see if we should go straight to destination due to the speed
		//for x
			if (_xFrom < _xTo)
			{
				if (object.x + spd >= _xTo)
				{
					object.x = _xTo;
					_checkx = true;
				}
			} else {
				if (object.x - spd <= _xTo)
				{
					object.x = _xTo;
					_checkx = true;
				}
			}
		//for y
			if (_yFrom < _yTo)
			{
				if (object.y + spd >= _yTo)
				{
					object.y = _yTo;
					_checky = true;
				}
			} else {
				if (object.y - spd <= _yTo)
				{
					object.y = _yTo;
					_checky = true;
				}
			}
		if (_checkx && _checky)
		{
			object.x = _xTo;
			object.y = _yTo;
			add_goto_track();
			exit;
		} else {
			
				var _charshake_check = false;
				if (instance_exists(Ocharshake))
				{
					for (var i = 0; i < array_length(Ocharshake); i++)
					{
						if (Ocharshake.char[i] = object)
						{
							_charshake_check = true;
							break;
						}
					}
				}
				if (!_charshake_check)
				{
					if (object.x = _xTo && object.y = _yTo)
					{
						object.x = _xTo;
						object.y = _yTo;
						add_goto_track();
						exit;
					}
				} else {
					if ((object.x = _xTo + Ocharshake.shake_magnitude || object.x = _xTo - Ocharshake.shake_magnitude || object.x = _xTo) && (object.y = _yTo + Ocharshake.shake_magnitude || object.y = _yTo - Ocharshake.shake_magnitude || object.y = _yTo))
					{
						object.x = _xTo;
						object.y = _yTo;
						add_goto_track();
						exit;	
					}
				}
			
		}
	}
	
	if (object.x != _xTo && object.y != _yTo)
	{
		//checking to see if the object will be moving to the left or right (pos x or neg x)
		if (_xdis != 0)
		{
			if (_xdis < 0)
			{
				object.x += spd;
			} else {
				object.x -= spd;
			}
		}
		
		//checking to see if the object will be moving up or down (neg y or pos y)
		if (_ydis != 0)
		{
			if (_ydis > 0)
			{
				object.y -= spd;
			} else {
				object.y += spd;
			}
		}
	} else {
		
		if (object.x = _xTo && object.y != _yTo)
		{
			
			if (_ydis > 0)
			{
				object.y -= spd;
			} else {
				object.y += spd;
			}
			
		} else {
			if (object.y = _yTo && object.x != _xTo)
			{
				
				if (_xdis < 0)
				{
					object.x += spd;
				} else {
					object.x -= spd;
				}
				
			} else {
				
				var _charshake_check = false;
				if (instance_exists(Ocharshake))
				{
					for (var i = 0; i < array_length(Ocharshake); i++)
					{
						if (Ocharshake.char[i] = object)
						{
							_charshake_check = true;
							break;
						}
					}
				}
				if (!_charshake_check)
				{
					if (object.x = _xTo && object.y = _yTo)
					{
						object.x = _xTo;
						object.y = _yTo;
						add_goto_track();
						exit;
					}
				} else {
					if ((object.x = _xTo + Ocharshake.shake_magnitude || object.x = _xTo - Ocharshake.shake_magnitude || object.x = _xTo) && (object.y = _yTo + Ocharshake.shake_magnitude || object.y = _yTo - Ocharshake.shake_magnitude || object.y = _yTo))
					{
						object.x = _xTo;
						object.y = _yTo;
						add_goto_track();
						exit;	
					}
				}
				
			} 
		}
	}
	
}
//show_debug_message("TRACK: " + string(goto_track));