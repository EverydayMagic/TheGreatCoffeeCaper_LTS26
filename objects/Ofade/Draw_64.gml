if (trans_type = "iris")
{
	if (!surface_exists(surface)) {
	    surface = surface_create(GUI_W + 1, GUI_H);
	}
	surface_set_target(surface); {
		
		var _player = Oplayer;
		if (!instance_exists(Oplayer) && instance_exists(Ohoots_cutscene) && Ohoots_cutscene.visible){ _player = Ohoots_cutscene; }
		if (!instance_exists(Oplayer) && instance_exists(Ohoots_cutscene) && !Ohoots_cutscene.visible && instance_exists(Otrojandeer)){ _player = Otrojandeer; }
		if (!instance_exists(Oplayer) && !instance_exists(Ohoots_cutscene) && instance_exists(Otrojandeer)){ _player = Otrojandeer; }
		
		//Getting X and Y
		if (newRoom = undefined || !instance_exists(_player))
		{
			_x = room_x_to_gui(room_width/2);
			_y = room_y_to_gui(room_height/2);
		} else {
			if (instance_exists(_player))
			{
				_x = room_x_to_gui(_player.x)
				_y = room_x_to_gui(_player.y)
			}
		}
		
		if (newRoom != undefined && room != newRoom && radius = 0 && iris_speed = 0)
		{
			room_goto(newRoom);
			
			if (instance_exists(Ocharliemouse)){ Ocharliemouse.room_vis_check = true; }
		} else if (newRoom = undefined && radius = 0) { 
			load_game();
		}
			
		if (instance_exists(_player) && room = newRoom)
		{
			_player.x = newX;
			_player.y = newY;
			if (instance_exists(Oplayer))
			{
				Oplayer.state = PlayerStateFree;
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
}


if (trans_type = "iris fade")
{
	if (!surface_exists(surface)) {
	    surface = surface_create(GUI_W + 1, GUI_H);
	}
	
	surface_set_target(surface); {
		
		//Getting X and Y
		if (newRoom = undefined || !instance_exists(Oplayer))
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
		gpu_set_blendmode(bm_subtract);
		draw_circle(_x, _y, radius, false);
		gpu_set_blendmode(bm_normal);
		

		surface_reset_target();
	}
	if (radius > 0)
	{
		draw_surface(surface, 0, 0);
	}
}

//show_debug_message("gui w: " + string(GUI_W));
//show_debug_message("gui h: " + string(GUI_H));






