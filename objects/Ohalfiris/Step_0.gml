if (radius > 0)
{
	//sound effects
	if (!audio_is_playing(snd_iris_exiting)){ play_sfx(snd_iris_exiting); }
			
	if (radius - iris_speed >= 0)
	{
		iris_speed = ispd_const;
		radius -= iris_speed;
	} else {
		radius = 0;
		iris_speed = 0;
	}
} else {
	radius = 0;	
}





















