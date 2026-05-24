function SparkStateBounce(){
	attacking = false;
	emotion = "scared";
	opening = false;
	
	#region bounce into the open
		
		if (instance_exists(Ospark_checkcol))
		{
				
			var _id = self.id
	
			var _safe_array = [];
	
			with (Ospark_checkcol)
			{
				if (parent = _id)//if the collision checks belong to this specific spark
				{
					if (safe_path)//if the collision checks found their path to be "safe"
					{
						//add to array of paths to choose from
						array_push(_safe_array, self.id);
					}
				}
			}
	
			//loop through array to choose a path to travel on
			if (array_length(_safe_array) > 0 && !bouncing)
			{
				var _path_target_id = _safe_array[irandom_range(0, (array_length(_safe_array) - 1))];
		
				//prepare path
				if (path_exists(path)){ path_delete(path); }
				path = path_add();
		
				//where to go
				target_x = _path_target_id.x;
				target_y = _path_target_id.y;
		
				//use the mp grid, make a path, ride on it
				path_set_closed(path, false);
				path_add_point(path, x, y, 100);
				path_add_point(path, target_x, target_y, 100);
				
				//mp_grid_path(Ocluebattle_manager.clue_battle_grid, path, x, y, target_x, target_y, true);

				//riding
				path_start(path, 4, path_action_stop, true);
				moving = true;
				bouncing = true;
					
			}
				
			if (x = target_x && y = target_y)
			{
				bouncing = false;
				old_state = SparkStateOpen;
				running_away = false;
				runaway_attack = false;
				state = SparkStateRunAway;
				
				//sound effects
				play_sfx(snd_sparkflee);
			}
	
		}
			
		
	#endregion
	
}