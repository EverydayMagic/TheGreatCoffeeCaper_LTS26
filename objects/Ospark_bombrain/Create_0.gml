parent = noone;

var _x = x;
var _y = y;
var _id = self.id;

babied = false;
spd = 3;
damage = 0;
var _spd = spd;
var _patharc_id = 0;
with (instance_create_depth(0, 0, 0, Opath_arc))
{
	curving = true;
	x1 = _x;
	y1 = _y;
	x2 = Omglass.x;
	y2 = Omglass.y;
	curve_height = 84;
	max_points_per_side = 15;
	obj = _id;
	spd = _spd;
	_patharc_id = self.id;
}
patharc_id = _patharc_id;

shadow = instance_create_depth(x, y, Omglass.depth + 1, Obombshadow);
shadow.parent = self.id;

//shadow path
shadow_path =  -1;
if (!path_exists(shadow_path))
	shadow_path = path_add();
path_add_point(shadow_path, x, y, 100);
path_add_point(shadow_path, Omglass.x - 4, Omglass.y, 100);
path_set_closed(shadow_path, false);
var p = shadow_path;
with (shadow)
{
	path_start(p, 0, path_action_stop, true);
}
