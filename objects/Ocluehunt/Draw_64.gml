//drawing spotlight

if (cluehunt_active && !firsttimemenonosnotmyfirsttime && !beating && !trans_to_battle)
{
	if (!surface_exists(surface)) {
		surface = surface_create(GUI_W + 1, GUI_H);
	}
	

	surface_set_target(surface); {
		draw_clear_alpha(#390C14, 0.59);
		
		gpu_set_blendmode(bm_subtract);
		
		var _player = Oplayer
		if (!instance_exists(Oplayer) && instance_exists(Ohoots_cutscene)){ _player = Ohoots_cutscene; }
		if (instance_exists(Ofade))
		{
			if (Ofade.trans_type = "iris")
				draw_sprite_ext(Sshunt_spotlight, 0, _player.x * 2, _player.y * 2, 2, 2, 0, c_white, 1);
				
		} else draw_sprite_ext(Sshunt_spotlight, 0, _player.x * 2, _player.y * 2, 2, 2, 0, c_white, 1);
		gpu_set_blendmode(bm_normal);
		
		surface_reset_target();
	}
	draw_surface(surface, 0, 0);
	spotlighted = true;
}

if (firsttimemenonosnotmyfirsttime)
{
	switch (beat)
	{
		case 5:
			if (!surface_exists(surface)) {
				surface = surface_create(GUI_W + 1, GUI_H);
			}
			
			surface_set_target(surface); {
				draw_clear_alpha(#390C14, 0.59);
		
				surface_reset_target();
			}
			draw_surface(surface, 0, 0);
		break;
		
		case 6:
			if (!surface_exists(surface)) {
				surface = surface_create(GUI_W + 1, GUI_H);
			}
	

			surface_set_target(surface); {
				draw_clear_alpha(#390C14, 0.59);
		
				gpu_set_blendmode(bm_subtract);
				if (instance_exists(Ofade))
				{
					if (Ofade.trans_type = "iris")
						draw_sprite_ext(Sshunt_spotlight, 0, player_x * 2, player_y * 2, 2, 2, 0, c_white, 1);
				
				} else draw_sprite_ext(Sshunt_spotlight, 0, player_x * 2, player_y * 2, 2, 2, 0, c_white, 1);
				gpu_set_blendmode(bm_normal);
		
				surface_reset_target();
			}
			draw_surface(surface, 0, 0);
			spotlighted = true;
		break;
		case 7:
			if (!surface_exists(surface)) {
				surface = surface_create(GUI_W + 1, GUI_H);
			}
	

			surface_set_target(surface); {
				draw_clear_alpha(#390C14, 0.59);
		
				gpu_set_blendmode(bm_subtract);
				if (instance_exists(Ofade))
				{
					if (Ofade.trans_type = "iris")
						draw_sprite_ext(Sshunt_spotlight, 0, player_x * 2, player_y * 2, 2, 2, 0, c_white, 1);
				
				} else draw_sprite_ext(Sshunt_spotlight, 0, player_x * 2, player_y * 2, 2, 2, 0, c_white, 1);
				gpu_set_blendmode(bm_normal);
		
				surface_reset_target();
			}
			draw_surface(surface, 0, 0);
		break;
	}
}











