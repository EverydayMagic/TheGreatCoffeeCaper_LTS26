if (cutscene_override){ exit; }
var _finalVol = global.settings.volume;

//play the target song
if ((songAsset != targetSongAsset))
{
	//set oldSongAsset to later destroy its audio stream 
	oldSongAsset = songAsset;
	
	
	//Tell the old song to fade out
	if (audio_is_playing(songInstance))
	{
		//add our song instance to our array of songs to fade out
		array_push(fadeOutInstances, songInstance);
		//add the songInstance's starting volume (so there's no abrupt change in volume)
		array_push(fadeOutInstanceVol, fadeInInstVol);
		//add the fadeOutInstance's fade out frames
		array_push(fadeOutInstTime, endFadeOutTime);
		
		//reset the songInstance and songAsset variables
		songInstance = noone;
		songAsset = noone;
		//reset stopwatch if song is not supposed to be linked with another
		if (songStartTime = 0){ songStopwatch = 0; }
		songAfterPlay = noone;
	}
	
	//Play the song, if the old song has faded out
	if (array_length(fadeOutInstances) = 0 || crossFade)
	{
		if (audio_exists(targetSongAsset))
		{
			//Play the song and store it's instance in a variable
			songInstance = audio_play_sound(targetSongAsset, 4, songLoop, 1, songStartTime, songPitch);
	
			//Start the song's volume at 0
			audio_sound_gain(songInstance, 0, 0);
			fadeInInstVol = 0;
			
			var _len = audio_sound_length(songInstance);
			
			if (songStopwatch = 0){ alarm[0] = FRAME_RATE * _len; }
	
		}
	
		//Set the songAsset to match the targetSongAsset
		songAsset = targetSongAsset;
		
	}
}

if (audio_is_playing(songInstance))
{ 
	//increase stopwatch
	songStopwatch += (1/FRAME_RATE) * songPitch;
	
}


//volume control
	//Main song volume
	if (audio_is_playing(songInstance))
	{
		//fade the song in
		if (startFadeInTime > 0)
		{
			if (fadeInInstVol < 1){ fadeInInstVol += 1/startFadeInTime; } else { fadeInInstVol = 1; }
		
		} else {
			//Immediatly start song if no fade in
			fadeInInstVol = 1;
			//fadeInInstVol = 0;
		}
	
		//Actually set the gain
		audio_sound_gain(songInstance, fadeInInstVol * _finalVol, 0);
	}
	
	//fading songs out
	for (var i = 0; i < array_length(fadeOutInstances); i++)
	{
		//Fade the volume
		if (fadeOutInstTime[i] > 0)
		{
			if (fadeOutInstanceVol[i] > 0){ fadeOutInstanceVol[i] -= 1/fadeOutInstTime[i]; }	
		} else {
			//Immediately cut volume to 0 otherwise
			fadeOutInstanceVol[i] = 0;
		}
		
		//Actually set the gain
		audio_sound_gain(fadeOutInstances[i], fadeOutInstanceVol[i] * _finalVol, 0);
		
		//Stop the song when volume is at 0 and remove from all arrays
		if (fadeOutInstanceVol[i] <= 0)
		{
			//stop the song
			if (audio_is_playing(fadeOutInstances[i])){ audio_stop_sound(fadeOutInstances[i]); audio_destroy_stream(oldSongAsset); }
			//remove it from arrays
			array_delete(fadeOutInstances, i, 1);
			array_delete(fadeOutInstanceVol, i, 1);
			array_delete(fadeOutInstTime, i, 1);
			audio_destroy_stream(oldSongAsset);
			//set the loop back 1 since we just deleted an entry
			i--;
		}
	}









