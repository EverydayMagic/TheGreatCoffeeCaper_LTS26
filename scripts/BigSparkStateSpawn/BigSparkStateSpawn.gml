function BigSparkStateSpawn(){
	emotion = "happy";
	
	if (image_angle < 360)
	{	
		if (image_alpha < 1)
			image_alpha += 1/15;
		
		image_angle += 360/FRAME_RATE;
	} else {
		image_alpha = 1;
		image_angle = 0;
		
		state = BigSparkStateIdle;
	}
}