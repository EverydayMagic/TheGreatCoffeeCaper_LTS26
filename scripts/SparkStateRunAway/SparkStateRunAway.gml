function SparkStateRunAway(){
	safe = false;
	attacking = false;
	opening = false;
	atk_chosen = 0;
	
	//battle tutorial
		if (global.battleTutorial[4] = true)
		{
			if (alarm[5] = -1)
				alarm[5] = 10; //run away tutorial
		}
	
	//cannot be attacked while running away
	
	//constantly getting the distance from the mglass
		var _dist_mglass = point_distance(x, y, Omglass.x, Omglass.y);
	
	if (_dist_mglass < 32 || running_away)
	{
	
			if (!running_away)
			{
				var _id = self.id
						
					//prepare path
						if (path_exists(path))
						{
							path_end();
							path_delete(path);
						}
						path = path_add();
						
					//find path point
						array_delete(pathpoints_avaliable[0], 0, array_length(pathpoints_avaliable));
						array_delete(pathpoints_avaliable, 0, array_length(pathpoints_avaliable));
						pathpoints_avaliable[0][0] = 0;
						//find which path points are avalaible
							with (Ospark_pathpoint)
							{
								if (taken = false)
								{
									var _len = array_length(_id.pathpoints_avaliable);
									if (_id.pathpoints_avaliable[0][0] != 0)
									{
										_id.pathpoints_avaliable[_len][0] = self.id;	
									} else _id.pathpoints_avaliable[0][0] = self.id;
								}
							}
						//choose a path point to go to based on the ones avaliable and their distance
							var _len = array_length(pathpoints_avaliable); //this variable needs to be made again because we previously made it inside of the pathpoint object not in this object
						//find distances
						for (var i = 0; i < _len; i++)
						{
							var _dist = point_distance(x, y, pathpoints_avaliable[i][0].x, pathpoints_avaliable[i][0].y);
							pathpoints_avaliable[i][1] = _dist;
						}
						//compare distances to find the top 3 longest
							//find the longest
								var _distmost = 0;
								var _id_most = 0;
								for (var f = 0; f < _len; f++)
								{
									if (pathpoints_avaliable[f][1] > _distmost)
									{
										_distmost = pathpoints_avaliable[f][1];
										_id_most = pathpoints_avaliable[f][0];
									}
								}
							//find the second longest
								var _distsecmost = 0;
								var _id_secmost = 0;
								for (var b = 0; b < _len; b++)
								{
									if (pathpoints_avaliable[b][1] != _distmost)
									{
										if (pathpoints_avaliable[b][1] > _distsecmost)
										{
											_distsecmost = pathpoints_avaliable[b][1];
											_id_secmost = pathpoints_avaliable[b][0];
										}
									}
								}
							//find the third longest
								var _disttrimost = 0;
								var _id_trimost = 0;
								for (var q = 0; q < _len; q++)
								{
									if (pathpoints_avaliable[q][1] != _distmost && pathpoints_avaliable[q][1] != _distsecmost)
									{
										if (pathpoints_avaliable[q][1] > _disttrimost)
										{
											_disttrimost = pathpoints_avaliable[q][1];	
											_id_trimost = pathpoints_avaliable[q][0];
										}
									}
								}
							
						//choose which one to go to based on the spark's stamina
							switch (stamina)
							{
								case 1:
									//set that path point to "taken"
										_id_trimost.taken = true;
										_id_trimost.parent = self.id;
									//where to go
										target_x = _id_trimost.x;
										target_y = _id_trimost.y;
								break;
									
								case 2:
									//set that path point to "taken"
										_id_secmost.taken = true;
										_id_secmost.parent = self.id;
									//where to go
										target_x = _id_secmost.x;
										target_y = _id_secmost.y;
								break;
									
								case 3:
									//set that path point to "taken"
										_id_most.taken = true;
										_id_most.parent = self.id;
									//where to go
										target_x = _id_trimost.x;
										target_y = _id_trimost.y;
								break;
							}
						
		
					//use the mp grid, make a path, ride on it
					if (mp_grid_path(Ocluebattle_manager.clue_battle_grid, path, x, y, target_x, target_y, true))
					{
						//riding
						path_start(path, spd * 1.5, path_action_stop, true);
							
						running_away = true;
						moving = true;
						emotion = "scared";
						image_speed = 1;
					}
						
				} else {
					
					//attack midway through runaway path
					//if (path_position >= 0.5 && !runaway_attack && _dist_mglass <= 48)
					//{
					//	//weak attack
					//	if (old_state != SPARK_STATE_ATTACK)
					//	{
					//		path_end();
					//		image_speed = 0; //stop rotating if we are
					//		old_state = state;
					//		state = SparkStateAttack;
					//		runaway_attack = true;
					//	}
					//}
					
					if (path_position >= 1)
					{
						array_delete(pathpoints_avaliable[0], 0, array_length(pathpoints_avaliable));
						array_delete(pathpoints_avaliable, 0, array_length(pathpoints_avaliable));
						pathpoints_avaliable[0][0] = 0;
						old_state = state;
						state = SparkStateAttack;
						stamina--;
						stamina = clamp(stamina, 0, max_stamina);
					}
					
				}
	
	} else {
		if (!running_away)
		{
			array_delete(pathpoints_avaliable[0], 0, array_length(pathpoints_avaliable));
			array_delete(pathpoints_avaliable, 0, array_length(pathpoints_avaliable));
			pathpoints_avaliable[0][0] = 0;
			state = SparkStateOpen;
		}
		
	}
	
	
}