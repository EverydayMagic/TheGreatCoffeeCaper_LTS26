if (!visible)
{ 
	percent = 0;
	alph = 0;
	y =  (144 + (sprite_get_height(sprite_index)/2)) * 2;
	exit; 
}

//show_debug_message("letter x: " + string(x) + " letter y: " + string(y));
//show_debug_message("letter height: " + string(sprite_get_height(sprite_index)));

if (percent < 1)
{
	percent += 1/FRAME_RATE;

	position = animcurve_channel_evaluate(anim_curve, percent);

	y = starty + (dist * position);
	
	//gray alpha
	if (alph < 0.5){ alph += 0.5/15; }
} else {
	
	if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("X"))){ visible = false; }
	
}

















