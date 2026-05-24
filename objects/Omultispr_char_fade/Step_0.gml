if (array_length(char) > 0 && draw_count = -1)
{
	alarm[0] = frequency;
	draw_count = 0;
} else if (array_length(char) <= 0) {
	exit;	
}

//fade out stuff
for (var i = 0; i < array_length(char); i++)
{
	for (var dc = 0; dc < draw_count; dc++)
	{
		if (char_spr_alph[i][dc] > 0)
			char_spr_alph[i][dc] -= 1/fade_time;	
	}
}

if (draw_count >= (total_time/frequency))
{
	alarm[0] = -1;
	
	var _alph_check = 0;
	for (var i = 0; i < array_length(char); i++)
	{
		for (var dc = 0; dc < draw_count; dc++)
		{
			if (char_spr_alph[i][dc] <= 0)
				_alph_check++;
		}
	}
	
	if (_alph_check = draw_count){ instance_destroy(); }
}









