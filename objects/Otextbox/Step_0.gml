if (instance_exists(Omenu))
	depth = Omenu.depth - 1;
else	
	depth = -bbox_bottom;

keyInteract = keyboard_check_pressed(ord("Z"));

arrow_ani += (6/30);
if (bubdown = true)
	buby = 0;
else
	buby = 2;


//show_debug_message("DOWN: " + string(down));
//show_debug_message("DOWN: " + string(down));
//show_debug_message("DOWN: " + string(down));
//show_debug_message("DOWN: " + string(down));

//- - - - - - - typing the text - - - - - - - -//
var _settingsmenupause = false;
//show_debug_message("SETTINGSPAUSE: " + string(_settingsmenupause));
if (text_pause_timer <= 0 && !_settingsmenupause) {
    if (draw_char < text_length[page])
    {
		if (txtsnd_change[page] = true)
		{
			snd[page] = snd_change[page];
		}
		
		if (txtspd_change[page] != true){ text_spd[page] = 1; }
		draw_char += text_spd[page];
        draw_char = clamp(draw_char, 0, text_length[page]);
		
		var _check_pause = false;
		if (draw_char mod 1 = 0){ _check_pause = true; }
		
        if (pausing[draw_char, page] && _check_pause) {
			show_debug_message("PAUSE\n" + string(text_pause_time));
			text_pause_timer = text_pause_time[text_pause_count];
			text_pause_count++;
			text_pause_count_onpage[page]--;
			text_pause_count_onpage[page] = clamp(text_pause_count_onpage[page], 0, 99);
			
            if (!audio_is_playing(snd[page])) {
                //audio_stop_sound(snd[page]);
				audio_play_sound(snd[page], 8, false, 1, 0, snd_pitch[page]);
				audio_sound_gain(snd[page], global.settings.volume, 0);//set sound volume
            }
        } else {
			//typing sound	
			if (text_spd[page] <= 0.5) {
				//if slower speed, sound on each individual letter
				draw_char_floor = floor(draw_char);
				if (draw_char_floor > last_char)
				{
					audio_play_sound(snd[page], 8, false, 1, 0, snd_pitch[page]);
					audio_sound_gain(snd[page], global.settings.volume, 0);//set sound volume
					
					last_char = draw_char_floor;	
				}
			} else {
				if (snd_count < snd_delay) {
	                snd_count++;
	            } else {
	                snd_count = 0;
	                audio_play_sound(snd[page], 8, false, 1, 0, snd_pitch[page]);
					audio_sound_gain(snd[page], global.settings.volume, 0);//set sound volume
	            }
			}
        }
    }
} else {
	if (!_settingsmenupause)
		text_pause_timer--;
}
    
    
//- - - - - - - flip through pages - - - - - - - -//
if ((keyInteract && skipping[page] != true && auto_move_input_allowed[page] = true && !_settingsmenupause) || waiting) {
        
    global.textActive = true;    
    
    //if the typing is done
    if (draw_char == text_length[page]) {
		
        //next page
        if (page < page_number - 1) {    
            //loop through current page before moving on
			for (var c = 0; c < text_length[page]; c++)
			{
				//if we were supposed to be pausing on this page, make sure that the variable is caught up
				if (pausing[c, page])
				{
					text_pause_count += text_pause_count_onpage[page];		
				}
			}
			page++;
            draw_char = 0;
        }
        //destroy text box
        else {
            //link text for options
            if (option_number > 0 && !waiting) {
                global.textActive = true;
                create_textbox(option_link_id[option_pos], true, "optioning");    
            }
			if (wait_a_frame <= 0)
			{
				instance_destroy();
				waiting = false;
			} else {
				wait_a_frame--;
				waiting = true;
			}
	        if (option_number == 0)
			{
	            global.textActive = false;
				global.battle_lock = false;
			}
				
        }
    }
}

//if not done typing
if (keyboard_check_pressed(ord("X")) && !_settingsmenupause && auto_move_input_allowed[page] = true) {
    if (draw_char != text_length[page])
	{
        draw_char = text_length[page];
		
		//set sprites if we needed to
		if (talkturn[page] = true)
		{
			for (var ti = 0; ti < talkturn_inst[page]; ti++)
			{
				for (var c = 0; c < array_length(ovr_spr[page][ti]); c++)
				{
					if (is_struct(ovr_spr[page][ti][c]))
					{
						var _ovr_spr = ovr_spr[page][ti][c];

						if (instance_exists(_ovr_spr.obj))
						{
							var f = 1;
							if (_ovr_spr.flip = true){ f = -1; }
							_ovr_spr.obj.sprite_index = _ovr_spr.spr;
							if (_ovr_spr.img_index != -1)
								_ovr_spr.obj.image_index = _ovr_spr.img_index;
							_ovr_spr.obj.image_speed = _ovr_spr.img_spd;
							_ovr_spr.obj.image_xscale = f;
						}
					}
				}
			}
		}
	}
}


//if skipping
if (skipping[page] = true && !_settingsmenupause)
{
	if (draw_char = text_length[page])
	{
		//next page
        if (page < page_number - 1) {    
            page++;
            draw_char = 0;
        }
        //destroy text box
        else {
            //link text for options
            if (option_number > 0) {
                global.textActive = true;
                create_textbox(option_link_id[option_pos]);    
            }
            instance_destroy(); 
            if (option_number == 0)
                global.textActive = false;
        }
	}
}

//if the textbox is automatically moving through the pages
if (auto_move[page] = true && draw_char = text_length[page] && !_settingsmenupause)
{
	if (next_box_time[page] <= 0)
	{
		//next page
	    if (page < page_number - 1) {    
	        page++;
	        draw_char = 0;
	    }
	    //destroy text box
	    else {
	        //link text for options
	        if (option_number > 0) {
	            global.textActive = true;
	            create_textbox(option_link_id[option_pos]);    
	        }
	        instance_destroy();
	        if (option_number == 0)
	            global.textActive = false;
	    }
		
	} else {
		next_box_time[page]--;	
	}
}

//switching speaker overworld sprites
if (talkturn[page] = true)
{

	for (var ti = 0; ti < talkturn_inst[page]; ti++)
	{
		//var r = array_length(ovr_spr[page][ti]);
		if ((draw_char - 1) < array_length(ovr_spr[page][ti]) && ((draw_char - 1) >= 0))
		{
			if (is_struct(ovr_spr[page][ti][draw_char - 1]))
			{
				var _ovr_spr = ovr_spr[page][ti][draw_char - 1];

				if (instance_exists(_ovr_spr.obj))
				{
					var f = 1;
					if (_ovr_spr.flip = true){ f = -1; }
					_ovr_spr.obj.sprite_index = _ovr_spr.spr;
					if (_ovr_spr.img_index != -1)
						_ovr_spr.obj.image_index = _ovr_spr.img_index;
					_ovr_spr.obj.image_speed = _ovr_spr.img_spd;
					_ovr_spr.obj.image_xscale = f;
				}
			}
		}
	}
	
}