//fill y-values variables
if (array_length(char) <= 0){ exit; }

if ((array_length(endy) > 0) && array_length(dist) <= 0)
{
	for (var i = 0; i < array_length(char); i++)
	{
		starty[i] = char[i].y;
		dist[i] = endy[i] - starty[i];
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


















