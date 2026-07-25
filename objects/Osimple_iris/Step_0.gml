if (radius > 0 && !flip)
{
	if (instance_exists(Oplayer)){ Oplayer.state = PlayerStateLocked; }

	if (radius = 220 && !audio_is_playing(snd_iris_exiting)){ play_sfx(snd_iris_exiting); }
	
	radius -= spd;
	radius = clamp(radius, 0, 220);
	
} else {
	
	flip = true;
	
	if (delay > 0)
	{
		delay--;	
	} else {
		
		if (radius = 0 && !audio_is_playing(snd_iris_entering)){ play_sfx(snd_iris_entering); }
		
		if (radius < 220)
		{
			radius += spd;
			radius = clamp(radius, 0, 220);
		} else {
			
			instance_destroy();
		}
	}
}