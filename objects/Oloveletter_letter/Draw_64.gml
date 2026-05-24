if (!visible){ exit; }

//gray bg rectangle
draw_set_alpha(alph);
draw_set_color(#2A3636);
draw_rectangle(0, 0, 160 * 2, 144 * 2, false);
reset_draw_funcs();

//letter
image_xscale = 2;
image_yscale = 2;

draw_self();

//draw_set_color(c_red);

//words on letter (let's call them the letters)
draw_set_font(font_fancy);
draw_set_color(darkbrown_col);
draw_text_ext_transformed(((x - sprite_get_width(sprite_index)) + 24), ((y - sprite_get_height(sprite_index)) + 24), letters, 16, (sprite_get_width(sprite_index) * 2), 0.6, 0.6, 5);

reset_draw_funcs();















