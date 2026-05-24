function SparkStateRunCheck(){
	//not at cool spot, done with run away, done with initial attack
	//should we run away to another spot, attack again, be tired, or find a new place to hide?
	
	//if this is our last spot to run away to (regarding stamina), being tired trumps all other options
	if (stamina <= 0)
	{
		state = SparkStateTired;
		exit;
	}
	
	//first, see if we should run
	//see if Spark Glass is close by
	with (Ospark_checkcol)
	{
		if (place_meeting(x, y, Omglass))
		{
			state = SparkStateRunAway;
			exit;
		}
	}
	
	//next, see if we should attack
	var _dice = irandom(20);
	if (_dice > min_dice_atk)
	{
		state = SparkStateAttack;
		exit;
	} else {
		state = SparkStateOpen;
		exit;
	}
	
}