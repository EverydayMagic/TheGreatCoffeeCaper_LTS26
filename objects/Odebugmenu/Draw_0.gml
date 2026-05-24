//draw menu options
draw_set_font(global.font_name);
draw_set_halign(fa_center);
draw_set_color(c_white);
for (var o = 0; o < array_length(menu_options); o++)
{
	draw_text(room_width/2, ((room_height/8) * o) + 32, menu_options[o]);
}
reset_draw_funcs();

//cursor
draw_sprite(Smglass_cursor, 0, room_width/10, ((room_height/8) * (index - 1)) + 32);