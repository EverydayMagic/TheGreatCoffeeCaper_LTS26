//draw face
draw_sprite_ext(spr_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);

//red pie cirlce
draw_pie(x, y, -handle_rot, 360, #EF6544, 8 * image_xscale, pie_alpha);

//clock hand
draw_sprite_ext(Scluetimer_handle, 0, x, y, image_xscale, image_yscale, handle_rot, c_white, 1);


//clock frame
var _str = "Scluetimer_lvl" + string(level) + "_frame";
var _ast = asset_get_index(_str);
draw_sprite_ext(_ast, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);










#region lost battle (grey iris)
	
	if (global.battle_result = 0 && global.battle_lock)
	{

				
		if (!surface_exists(surface)) {
			surface = surface_create(GUI_W, GUI_H);
		}

		surface_set_target(surface); {
	
			switch (beat)
			{
				case 0:
					draw_clear(#2A3636);
					gpu_set_blendmode(bm_subtract);
					draw_circle(room_x_to_gui(x), room_x_to_gui(y), radius * 2, false);
					gpu_set_blendmode(bm_normal);
				break;
				case 1:
					draw_clear(#2A3636);
					gpu_set_blendmode(bm_subtract);
					draw_circle(room_x_to_gui(x), room_x_to_gui(y), radius * 2, false);
					gpu_set_blendmode(bm_normal);
				break;
			}
			surface_reset_target();
		}
	
		draw_set_alpha(0.5);
		draw_surface(surface, 0, 0);
		reset_draw_funcs();
		
	}
	
#endregion


