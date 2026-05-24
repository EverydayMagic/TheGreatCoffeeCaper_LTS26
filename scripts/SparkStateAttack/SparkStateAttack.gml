function SparkStateAttack(){
	
	if (being_attacked)
	{
		alarm[0] = -1;
		if (old_state = SPARK_STATE_SAFE)
		{
			state = SparkStateBounce;	
		} else {
			old_state = SparkStateOpen;
			if (running_away)
			{				
				state = SparkStateRunAway;
				//prepare path
					path_delete(path);
					path = path_add();
				//resume run away path
					mp_grid_path(Ocluebattle_manager.clue_battle_grid, path, x, y, target_x, target_y, true);
					path_start(path, spd * 1.5, path_action_stop, true);
			}
		}
		exit;
	}
	
	moving = false;
	body = Spixel;
	
	if (running_away){ moving = true; }
	
	//choose the attack to perform
	///////////////////////////////////////////////////////////////////////////////////////
	//This will determine what bullets are shot (obviously) and what bubbled face is made//
	///////////////////////////////////////////////////////////////////////////////////////
		if (atk_chosen = 0)
		{
		
			//getting our dice roll (imagine it as getting cash to spend on an atk)
				var _dice = irandom(20);
				if (old_state = SPARK_STATE_RUNAWAY){ _dice = clamp(_dice, 0, 10); }
				
				var _atk_list = [];
				
				//Default Attack goes first
				var _atk = {
					name: "DefaultPew",
					roll_req: 0,
					wind_up: 0,
					wait_time: 5,
					bubble_time: default_bubble_time,
					bullet_max: default_bullet_max,
					bubble_spr: asset_get_index(("Sspark_body_bubblemouth_" + string(class))),
					atk_spr: asset_get_index(("Sspark_body_spit_" + string(class))),		
				}
				array_push(_atk_list, _atk);
				
				switch (class)
				{
					case "normal":
						#region attack list
							var _atk = {
								name: "FastPew",
								roll_req: 5,
								wind_up: 20,
								wait_time: 5,
								bubble_time: 5,
								bullet_max: 6,
								bubble_spr: Sspark_body_bubblemouth_normal_fastpew,
								atk_spr: Sspark_body_spit_normal
							}
							array_push(_atk_list, _atk);
							//var _atk = {
							//	name: "SpawnFlick",
							//	roll_req: 16,
							//	wind_up: 0,
							//	bubble_time: 25,
							//	bullet_max: 1,
							//	bubble_spr: Sspark_body_bubblemouth_normal,
							//	atk_spr: Sspark_body_spit_normal
							//}
							//if ((instance_number(Ospark_flick) + 1) <= 2)
							//	array_push(_atk_list, _atk);
						#endregion
				
					break;
		
					case "hard":
						#region
							var _atk = {
								name: "BounceBullet",
								roll_req: 10,
								wind_up: 15,
								wait_time: 5,
								bubble_time: 15,
								bullet_max: 2,
								bubble_spr: Sspark_body_bubblemouth_hard,
								atk_spr: Sspark_body_spit_hard
							}
							array_push(_atk_list, _atk);
							
							//var _atk = {
							//	name: "BulletWall",
							//	roll_req: 15,
							//	wind_up: 15,
							//	bubble_time: 30,
							//	bullet_max: choose(2, 3),
							//	bubble_spr: Sspark_body_bubblemouth_hard,
							//	atk_spr: Sspark_body_spit_hard
							//}
							//array_push(_atk_list, _atk);
						#endregion
					break;
		
					case "realhard":
						#region
							var _atk = {
								name: "BombRain",
								roll_req: 10,
								wind_up: 30,
								wait_time: 5,
								bubble_time: 10,
								bullet_max: 3,
								bubble_spr: Sspark_body_bubblemouth_realhard_bombrain,
								atk_spr: Sspark_body_spit_realhard
							}
							array_push(_atk_list, _atk);
							
							var _atk = {
								name: "MineRain",
								roll_req: 15,
								wind_up: 45,
								wait_time: 5,
								bubble_time: 15,
								bullet_max: 2,
								bubble_spr: Sspark_body_bubblemouth_realhard_bombrain,
								atk_spr: Sspark_body_spit_realhard
							}
							array_push(_atk_list, _atk);
						#endregion
					break;
				}
		
			//choosing atk
			for (var i = 0; i < array_length(_atk_list); i++)
			{
				if ((_atk_list[i].roll_req <= _dice))
				{
					if ((i + 1) < array_length(_atk_list))
					{
						if (_dice < _atk_list[i + 1].roll_req)
						{
							atk_chosen = _atk_list[i];
							break;
						}
					} else {
						atk_chosen = _atk_list[i];
						break;
					}
				} else {
					atk_chosen = _atk_list[(array_length(_atk_list) - 1)]; //default pew	
				}
			}
			
			
			//change certain stats based on when the attack is being called
				if (running_away)
				{
					atk_chosen.bullet_max = round(atk_chosen.bullet_max * (2/3));
					emotion = "scared";
				}
	
		}
		
	//Switching Sprites
		face_color = c_white;
		//if we haven't yet attacked, we need to bubble
			if (!bubbled && atk_chosen.bubble_time > 0)
			{
				face = atk_chosen.bubble_spr;
				if (alarm[0] = -1)
				{
					if (atk_chosen.wind_up = 0)
					{
						alarm[0] = atk_chosen.bubble_time;
					} else alarm[0] = atk_chosen.wind_up;
				}
	
			} else { //switch to the spit/attack sprite
				face = atk_chosen.atk_spr;
			}	
		
		//determine direction we should attack
			if (pt_dir = -1) pt_dir = point_direction(x, y, Omglass.x, Omglass.y);	
		
		//change image index based on direction mglass is
			face_dir = round(pt_dir/45);
			if (atk_chosen.name = "MineRain")
			{
				face_dir = 1;
				pt_dir = 1;
			}
	
	//if we need more bullets and we've already wound up
	if (bullets_shot < atk_chosen.bullet_max && bubbled)
	{
		//has it been enough time between bullets?
		if (next_bullet)
		{
			spark_attack(atk_chosen, self.id);
			next_bullet = false;
			bullets_shot++;
			bubbled = false;
			pt_dir = -1;
		} else {
			if (alarm[7] = -1){ alarm[7] = atk_chosen.wait_time; }
		}
	} else {
		if (bullets_shot >= atk_chosen.bullet_max)
		{
			//attack over
			//start timer to wait till we do anything else
				if (time_source_exists(wait_after_attack) && time_source_get_state(wait_after_attack) != time_source_state_active)
				{ 
					time_source_reset(wait_after_attack); 
					time_source_start(wait_after_attack);
					
					if (running_away)
					{				
						old_state = state;
						state = SparkStateRunCheck;
						////prepare path
						//	path_delete(path);
						//	path = path_add();
						////resume run away path
						//	mp_grid_path(Ocluebattle_manager.clue_battle_grid, path, x, y, target_x, target_y, true);
						//	path_start(path, spd * 1.5, path_action_stop, true);
					} else {
						state = SparkStateSafe;
					}
						
				}
		}
	}
	
}