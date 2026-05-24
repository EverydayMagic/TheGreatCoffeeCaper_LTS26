var _check_x = (bbox_right > room_width || bbox_left < 0);
var _check_y = (bbox_top < 0 || bbox_bottom > room_height);

if (_check_x || _check_y){ instance_destroy(); }

motion_set(direction, spd);

















