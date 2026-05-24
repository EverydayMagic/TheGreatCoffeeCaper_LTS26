draw_set_alpha(alph);
draw_set_color(white_col);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.font_name);
draw_text(room_width/2, room_height/8, "SELECT FONT");

//font options
draw_set_font(global.font_classic);
if (nav = 0){ draw_set_color(orange_col); }
draw_text(room_width/4, (room_height/2) - 16, "Classic");
draw_set_color(white_col);
draw_set_font(global.font_ffl);
if (nav = 1){ draw_set_color(orange_col); }
draw_text((room_width/4) * 3, (room_height/2) - 16, "Clean");

reset_draw_funcs();

//draw nav arrow
arrow_anim += sprite_get_speed(Sarrow)/FRAME_RATE;
draw_sprite(Sarrow, arrow_anim, (room_width/4) + (((room_width/4) * 2) * nav), (room_height/2) - 32);


//draw black rectangle (for fade)
draw_set_color(c_black);
draw_set_alpha(black_alph);
draw_rectangle(0, 0, room_width, room_height, false);
reset_draw_funcs();
















