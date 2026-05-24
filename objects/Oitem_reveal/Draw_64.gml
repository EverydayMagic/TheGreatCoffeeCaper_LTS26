//iris
if (!surface_exists(surface))
	surface = surface_create(GUI_W, GUI_H);

surface_set_target(surface); {
	var _x = Oplayer.x + 41.5;
	var _y = (Oplayer.y) + 12;
	switch (beat)
	{
		case 1:
			draw_clear(#2A3636);
			gpu_set_blendmode(bm_subtract);
			draw_circle(_x, _y, radius, false);
			gpu_set_blendmode(bm_normal);
		break;
		case 2:
			draw_clear(#2A3636);
			gpu_set_blendmode(bm_subtract);
			draw_circle(_x, _y, radius, false);
			gpu_set_blendmode(bm_normal);
		break;
		case 3:
			draw_clear(#2A3636);
			gpu_set_blendmode(bm_subtract);
			draw_circle(_x, _y, radius, false);
			gpu_set_blendmode(bm_normal);
		break;
		case 4:
			draw_clear(#2A3636);
			gpu_set_blendmode(bm_subtract);
			draw_circle(_x, _y, radius, false);
			gpu_set_blendmode(bm_normal);
		break;
	}
	
	draw_set_color(c_red);
	draw_circle(_x, _y, 1, false);
	
	surface_reset_target();
}
draw_set_alpha(0.5);
if (beat < 5)
	draw_surface(surface, 0, 0);
reset_draw_funcs();


//text
switch (beat)
{
	case 2:
		//YOU FOUND title
			//text shadow
				draw_set_font(global.font_name);
				draw_set_color(darkbrown_col);
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_text_transformed((bigtext_x + 1) * 2, (bigtext_y + 1) * 2, "YOU FOUND " + string_upper(string(item_revealing.display_name)) + "!", bigtext_xscale * 2, bigtext_yscale * 2, 0);
				reset_draw_funcs();
			//title
				draw_set_font(global.font_name);
				draw_set_color(white_col);
				draw_set_halign(fa_center);
				draw_text_transformed(bigtext_x * 2, bigtext_y * 2, "YOU FOUND " + string_upper(string(item_revealing.display_name)) + "!", bigtext_xscale * 2, bigtext_yscale * 2, 0);
				reset_draw_funcs();

	break;
	case 3:
		//YOU FOUND title
			//text shadow
				draw_set_font(global.font_name);
				draw_set_color(darkbrown_col);
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_text_transformed((bigtext_x + 1) * 2, (bigtext_y + 1) * 2, "YOU FOUND " + string_upper(string(item_revealing.display_name)) + "!", bigtext_xscale * 2, bigtext_yscale * 2, 0);
				reset_draw_funcs();
			//title
				draw_set_font(global.font_name);
				draw_set_color(white_col);
				draw_set_halign(fa_center);
				draw_text_transformed(bigtext_x * 2, bigtext_y * 2, "YOU FOUND " + string_upper(string(item_revealing.display_name)) + "!", bigtext_xscale * 2, bigtext_yscale * 2, 0);
				reset_draw_funcs();
				
		//item desc
			//description
				draw_set_font(global.settings.font);
				draw_set_color(darkbrown_col);
				draw_set_halign(fa_center);
				draw_text_ext_transformed((bigtext_x * 2) + 2, (Oplayer.y * 2) + 2, item_desc_type, 15, cam_width * 2, 2, 2, 0);
				reset_draw_funcs();
			//description
				draw_set_font(global.settings.font);
				draw_set_color(white_col);
				draw_set_halign(fa_center);
				draw_text_ext_transformed(bigtext_x * 2, Oplayer.y * 2, item_desc_type, 15, cam_width * 2, 2, 2, 0);
				reset_draw_funcs();
		
		if (string_length(item_desc_type) >= string_length(item_desc))
		{
			//arrow shadow
			draw_sprite_ext(Sarrow, arrow_index, (bigtext_x * 2) + 131 + 2, (Oplayer.y * 2) + 44 + 2, 2, 2, 0, darkbrown_col, 1);	
			//arrow
			draw_sprite_ext(Sarrow, arrow_index, (bigtext_x * 2) + 131, (Oplayer.y * 2) + 44, 2, 2, 0, c_white, 1);	
		}
	break;
}











