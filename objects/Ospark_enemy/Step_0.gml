depth = Omglass.depth + 2;

check_if_dead();
//if (image_alpha = 0 && cur_hp <= 0){ instance_destroy(); exit; }

if (global.battle_lock && state != SPARK_STATE_LOCKED)
{
	old_state = state;
	path_end();
	state = SparkStateLocked;
}


#region other
	
	//show_debug_message("SPARK DEPTH: " + string(depth));

	if (instance_exists(Ocluehunt)){ visible =! Ocluehunt.trans_to_battle; }
	if (visible = false){ exit; }
	
	//constant updating of values in case we ever change them
	////if they do need to be changed, it'll happen in the state
	reset_stats();
	

	if (instance_number(Ospark_checkcol) < 8){ create_colchecks(); }

	sprite_index = body;

	if place_meeting(x, y, Omglass)
		Omglass.spark_hunting = self.id;
	
	//depth
	depth = -70;
	var _obs = instance_place(x, y, Ocluebattle_obstacle);
	if (instance_exists(_obs))
	{
		if (y <= (_obs.y + sprite_height)){ depth = _obs.depth + 1; }	
	}
	
	
	//face changing
		var _dir = round(direction/45);
		var _face = 0;
	
		if (moving || global.battle_lock) //change face based on direction when moving
		{ 
			face_dir = _dir + 1;
			_face = "Sspark_" + string(emotion) + "face";
			
			if (emotion = "tired")
			{
				face_dir += 3/FRAME_RATE;
				_face = "Sspark_" + string(class) + "_tiredface";
				face_color = c_white;
			}
	
		} else { //change face based on emotion
				switch (emotion)
				{
					case "tired":
						face_dir += 3/FRAME_RATE;
						_face = "Sspark_" + string(class) + "_tiredface";
						face_color = c_white;
					break;
			
					case "sleepy":
						if (face_dir < 3)
							face_dir += 2/FRAME_RATE;
						else
							face_dir = 3;
						_face = "Sspark_sleepyface";
					break;
				
					case "scared":
						_face = "Sspark_scaredface";
					break;
			
					default: 
						face_dir = 0;
						sweat_spd = 0;
						_face = "Sspark_" + string(emotion) + "face";
					break;
				}
		}
	
		face = asset_get_index(_face);
		
		if (state = SPARK_STATE_ATTACK)
		{
			body = Spixel;
			image_speed = 0;
			image_index = 0;
		}
		
	
	//sweat
	sweat_spd += 8/FRAME_RATE;
	
	
#endregion

script_execute(state);

