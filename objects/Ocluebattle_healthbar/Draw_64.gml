/// @description gray iris (lost battle)
if (global.battle_lock && global.battle_result = 2)
{
	if (!surface_exists(surface)) {
			surface = surface_create(GUI_W, GUI_H);
	}
	
	surface_set_target(surface); {
		draw_clear(#2A3636);
		gpu_set_blendmode(bm_subtract);
		draw_circle(room_x_to_gui(Omglass.x), room_x_to_gui(Omglass.y), radius * 2, false);
		gpu_set_blendmode(bm_normal);
		
		surface_reset_target();
	}
	
	draw_set_alpha(0.5);
	draw_surface(surface, 0, 0);
	reset_draw_funcs();
}




















