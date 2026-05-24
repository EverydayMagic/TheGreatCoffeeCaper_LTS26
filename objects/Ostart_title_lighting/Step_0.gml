switch (beat)
{
	case 0:
		//sound effects
		if (!audio_is_playing(snd_lightningblast))
		{
			play_sfx(snd_lightningblast);	
		}
		
		beat_time_length = 0.1;
		if (!time_source_exists(beat_time))
		{
			beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
					beat++;
					time_source_destroy(beat_time);
			});	
		}
		if (time_source_get_state(beat_time) != time_source_state_active)
			time_source_reset(beat_time);
		time_source_start(beat_time);
	break;
	case 1:
		beat_time_length = 0.1;
		if (!time_source_exists(beat_time))
		{
			beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
					beat++;
					time_source_destroy(beat_time);
			});	
		}
		if (time_source_get_state(beat_time) != time_source_state_active)
			time_source_reset(beat_time);	
		time_source_start(beat_time);
	break;
	case 2:
		beat_time_length = 0.1;
		if (!time_source_exists(beat_time))
		{
			beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
					beat++;
					time_source_destroy(beat_time);
			});	
		}
		if (time_source_get_state(beat_time) != time_source_state_active)
			time_source_reset(beat_time);	
		time_source_start(beat_time);
	break;
	case 3:
		beat_time_length = 0.1;
		if (!time_source_exists(beat_time))
		{
			beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
					beat++;
					time_source_destroy(beat_time);
			});	
		}
		if (time_source_get_state(beat_time) != time_source_state_active)
			time_source_reset(beat_time);	
		time_source_start(beat_time);
	break;
	case 4:
		beat_time_length = 0.1;
		if (!time_source_exists(beat_time))
		{
			beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
					beat++;
					time_source_destroy(beat_time);
			});	
		}
		if (time_source_get_state(beat_time) != time_source_state_active)
			time_source_reset(beat_time);	
		time_source_start(beat_time);
	break;
	case 5:
		beat_time_length = 3;
		if (!time_source_exists(beat_time))
		{
			beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
					beat++;
					time_source_destroy(beat_time);
			});	
		}
		if (time_source_get_state(beat_time) != time_source_state_active)
			time_source_reset(beat_time);	
		time_source_start(beat_time);
	break;
	case 6:
		if (txt_alph < 1)
		{
			txt_alph += 1/15;
		} else {
			
			beat_time_length = 2;
			if (!time_source_exists(beat_time))
			{
				beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
						beat++;
						time_source_destroy(beat_time);
				});	
			}
			if (time_source_get_state(beat_time) != time_source_state_active)
				time_source_reset(beat_time);	
			time_source_start(beat_time);
		}
	break;
}

if (instance_exists(Ofade))
	depth = Ofade.depth + 1;









