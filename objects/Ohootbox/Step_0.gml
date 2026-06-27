depth = -bbox_bottom;
if (instance_exists(Oplayer))
{
	x = Oplayer.x;
	y = Oplayer.y;
	
	
	//check for holes
	var _hole = instance_place(x, y, Opushblock_hole);
	if (instance_exists(_hole))
	{
		//we are touching the hole, we need to select the closest hole in case we're near two
		
		//clear the list for this use
		if (ds_list_size(pushblock_hole_list) >= 0)
		{
			if (ds_exists(pushblock_hole_list, ds_type_list))
			{ 
				ds_list_clear(pushblock_hole_list); 
				closest_hole = 0;
				closest_hole_dist = 999;
			}
		}
		
		instance_place_list(x, y, Opushblock_hole, pushblock_hole_list, false);
			
		//manually order the list based on center of block rather than top corner
		closest_hole = pushblock_hole_list[| 0];
		closest_hole_dist = 999;
		for (var p = 0; p < ds_list_size(pushblock_hole_list); p++)
		{
			var _pbhole = pushblock_hole_list[| p];
			var _dist = 0;
			var _full = false;
			with (_pbhole)
			{
				_dist = point_distance(_hole.x + 8, _hole.y + 8, x, y);
				_full = full;
			}
			if (_dist < closest_hole_dist && !_full)
			{
			    closest_hole_dist = _dist;
			    closest_hole = _pbhole;
			}	
		}
		
		
		//now that we know what hole to fall into, move toward the hole and fall
		if (!closest_hole.full)
		{
			var _ch = closest_hole;
			with (Oplayer)
			{
				state_manual = true;
				state = PlayerStateLocked;
				if (instance_exists(Osweatbeads)){ instance_destroy(Osweatbeads); }
				sprite_index = Splayer_holefall;
				//move towards hole
				if (!instance_exists(Omulti_goto))
				{
					var _x = x;
					var _y = y;
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Oplayer;
						origin_x = _x;
						origin_y = _y;
						x_pos = [_ch.x + 8];
						y_pos = [_ch.y + 11];
						spd = 2;
					}
				} else if (x = _ch.x + 8 && y = _ch.y + 11) {
					while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
			
					//now actually fall
					visible = false;
					sprite_index = Splayer_capidle;
					_ch.full = true;
					_ch.full_by = Oplayer;
				}
			}
			
			if (ds_exists(pushblock_hole_list, ds_type_list))
			{ 
				ds_list_clear(pushblock_hole_list); 
				closest_hole = 0;
				closest_hole_dist = 999;
			}
			
		}
		
	} else {
		
		if (ds_exists(pushblock_hole_list, ds_type_list))
		{ 
			ds_list_clear(pushblock_hole_list); 
			closest_hole = 0;
			closest_hole_dist = 999;
		}
		
	}
}









