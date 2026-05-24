healthhearts_anim = 0;
healthhearts_xscale = 3.15; 
healthhearts_curscale = healthhearts_xscale;



shake = false;
shake_time = 5;
shake_time_const = shake_time;
shake_magnitude = 2;
shake_magnitude_const = shake_magnitude;
shake_fade = 1;
xval = 0;
old_x = x;

function reset_shake_vars(){
	shake_time = shake_time_const;
}


GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();

healthbar_obj = [
	Ocluebattle_healthbar,
	Ocluebattle_mglass_icon
];


beat = 0;
surface = -1;
radius = 160;
x_dist = abs(room_x_to_gui(x) - room_width);
y_dist = abs(room_y_to_gui(y) - room_height);

depth = -101;






