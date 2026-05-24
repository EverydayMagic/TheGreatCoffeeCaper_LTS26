var _spr = string(choose(1, 1, 2, 2));
var _spr_str = "Smglass_gshard" + _spr;
sprite_index = asset_get_index(_spr_str);

var _dir_modcheck = instance_number(Omglass_gshard) mod 2;
if (_dir_modcheck = 0){ var _dir_mod = 1; } else { var _dir_mod = -1; }
direction = 0 + (_dir_mod * (360/instance_number(Omglass_gshard_dead)));

image_angle = 0;

start_x = x;
start_y = y;

depth = -bbox_bottom;
image_xscale = 2;
image_yscale = 2;

beat = 0;
beating = false;
hbar_dist = -1;
hold_time = 0;

path = -1;

point_x = 0;
target_x = Ocluebattle_healthbar.x + (sprite_get_width(Sbattle_healthmeter_bg) / 2);
target_y = Ocluebattle_healthbar.y;
