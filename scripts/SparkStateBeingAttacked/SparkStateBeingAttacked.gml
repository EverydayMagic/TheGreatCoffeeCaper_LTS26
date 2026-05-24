function SparkStateBeingAttacked(){
	
	running_away = false;
	safe = false;
	attacking = false;
	moving = false;
	emotion = "scared";
	opening = false;
	runaway_attack = false;
	
	if (being_attacked)
	{
		sprite_index = body;
		face_dir = 0;
		//face = Sspark_twinkle_scaredface;
		
		alarm[4] = 1;
		
	} else {
		if (cur_hp > 0)
		{
			if (old_state != -1)
			{
				image_speed = 0;
				alarm[4] = -1;
				state = old_state;
				if (old_state = SPARK_STATE_TIRED)
					state = SparkStateOpen;
				old_state = -1;
			}
		}
		
	}
	
}