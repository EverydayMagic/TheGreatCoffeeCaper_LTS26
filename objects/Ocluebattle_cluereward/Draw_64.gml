
//surface stuff (just the iris)
if (beating)
{
	if (!surface_exists(surface)) {
		    surface = surface_create(GUI_W + 1, GUI_H);
	}

	surface_set_target(surface); {
	
		switch (beat)
		{
			case 0:
				draw_clear(#2A3636);
				gpu_set_blendmode(bm_subtract);
				draw_circle(_x, _y, radius * 2, false);
				gpu_set_blendmode(bm_normal);
			break;
			case 1:
				draw_clear(#2A3636);
				gpu_set_blendmode(bm_subtract);
				draw_circle(_x, _y, radius * 2, false);
				gpu_set_blendmode(bm_normal);
			break;
			case 2:
				draw_clear(#2A3636);
				gpu_set_blendmode(bm_subtract);
				draw_circle(_x, _y, radius * 2, false);
				gpu_set_blendmode(bm_normal);
			break;
			case 3:
				draw_clear(#2A3636);
				gpu_set_blendmode(bm_subtract);
				draw_circle(_x, _y, radius * 2, false);
				gpu_set_blendmode(bm_normal);
			break;
			case 4:
				draw_clear(#2A3636);
				gpu_set_blendmode(bm_subtract);
				draw_circle(_x, _y, radius * 2, false);
				gpu_set_blendmode(bm_normal);
			break;
			case 5:
				draw_clear(#2A3636);
				gpu_set_blendmode(bm_subtract);
				draw_circle(_x, _y, radius * 2, false);
				gpu_set_blendmode(bm_normal);
			break;
		}
		surface_reset_target();
	}
	
	draw_set_alpha(0.5);
	draw_surface(surface, 0, 0);
	reset_draw_funcs();

}
if (beat < 3){ draw_self(); }
//normal GUI
switch (beat)
{
	case 3:
		//draw triangles
		
		for (var i = 0; i < 8; i++)
		{
			draw_sprite_ext(Srevealtriangle, 0, room_width/2, room_height/2, 2, 2, (45 * i) + tri_rot, c_white, 0.75);	
		}
		draw_self();
		
		//text stuff
			//text shadow
				draw_set_font(global.font_name);
				draw_set_color(darkbrown_col);
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_text_ext_transformed((bigtext_x + 1) * 2, (bigtext_y + 1) * 2, "YOU FOUND\n" + string_upper(string(clue.name)) + "!", 15, 160, bigtext_xscale * 2, bigtext_yscale * 2, 0);
				reset_draw_funcs();
			//title
				draw_set_font(global.font_name);
				draw_set_color(white_col);
				draw_set_halign(fa_center);
				draw_text_ext_transformed(bigtext_x * 2, bigtext_y * 2, "YOU FOUND\n" + string_upper(string(clue.name)) + "!", 15, 160, bigtext_xscale * 2, bigtext_yscale * 2, 0);
	break;
	
	case 4:
		//draw triangles
		for (var i = 0; i < 8; i++)
		{
			draw_sprite_ext(Srevealtriangle, 0, room_width/2, room_height/2, 2, 2, (45 * i) + tri_rot, c_white, 0.75);	
		}
		draw_self();
		
		//text stuff
			//text shadow
				draw_set_font(global.font_name);
				draw_set_color(darkbrown_col);
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_text_ext_transformed((bigtext_x + 1) * 2, (bigtext_y + 1) * 2, "YOU FOUND\n" + string_upper(string(clue.name)) + "!", 15, 160, bigtext_xscale * 2, bigtext_yscale * 2, 0);
				reset_draw_funcs();
			//title
				draw_set_font(global.font_name);
				draw_set_color(white_col);
				draw_set_halign(fa_center);
				draw_text_ext_transformed(bigtext_x * 2, bigtext_y * 2, "YOU FOUND\n" + string_upper(string(clue.name)) + "!", 15, 160, bigtext_xscale * 2, bigtext_yscale * 2, 0);
		
		//clue description
			//shadow
				draw_set_font(global.settings.font);
				draw_set_color(darkbrown_col);
				draw_set_halign(fa_center);
				draw_text_ext_transformed(((room_width/2) + 2), (((room_height/4) * 3) + 6), clue_desc_type, 15, 160, 2, 2, 0);
				reset_draw_funcs();
			
			//description
				draw_set_font(global.settings.font);
				draw_set_color(white_col);
				draw_set_halign(fa_center);
				draw_text_ext_transformed((room_width/2), (((room_height/4) * 3) + 4), clue_desc_type, 15, 160, 2, 2, 0);
				reset_draw_funcs();
		
		if (string_length(clue_desc_type) >= string_length(clue.description))
		{
			//arrow
				//shadow
					draw_sprite_ext(Sarrow, arrow_index, (151 * 2) + 2, (130 * 2) + 16, 2, 2, 0, darkbrown_col, 1);
				//arrow
					draw_sprite_ext(Sarrow, arrow_index, 151 * 2, 130 * 2 + 14, 2, 2, 0, c_white, 1);
		}
	break;
	
	case 5:
		//draw triangles
		for (var i = 0; i < 8; i++)
		{
			draw_sprite_ext(Srevealtriangle, 0, room_width/2, room_height/2, 2, 2, (45 * i) + tri_rot, c_white, 0.75);	
		}
		draw_self();
		
		//text stuff
			//text shadow
				draw_set_font(global.font_name);
				draw_set_color(darkbrown_col);
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_text_ext_transformed((bigtext_x + 1) * 2, (bigtext_y + 1) * 2, "YOU FOUND\n" + string_upper(string(clue.name)) + "!", 15, 160, bigtext_xscale * 2, bigtext_yscale * 2, 0);
				reset_draw_funcs();
			//title
				draw_set_font(global.font_name);
				draw_set_color(white_col);
				draw_set_halign(fa_center);
				draw_text_ext_transformed(bigtext_x * 2, bigtext_y * 2, "YOU FOUND\n" + string_upper(string(clue.name)) + "!", 15, 160, bigtext_xscale * 2, bigtext_yscale * 2, 0);
		
		//clue description
			//shadow
				draw_set_font(global.settings.font);
				draw_set_color(darkbrown_col);
				draw_set_halign(fa_center);
				draw_text_ext_transformed(((room_width/2) + 2), (((room_height/4) * 3) + 6), clue_desc_type, 15, 160, 2, 2, 0);
				reset_draw_funcs();
			
			//description
				draw_set_font(global.settings.font);
				draw_set_color(white_col);
				draw_set_halign(fa_center);
				draw_text_ext_transformed((room_width/2), (((room_height/4) * 3) + 4), clue_desc_type, 15, 160, 2, 2, 0);
				reset_draw_funcs();

	break;
}


















