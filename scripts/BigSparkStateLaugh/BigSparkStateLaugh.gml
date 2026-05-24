function BigSparkStateLaugh(){
	emotion = "laugh";
	
	//laugh sfx
	if (!audio_is_playing(snd_bigsparklaugh)){ play_sfx(snd_bigsparklaugh); }
	
	if (!laughed && alarm[2] = -1)
	{
		alarm[2] = laugh_time;
	} else {
		if (laughed)
		{
			state = laugh_next_state;	
			reset_laugh_vars();
			reset_atk_vars();
			exit;
		}
	}
	
	
}