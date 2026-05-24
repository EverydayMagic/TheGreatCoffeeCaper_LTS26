depth = -bbox_bottom + 2;

x = camera_get_view_x(view_camera[0]) + 2;
y = camera_get_view_y(view_camera[0]) - 2;


up = false;

curve = animcurve_get_channel(shadow_animcurve, "shadow");

startx = x;
starty = y;

percent = 0;