function set_song_pitch(_pitch = 1){
	with (Oaudio_manager)
	{
		oldSongPitch = songPitch;
		songPitch = _pitch;
		audio_sound_pitch(songInstance, songPitch);
	}
}