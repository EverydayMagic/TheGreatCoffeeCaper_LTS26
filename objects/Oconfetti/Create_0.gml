image_index = choose(3, 4, 5);

y = 0 - (12 * Omooshmushroom.confetti_ytrack)

image_xscale = 2;
image_yscale = 2;

dir = choose(1, -1);


alarm[0] = 1;

drawit = false;
next_up = noone;

move_x = choose(true, false);
x_len = 0;
if (move_x)
	x_len = irandom_range(2, 12);


curve = animcurve_get_channel(confetti_animcurve, "confetti");
percent = 0;

x *= 2;
y *= 2;

start_x = x;

global.confetti_surface = -1;
GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();