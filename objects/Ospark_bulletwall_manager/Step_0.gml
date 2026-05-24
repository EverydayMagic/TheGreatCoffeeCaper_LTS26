if (parent.state = SPARK_STATE_ATTACK)
{
	if (cur_len < wall_length)
	{
		var _dist_check = true;
		
		if (cur_len > 1)
		{
			if (point_distance(bulletwall_id[cur_len - 1].x, bulletwall_id[cur_len - 1].y, parent.x, parent.y) < 10)
				_dist_check = false;
		}
		
		if (_dist_check)
		{
			bulletwall_id[cur_len] = instance_create_depth(x, y, depth, Ospark_bulletwall);
			bulletwall_id[cur_len].direction = direction;
			bulletwall_id[cur_len].parent = parent;
			if (cur_len < wall_length){ cur_len++; }
		}
	} else {
		parent.attack_again = true;	
		parent.pt_dir = -1;
		parent.bubbled = false;	
		instance_destroy();
	}
}


//show_debug_message("CUR LEN: " + string(cur_len));
//show_debug_message("WALL LEN: " + string(wall_length));

















