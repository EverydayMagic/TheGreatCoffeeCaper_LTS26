switch (beat)
{
	
	case 0:
		//storm
		set_song_ingame(snd_stormandwind, 0, 30);
		
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
	break;
	
	case 1:
		if (txt_alpha < 1)
			txt_alpha += fadespd;
		else
			beat++;
	break;
	
	case 2:
		beat_time_length = 1;
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
		if (txt_alpha > 0)
			txt_alpha -= fadespd;
		else { beat++; txt_alpha = 0; }
	break;
	
	case 4:
		//if (txt_alpha < 1)
		//	txt_alpha += fadespd;
		//else
		//	beat++;
		beat++;
	break;
	
	case 5:
		//if (txt_alpha > 0)
		//	txt_alpha -= fadespd;
		//else { beat++; txt_alpha = 0; }
		beat++;
	break;
	case 6:
		//if (time_source_get_state(beat_time) != time_source_state_active)
		//{
		//	time_source_reset(beat_time);
		//	beat_time_length = 1;
		//	time_source_start(beat_time);
		//}
		beat++;
	break;
	case 7:
		if (black_alpha > 0)
			black_alpha -= 0.02;
		else
			beat++;
	break;
	case 8:
		//storm
		set_song_ingame("Prologue_Segment1.ogg", 4 * FRAME_RATE, 4 * FRAME_RATE, 0, true, noone, true);
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
	break;
	case 9:
		if (cofhouse_scale < 6)
		{
			if (cofhouse_scale = 2 && !instance_exists(Ofade))
			{
				with (instance_create_depth(0, 0, -bbox_bottom, Ofade))
				{
					trans_type = "iris";
					newRoom = Rcoffeeshop;
				}
			}
			cofhouse_scale += 0.1;
		}
	break;
	
}


if (instance_exists(Ofade))
	depth = Ofade.depth + 1;





