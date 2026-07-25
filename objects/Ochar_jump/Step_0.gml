//fill y-values variables
if (array_length(char) <= 0){ exit; }

if ((array_length(endy) > 0) && array_length(dist) <= 0)
{
	for (var i = 0; i < array_length(char); i++)
	{
		starty[i] = char[i].y;
		dist[i] = endy[i] - starty[i];
	}
	
	//char swap index starter
	if (array_length(char_spr_swap) > 0)
	{
		for (var _char = 0; _char < array_length(char_spr_swap); _char++)
		{
			char_spr_swap_index[_char] = 0;
		}
	}
}

if (array_length(dist) > 0)
{
	if (!swap)
	{
		if (percent < 1)
		{
			percent += 1/(time/2);
			
		} else {
			swap = true;
			anim_curve = animcurve_get_channel(charjump_animcurve, "jump_down");
			percent = 0;
			
			//get new variables
			for (var i = 0; i < array_length(char); i++)
			{
				endy[i] = starty[i];
				starty[i] = char[i].y;
				dist[i] = endy[i] - starty[i];
			}
			
			if (fade_bubble)
			{
				for (var b = 0; b < array_length(char); b++)
				{
					var _char = char[b];
					with (instance_create_depth(0, 0, 0, Obubble))
					{
						char_track = _char;
						bubble_type = 5;
						up_fade = true;	
						up_fade_time = 5;
					}
				}
			}
		}
	} else {
		if (percent < 1)
		{
			percent += 1/(time/2);
		} else {
			//jump complete
			if (!cut_dontadd){ add_move_order(); }
			if (!infin)
			{
				instance_destroy();
				exit;
			} else {
				if (wait_time <= 0)
				{
					next_jump();
				} else {
					if (alarm[0] = -1)
						alarm[0] = wait_time;	
				}
			}
		}	
	}
	
	position = animcurve_channel_evaluate(anim_curve, percent);
	
	for (var i = 0; i < array_length(char); i++)
	{
		char[i].y = starty[i] + (dist[i] * position);	
	}
}


















