//draw dark brown bg
draw_set_color(#83391D);
draw_rectangle(x, y, x + (sprite_width - 1), y + (sprite_height - 1), false);
reset_draw_funcs();

if (healthhearts_curscale <= 0){ healthhearts_curscale = 0; global.hp = 0; }

//draw hearts
healthhearts_anim += sprite_get_speed(Sbattle_healthhearts)/30;
draw_sprite_ext(Sbattle_healthhearts, healthhearts_anim, x + 20, y, healthhearts_curscale, 1, 0, c_white, 1);

//draw meter
draw_self();





















