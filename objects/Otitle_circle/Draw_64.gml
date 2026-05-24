GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();

if (!surface_exists(surface))
	surface = surface_create(GUI_W + 1, GUI_H);
	
surface_set_target(surface); {
	var _x = GUI_W/2;
	var _y = GUI_H/2;
	if (instance_exists(Ohoots_title))
	{
		_x = Ohoots_title.x * 2;
		_y = Ohoots_title.y * 2;
	}
	draw_clear(#390C14);
	draw_sprite_ext(Scoffee_title, 0, 0, 0, 2, 2, 0, c_white, 1);
	gpu_set_blendmode(bm_subtract);
	draw_circle(_x, _y, radius, false);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}
draw_surface(surface, 0, 0);













