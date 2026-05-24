for (var _line = 0; _line < array_length(credit_line_str); _line++)
{
	//credits text
	draw_set_color(line_color[_line]);
	draw_set_font(global.font_name);
	draw_set_halign(fa_center);
	if (is_string(credit_line_str[_line]))
	{
		draw_text_ext_transformed(room_width, line_y[_line] * 2, credit_line_str[_line], 12, 128 * 2, line_scale[_line], line_scale[_line], 0);
	}
	reset_draw_funcs();
	
	//sprites
	if (!is_string(credit_line_str[_line]))
	{
		draw_sprite_ext(credit_line_str[_line], credit_line_imgindex[_line], room_width, line_y[_line] * 2, 2, 2, 0, c_white, 1);
	}
}















