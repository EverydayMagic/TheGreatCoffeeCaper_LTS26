/// @description drawing quit game

if (quitting_game)
{
	depth = -9999;
	draw_set_alpha(1);
	draw_set_font(global.settings.font);
	draw_set_color(white_col);
	draw_text_transformed(room_x_to_gui(5), room_y_to_gui(5), quit_game_text, 2, 2, 0);
	reset_draw_funcs();
}


//draw_set_font(global.font_name);
//display_write_all_specs();
//reset_draw_funcs();
















