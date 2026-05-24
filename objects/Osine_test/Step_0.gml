curve_step++;

//y += cosine_between(curve_step, 30, -0.25, 1);

//curve_speed = cosine_between(curve_step, 30, 0, 1);

//curve_speed = sin_oscillate(-0.2, 1, 1.5, steps_to_microseconds(curve_step));
//sine_between(curve_step, 45, 0.5, 0);

//x = sine_between(curve_step, 30, start_x - spread, start_x + spread); 

if (x < target_x)
{
	x = sine_wave(curve_step, (target_x - start_x) * 2, spread, mid_x);
	
	//curve_speed = sine_between(curve_step, 30, 0.5, 1);
	
	y = sine_wave(curve_step, (target_x - start_x) * 2, spread, mid_hump_y, -1);
}

//x = cos_oscillate(start_x - spread, start_x + spread, 3, steps_to_microseconds(curve_step));

array_push(xpos_array, x);
array_push(ypos_array, y);

if (y > room_height)
{
	x = start_x;
	y = start_y;
	
	curve_step = 0;

	curve_speed = 0.5;
	
	xpos_array = [];
	ypos_array = [];
}
















