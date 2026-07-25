if (!surface_exists(surface)){
	surface = surface_create(GUI_W, GUI_H);
}

surface_set_target(surface); {
	
	var _player = Oplayer;
	if (!instance_exists(Oplayer) && instance_exists(Ohoots_cutscene) && Ohoots_cutscene.visible){ _player = Ohoots_cutscene; }
	if (!instance_exists(Oplayer) && instance_exists(Ohoots_cutscene) && !Ohoots_cutscene.visible && instance_exists(Otrojandeer)){ _player = Otrojandeer; }
	if (!instance_exists(Oplayer) && !instance_exists(Ohoots_cutscene) && instance_exists(Otrojandeer)){ _player = Otrojandeer; }
	
	if (!instance_exists(_player))
	{
		x = room_x_to_gui(room_width/2);
		y = room_y_to_gui(room_height/2);	
	} else {
		x = room_x_to_gui(_player.x);
		y = room_y_to_gui(_player.y);		
	}
	
	draw_clear(darkbrown_col);
	gpu_set_blendmode(bm_subtract);
	draw_circle(x, y, radius, false);
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
}

draw_surface(surface, 0, 0);