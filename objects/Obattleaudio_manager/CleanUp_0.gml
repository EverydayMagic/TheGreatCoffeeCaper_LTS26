for (var i = 0; i < array_length(songInstance); i++)
{
	audio_stop_sound(songInstance[i].audio);
	audio_destroy_stream(songInstance[i].audio);
}






















