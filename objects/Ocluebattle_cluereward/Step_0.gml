if (Ocluehunt.trans_to_battle)
{
	visible = false;
	exit;
} else visible = true;


//determine sprite
clue = Ocluebattle_manager.item;

sprite_index = clue.battle_sprite_fill;


//show_debug_message("CLUE DEPTH: " + string(depth));

if (instance_exists(Ocluebattle_sendsparkles)) {
	//show_debug_message("SPARKLE DEPTH: " + string(Ocluebattle_sendsparkles.depth));
}

//winning battle beating

if (global.battle_lock = true && (global.battle_result = true))
{
	switch (beat)
	{
		//close in iris
		case 0:
			beating = true;
			if (radius > 44)
			{
				if (!audio_is_playing(snd_iris_exiting))
				{
					play_sfx(snd_iris_exiting);	
				}
				
				radius -= 16;
			} else {
				if (Ocluebattle_sparkmeter.brownwheel_value <= 125)
				{
					if (!time_source_exists(beat_time))
					{
						beat_time = time_source_create(time_source_global, 0.5, time_source_units_seconds, function(){
							beat++;
							time_source_destroy(beat_time);
						});
						if (time_source_get_state(beat_time) != time_source_state_active) time_source_start(beat_time);
					} else {
						if (time_source_get_state(beat_time) != time_source_state_active) time_source_start(beat_time);
					}
				}
			}
		break;
		//move sparkles
		case 1:
			if (Ocluebattle_sparkmeter.brownwheel_value < 270)
			{
				Ocluebattle_sparkmeter.brownwheel_value += 145/FRAME_RATE;
				if (array_length(sendspark_x) <= 0)
					make_arc_points(158, 117, 133, 141, 4, 15, sendspark_x, sendspark_y, Ocluebattle_cluereward);
					
				var _ssparkx = sendspark_x[sendspark_index];
				var _ssparky = sendspark_y[sendspark_index];
				with (instance_create_depth(_ssparkx * 2, _ssparky * 2, depth - 1, Ocluebattle_sendsparkles))
					spd = 4;
				sendspark_index++;
				depth = Ocluebattle_sendsparkles.depth + 1;
			} else {
				image_index = image_number - 1;
				if (!time_source_exists(beat_time))
				{
					beat_time = time_source_create(time_source_global, 1, time_source_units_seconds, function(){
						beat++;
						time_source_destroy(beat_time);
					});
					if (time_source_get_state(beat_time) != time_source_state_active) time_source_start(beat_time);
				} else {
					if (time_source_get_state(beat_time) != time_source_state_active) time_source_start(beat_time);
				}
			}
		break;
		//move to center
		case 2:			
			//iris move
			if (_x > (room_width/2) || _y > (room_height/2))
			{
				radius += (30)/(15/3);
				_x -= _x_dist/(15/3);
				_y -= _y_dist/(15/3);
				
				x -= x_dist/(15/3);
				y -= y_dist/(15/3);
				image_xscale += 10/(15/3);
				image_yscale += 10/(15/3);
				
				//move other ui elements
				var _ui_obj = [Ocluebattle_sparkmeter, Ocluebattle_brownbar, Ocluebattle_timer, Ocluebattle_healthbar, Ocluebattle_mglass_icon];
				for (var i = 0; i < array_length(_ui_obj); i++)
				{
					with (_ui_obj[i])
						y += 64/(15/3);
				}
				
			} else beat++;
		break;
		//triangles rotate and big text
		case 3:
			//triangle rotate
			tri_rot += 360/(FRAME_RATE * 7);
			
			//move title in place
			if (bigtext_y < 2)
			{
				bigtext_y += 2;
			} else {
				if (bigtext_xscale < 1.2)
				{
					if (bigtext_xscale + 0.4 < 1.2)
					{
						bigtext_xscale += 0.4;
						bigtext_yscale += 0.4;
					} else {
						bigtext_xscale = 1.2;
						bigtext_yscale = 1.2;
					}
				} else beat++;
			}
			
		break;
		
		case 4:
			//triangle rotate
			tri_rot += 360/(FRAME_RATE * 7);
		
			//clue description typing
			if (type_timer <= 0)
			{
				if (string_length(clue_desc_type) < string_length(clue.description))
				{
					var _letter = string_char_at(clue.description, char + 1);
					clue_desc_type += _letter;
					
					//typing noise
					play_sfx(default_voice);
				}
				type_timer = type_speed;
				char++;
			} else {
				type_timer--;	
			}
		
			//skipping text typing
			if (keyboard_check_pressed(ord("X")) && (string_length(clue_desc_type) < string_length(clue.description)))
				clue_desc_type = clue.description;
			
			//after done typing
			if (string_length(clue_desc_type) >= string_length(clue.description))
			{
				//arrow animating
				arrow_index+= (6/30);
			
				//moving on
				if (keyboard_check_pressed(ord("Z")))
					beat++;
			}
		break;
		
		case 5:
			//triangle rotate
			tri_rot += 360/(FRAME_RATE * 7);
		break;
		
	}	
}
//show_debug_message("reward beat: " + string(beat));













