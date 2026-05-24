function SparkStateOpen(){
	safe = false;
	running_away = false;
	attacking = false;
	emotion = "normal";
	runaway_attack = false;
	image_index = 0;
	
	//constantly getting the distance from the mglass
	var _dist_mglass = point_distance(x, y, Omglass.x, Omglass.y);
	
	if (_dist_mglass < 32)
	{
		//change state to running away
			runaway_attack = false;
			running_away = false;
			state = SparkStateRunAway;
			
			//sound effects
			play_sfx(snd_sparkflee);
			
	} else {
		
		#region look for safe spot
		
			if (instance_exists(Ocluehunt))
			{
	
				if (!Ocluehunt.trans_to_battle && !global.battle_lock && !opening)
				{
					var _parent = self.id;
					
					//figure out which cool spots are avaliable		
					with (Ocluebattle_obstacle)
					{
						if (!taken)
						{
							array_push(_parent.coolspots_avaliable, self.id);			
						}
					}
		
					//choose a cool spot to go to based on the ones avaliable and their distance
					var _len = array_length(coolspots_avaliable)
					//find distances
					if (_len > 0)
					{
						var _dist_compare = [];
						
						for (var i = 0; i < _len; i++)
						{
							var _dist = point_distance(x, y, coolspots_avaliable[i].x, coolspots_avaliable[i].y);
							array_push(_dist_compare, _dist);
						}
						//compare distances to find shortest
						var _distleast = _dist_compare[0];
						var _id = coolspots_avaliable[0];
						for (var f = 0; f < _len; f++)
						{	
							if (_dist_compare[f] < _distleast)
							{
								_distleast = _dist_compare[f];
								_id = coolspots_avaliable[f];
							}
						}
					
		
						
						path_delete(path);
						path = path_add();

						//where to go
						target_x = _id.x;
						target_y = _id.y;

						//use the mp grid, make a path, ride on it
						if (mp_grid_path(Ocluebattle_manager.clue_battle_grid, path, x, y, target_x, target_y, true) = true)
						{
							//riding
							path_start(path, spd, path_action_stop, true);
							
							moving = true;
							opening = true;
						}
					}
					//erase avaliable cool spots to be refreshed next step
					coolspots_avaliable = [];
				} else {
						
					if (opening)
					{
						//if we are currently there, don't move again
						if (x = target_x && y = target_y){ state = SparkStateSafe;}		
					}
						
				}


			}
		
		#endregion
	}
	
}