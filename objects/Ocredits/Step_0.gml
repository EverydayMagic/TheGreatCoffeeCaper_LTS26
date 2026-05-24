for (var _line = 0; _line < array_length(credit_line_str); _line++)
{
	//move up
	if (alarm[0] = -1 && line_y[array_length(line_y) - 1] > 115)
	{
		line_y[_line] -= 16/(2 * FRAME_RATE);
	} else {
		if (line_y[array_length(line_y) - 1] <= 115)
			if (alarm[1] = -1 && !instance_exists(Ofade))
				alarm[1] = 3 * FRAME_RATE;
	}
	
	//animate sprite
	if (credit_line_anim[_line] = true)
	{
		credit_line_imgindex[_line] += sprite_get_speed(credit_line_str[_line])/FRAME_RATE;
	}
}

















