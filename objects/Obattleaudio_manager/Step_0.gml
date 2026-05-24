//starting song
/*
if (!Ocluebattle_manager.battle_started && !Ocluehunt.trans_to_battle)
{
	//stop intro beat
	if (audio_is_playing(snd_battletimercountdown))
	{
		audio_stop_sound(snd_battletimercountdown);	
	}
	//start regular battle music
	if (Ocluebattle_manager.item = global.item_list.detective_hat) //just one spark
	{
		create_battlesong("Just One Spark (No Final Countdown).ogg", true);
		
	} else {
		//regular battles
		var _bsong = "Primary Battle Theme (0-30s).ogg";
		//make sure it isn't boss battle
		switch(Ocluebattle_manager.item)
		{
			case global.item_list.hammer:
				_bsong = "BigSparkBoss.ogg";
			break;
		}
		create_battlesong(_bsong);
		
	}	
	
	//if JOS, play reverse cymbol too
	if (Ocluebattle_manager.item = global.item_list.detective_hat) 
	{
		play_sfx(snd_revcymbal);
	}
	
	var _bossnoplay = false;
	
	switch (Ocluebattle_manager.item)
	{
		case global.item_list.hammer:
			_bossnoplay = true;
		break;
	}
	
	if (!_bossnoplay)
		audio_play_sound(songInstance[0].audio, 4, songInstance[0].loop, global.settings.volume);
}

if (Ocluebattle_timer.time_elapsed < (Ocluebattle_timer.time_before_finalcount) && array_length(songInstance) = 1)
{
	//if we're in a boss battle
	switch (Ocluebattle_manager.item)
	{
		case global.item_list.hammer:
			if (!Ocluehunt.bigsparkboss_intro)
			{
				if (!audio_is_playing(songInstance[0].audio))
				{
					audio_play_sound(songInstance[0].audio, 4, songInstance[0].loop, global.settings.volume);
				}
			}
		break;
	}
}


//Final Countdowns
if (Ocluebattle_manager.battle_started && global.battle_result < 0 && !Omglass.boss_battle)
{
	if (Ocluebattle_timer.time_elapsed >= (Ocluebattle_timer.time_before_finalcount) && array_length(songInstance) = 1)
	{
		if (Ocluebattle_manager.item = global.item_list.detective_hat)//JOS Final Countdown
		{
			create_battlesong("Just One Spark - Final Countdown.ogg");
			
		} else {
			//regular battles
			if (Ocluebattle_manager.item != global.item_list.hammer)
			{
				create_battlesong("Primary Battle Theme - Final Countdown.ogg");
			}
		}
		
		//if JOS, play reverse cymbol too
		if (Ocluebattle_manager.item = global.item_list.detective_hat) 
		{
			play_sfx(snd_revcymbal);
		}
		
		//play the final countdown
		if (Ocluebattle_manager.item != global.item_list.hammer)
		{
			audio_play_sound(songInstance[1].audio, 4, songInstance[1].loop, global.settings.volume);
		}
		
	}
	
	//end JOS when it's time
	if (array_length(songInstance) > 1)
	{
		songStopwatch += 1/FRAME_RATE;
		
		if (songStopwatch >= 1)
		{
			audio_stop_sound(songInstance[0].audio);	
		}
	}
	
}


if (global.battle_result = 0 || global.battle_result = 2)
{
	if (array_length(songInstance) > 0)
	{
		audio_stop_sound(songInstance[(array_length(songInstance) - 1)].audio);
		for (var i = 0; i < array_length(songInstance); i++)
		{
			audio_destroy_stream(songInstance[i].audio);
		}
		songInstance = [];
	}
}


//winning battle song
if (global.battle_result = 1)
{
	if ((Ocluebattle_cluereward.beat = 2) && (array_length(songInstance) <= 0))
	{
		create_battlesong("Fanfare.ogg");
		songStopwatch = 0;
		
		audio_play_sound(songInstance[0].audio, 4, songInstance[0].loop, global.settings.volume);
	} else {
		if ((Ocluebattle_cluereward.beat < 2) && (array_length(songInstance) > 0))
		{
			audio_stop_sound(songInstance[(array_length(songInstance) - 1)].audio);
			for (var i = 0; i < array_length(songInstance); i++)
			{
				audio_destroy_stream(songInstance[i].audio);
			}
			songInstance = [];
		}
	}
	
	if (array_length(songInstance) = 1)
	{
		songStopwatch += 1/FRAME_RATE;
		
		if (songStopwatch >= audio_sound_length(songInstance[0].audio))
		{
			//switch to fanfare loop
			create_battlesong("Fanfare (Loop).ogg", true);
			
			audio_play_sound(songInstance[1].audio, 4, songInstance[1].loop, global.settings.volume);
		}
	}
}

//show_debug_message("watch: " + string(songStopwatch));
//if (array_length(songInstance) > 0)
	//show_debug_message("len: " + string(audio_sound_length(songInstance[0].audio)));