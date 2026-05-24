draw_set_font(global.font_name);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_ext(room_width/2, 16, "Type in the room name of the room to visit!", 12, 128);
draw_text_ext(room_width/2, room_height/2, keyboard_string, 8, 128);
draw_set_color(c_red);
if (room_error)
{
	draw_text_ext(room_width/2, room_height - 32, "ROOM NAME DOES NOT EXIST", 12, 128);		
}
reset_draw_funcs();






















