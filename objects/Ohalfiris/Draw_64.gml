if (!surface_exists(surface)) {
	surface = surface_create(GUI_W + 1, GUI_H);
}

surface_set_target(surface); {
		
	//Getting X and Y
	if (!instance_exists(Oplayer))
	{
		_x = room_x_to_gui(room_width/2);
		_y = room_y_to_gui(room_height/2);
	} else {
		if (instance_exists(Oplayer))
		{
			_x = room_x_to_gui(Oplayer.x)
			_y = room_x_to_gui(Oplayer.y)
		}
	}

	draw_clear(#390C14);
	//draw_clear(c_white);
	gpu_set_blendmode(bm_subtract);
	draw_circle(_x, _y, radius, false);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}
draw_surface(surface, 0, 0);






















