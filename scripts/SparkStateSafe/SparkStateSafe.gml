function SparkStateSafe(){
	safe = true;
	running_away = false;
	emotion = "normal";
	moving = false;
	opening = false;
	atk_chosen = 0;
	
	if (being_attacked = false)
	{
		if (attacking = false)//we don't want to start the attacking process if we are already attacking
		{
			//determine if we are attacking or something else
				sprite_index = body;
				var _dice_roll = irandom(20);
				if (_dice_roll >= min_dice_atk) attacking = true;
			
				if (attacking)
				{
					old_state = SparkStateSafe;
					state = SparkStateAttack; 
				} else {
					//see if we should sleep or just stay
					if (instance_number(Ospark_enemy) > 1)
					{
						var _sleep_count = 0;
						//if half of the enemies are sleeping, we will not sleep
						with (Ospark_enemy)
						{
							if (state = SPARK_STATE_SLEEP)
							{
								_sleep_count++;	
							}
						}
						
						if (_sleep_count >= floor(instance_number(Ospark_enemy)/2))
						{
							//stay still
							state = SparkStateAttack;
						} else {
							//sleep
							state = SparkStateAttack;
						}
					}
				}
		}
			
	} else {
		
		state = SparkStateBounce;
	}
	
}