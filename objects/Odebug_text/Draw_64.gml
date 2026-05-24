draw_set_font(font_fancy);
draw_set_color(c_white);
draw_text_ext(5, 5, "Use [LEFT] to cycle modes. Modes are either entering Text ID or entering text and portrait directly.\n Mode: " + string(mode), 16, room_width * 2);
draw_set_halign(fa_center);
draw_text_ext_transformed(room_width, room_height - 64, input_instruct, 16, room_width * 2, 0.5, 0.5, 0);
draw_text_ext(room_width, room_height - 48, keyboard_string, 16, room_width * 2)
reset_draw_funcs();



















