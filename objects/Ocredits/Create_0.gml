credits_file = file_text_open_read(working_directory + "coffeecaper_credits.txt");
credit_line_str = [];
credit_line_imgindex = [];
credit_line_anim = [];
line_color = [];
line_scale = [];
line_y = [];


for (var i = 0; i < 40; i++)
{
	array_push(credit_line_str, file_text_read_string(credits_file));
	file_text_readln(credits_file);
}
file_text_close(credits_file);

//show_debug_message("CREDITS: \n" + string(credit_line_str));

for (var _line = 0; _line < array_length(credit_line_str); _line++)
{
	credit_line_imgindex[_line] = 0;
	credit_line_anim[_line] = false;
	
	//determine properties
	if (string_char_at(credit_line_str[_line], 0) = "-")
	{
		line_color[_line] = darkbrown_col;	
		line_scale[_line] = 1.5;
	} else if (string_char_at(credit_line_str[_line], 0) != "*") {
		line_color[_line] = #677a5d;
		line_scale[_line] = 1;
	} else {
		line_color[_line] = c_white;	
	}
	
	//find strings
	if (string_char_at(credit_line_str[_line], 0) = "*")
	{
		switch (credit_line_str[_line])
		{
			case "*cclogo*":
				credit_line_str[_line] = Scc_credit_logo;
			break;
			
			case "*cross*":
				credit_line_str[_line] = Scross;
			break;
			
			case "*calebandjacob*":
				credit_line_str[_line] = Scalebandjacob;
			break;
			
			case "*zectro*":
				credit_line_str[_line] = Szectro_idle;
			break;
			
			case "*hootssleep*":
				credit_line_str[_line] = Splayer_capsit_sleep;
				credit_line_anim[_line] = true;
			break;
		}
	}
	
	//get initial y
	var _spr_mod = 16;
	var _last_line = 0;
	if (_line > 0)
	{
		_last_line = line_y[_line - 1];
		if (credit_line_str[_line - 1] = Scc_credit_logo)
			_spr_mod = sprite_get_height(Scc_credit_logo) + 16;
			
		line_y[_line] = _last_line + _spr_mod;
	} else {
		line_y[_line] = room_height + (8 * _line);
	}
	
}

alarm[0] = 3 * FRAME_RATE;