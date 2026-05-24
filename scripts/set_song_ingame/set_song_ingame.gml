
function set_song_ingame(_song, _fadeOutCurrentSong = 0, _fadeIn = 0, _startTime = 0, _loop = true, _songAfterPlay = noone, _crossFade = false, _linkedStart = false, _saveOldTime = false, _useOldTime = false){

	//_song = set to any song (including "noone" to stop or fade the track out)
	//_fadeOutCurrentSong = time (in frames) the current song (if playing) will take to fade out
	//_fadeIn = time (in frames) the target song (if not "noone") will take to fade in
	
	//create audio stream
	if (_song != noone)
	{
		if (is_string(_song))
		{
			var _aud_string = working_directory + "/Music/" + _song;
			if (_aud_string = Oaudio_manager.songAssetString){ exit; }
			var _aud = audio_create_stream(_aud_string);
		} else {
			if (_song = Oaudio_manager.songInstance){ exit; }	
		}
		
	}

	with (Oaudio_manager)
	{
		//connect the Indoor and Overworld Music
		if (_linkedStart)
		{
			_startTime = songStopwatch;	
		}
		if (_saveOldTime){ oldStopwatch = songStopwatch; }
		if (_useOldTime){ _startTime = oldStopwatch; oldStopwatch = 0; }
		if (_startTime = 0 && !_linkedStart){ songStopwatch = 0; }
		
		if (_song != noone && is_string(_song))
		{
			oldSongAssetString_justsong = songAssetString_justsong;
			songAssetString_justsong = _song;
			targetSongAsset = _aud;
			songAssetString = _aud_string;
		} else {
			targetSongAsset = _song;
			songAssetString = _song;
		}
		oldSongInstance = songInstance;
		endFadeOutTime = _fadeOutCurrentSong;
		startFadeInTime = _fadeIn;
		songStartTime = _startTime;
		songLoop = _loop;
		if (!songLoop){ songAfterPlay = _songAfterPlay; }
		crossFade = _crossFade;
		oldSongPitch = songPitch;
		songPitch = 1;
	}
	
}
