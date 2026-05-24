level = 1;

//change sprite based on level
var _str = "Scluetimer_lvl" + string(level);
spr_index = asset_get_index(_str);


total_time = 90;
time_elapsed = 0;

if (level = 1){ total_time = 62; }


time_before_finalcount = 30 * level;

GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();

handle_rot = 1;

pie_alpha = 1;
pie_alpha_gain = true;

oldx = x;
oldy = y;


old_depth = depth;


beat = 0;
surface = -1;
radius = 160;

//shaking
shake = false;
shake_time = 60;
shake_time_const = shake_time;
shake_magnitude = 0.5;
shake_magnitude_const = shake_magnitude;
shake_fade = 0.1;
xval = 0;
old_x = x;

exit_battle = false;

depth = -101;