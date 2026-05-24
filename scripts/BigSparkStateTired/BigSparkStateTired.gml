function BigSparkStateTired(){
	emotion = "tired";
	
	if (place_meeting(x, y, Omglass)){ Omglass.spark_hunting = self.id; }
	
	if (being_attacked)
	{
		state = BigSparkStateBeingAttacked;
		exit;
	}
	
	if (alarm[6] = -1){ alarm[6] = tired_time; }
}