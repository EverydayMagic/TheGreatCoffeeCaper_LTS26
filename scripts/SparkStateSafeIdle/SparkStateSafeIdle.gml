function SparkStateSafeIdle(){
	safe = true;
	running_away = false;
	emotion = "normal";
	moving = false;
	opening = false;
	
	if (being_attacked)
	{
		alarm[2] = -1;
		state = SparkStateBounce;
		exit;
	}
	
	//idle for 2 seconds
	if (alarm[2] = -1)
		alarm[2] = 60;
	
}