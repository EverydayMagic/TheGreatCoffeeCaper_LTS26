
//draw sparkle meter
sparkle_meter_index += 16/FRAME_RATE;

//blue bg
//For Mac (test to see if works on mac too)
//x - 7
//y - 6
//For Windows
//x - 8
//y - 7
draw_pie_spr_ext(x - 14, y - 12, 360, [Sbattle_sparklemeter_bg_blue, Sbattle_sparklemeter_bg_sparkles], 25 * 2, 2, 2, 1, [blue_bg_img, sparkles_bg_img]);

//dark brown pie
//x 24
//y 24
draw_pie(x + 48, y + 48, brownwheel_value, 360, darkbrown_col, 22.5 + 23, 1, 120, true);

//meter
draw_self();














