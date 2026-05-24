function SparkStateTired(){
	attacking = false;
	opening = false;
	moving = false;
	running_away = false;
	runaway_attack = false;
	atk_chosen = 0;
	
	image_speed = 0;
	image_index = 0;
	
	//battle tutorial
	if (global.battleTutorial[5] = true)
	{
		if (alarm[6] = -1)
			alarm[6] = 15; //battle tutorial after 1/2 sec	
	}
	
	if (being_attacked)
	{
		old_state = state;
		state = SparkStateBeingAttacked;
		exit;
	}
	
	if (alarm[1] = -1)
	{
		emotion = "tired";
		if (old_state != SPARK_STATE_BEINGATTACKED)
		{
			alarm[1] = (stamina_recovery * FRAME_RATE);	
		} else {
			state = SparkStateRunAway;
			
			//sound effects
			play_sfx(snd_sparkflee);
		}
	}
	

}