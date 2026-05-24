with (Opushblock)
{
	var _goal = instance_place(x, y, Opushblock_goal);
	
	if (instance_exists(_goal) && target_x = _goal.x && target_y = _goal.y && !_goal.goaled)
	{
		//play puzzle solved sfx
		if (!audio_is_playing(snd_puzzlesolved))
			play_sfx(snd_puzzlesolved);
		
		_goal.effect();
		
		if (instance_exists(_goal)){ _goal.goaled = true; } //need this for if there are 2 goals and upon reaching one, we destroy both.
	}
}






















