songInstance = [];
songAssetString = noone;

songStopwatch = 0; //used for final countdowns

function create_battlesong(_song, _loop = false) {
	
	//create audio stream
	if (_song != noone)
	{
		if (is_string(_song))
		{
			var _aud_string = working_directory + "/Music/" + _song;
			if (_aud_string = songAssetString){ exit; }
			var _aud = audio_create_stream(_aud_string);
		}
		
	}
	
	var _data = {
		audio: _aud,
		loop: _loop,
		str: _aud_string,
	}
	array_push(songInstance, _data);
}


















