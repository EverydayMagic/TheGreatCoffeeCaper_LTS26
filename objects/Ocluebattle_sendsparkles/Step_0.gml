if (moving = false)
{
	play_sfx(snd_sparkle);
	if (instance_exists(Ocluebattle_cluereward) && Ocluebattle_cluereward.beat < 1)
	{
		with (Ocluebattle_sparkmeter)
		{
			brownwheel_index++;
			if ((array_length(brownwheel_values) - 1) >= brownwheel_index)
			{
				brownwheel_value = brownwheel_values[brownwheel_index];
			}
		}
		instance_destroy();
	} else {
		Ocluebattle_cluereward.image_index += (Ocluebattle_cluereward.image_number - 1)/FRAME_RATE;
		instance_destroy();	
	}
}


depth = Ocluebattle_cluereward.depth - 1;












