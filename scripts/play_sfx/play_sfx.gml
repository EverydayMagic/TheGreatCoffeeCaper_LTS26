function play_sfx(_sound_id, _vol_mod = 1, _pitch = 1, _loop = false){
	
	if (audio_exists(_sound_id))
	{
	
		if (audio_is_playing(_sound_id))
		{
			audio_stop_sound(_sound_id);	
		}
		
		audio_play_sound(_sound_id, 9, _loop, _vol_mod * global.settings.volume, 0, _pitch);
		
		return true;
	
	} else {
		return false;
	}
}