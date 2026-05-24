if (beat < 2)
{
	
	GUI_W = display_get_gui_width();
	GUI_H = display_get_gui_height();

	if (!surface_exists(surf))
		surf = surface_create(GUI_W + 1, GUI_H);

	surface_set_target(surf); {
	
			switch (beat)
			{
				//ED Magic Logo
				case 0:
					layer_set_visible("Title_Pixel", false);
					draw_set_color(c_black);
					draw_rectangle(0, 0, 160 * scale, 144 * scale, false);
					draw_set_color(c_white);
					draw_sprite_ext(Sedmagic_logo, 0, 160 * (scale/2), 144 * (scale/2), 1, 1, 0, c_white, ed_alpha);
				break;
				case 1:
					draw_set_color(c_black);
					draw_rectangle(0, 0, 160 * scale, 144 * scale, false);
					draw_set_color(c_white);
					draw_sprite_ext(Sedmagic_logo, 0, 160 * (scale/2), 144 * (scale/2), 1, 1, 0, c_white, ed_alpha);
				break;
			}
		
		surface_reset_target();
	}

	draw_surface(surf, 0, 0);


} else {
	if (surface_exists(surf))
		surface_free(surf);
	once = true;
}












