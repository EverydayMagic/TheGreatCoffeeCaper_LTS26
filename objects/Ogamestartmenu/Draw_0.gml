if (beat <= 3)
{
	draw_set_font(global.font_classic);
	draw_set_color(orange_col);
	draw_set_alpha(controls_alph);
	draw_set_halign(fa_center);
	draw_text(room_width/2, (room_height/2) - 48, "Z ..... Select\nX ..... Back\nC ..... Item\nArrows ..... Movement\nSHIFT ..... Pause");
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_color(white_col);
	draw_set_alpha(txt_alph);
	draw_set_font(global.font_name);
	draw_text(room_width/2, room_height - 4, "Press Z to START...");
	reset_draw_funcs();
}

draw_set_color(c_black);
draw_set_alpha(black_alph);
draw_rectangle(0, 0, room_width, room_height, false);
reset_draw_funcs();



















