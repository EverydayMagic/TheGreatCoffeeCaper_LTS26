///@description for the optional arguments, put -1 to use default values
function multigoTo(_obj, _ori_x, _ori_y, _x_pos, _y_pos, _spd, _spr_list = [], _spr_done = -1, _img_done = 0, _img_spd_done = 0, _imagespd_manual = noone, _uphill_move = false, _loop_move = false, _pause_after = -1){
	if (_spr_list = -1){ _spr_list = []; }
	if (_img_done = -1){ _img_done = 0; }
	if (_img_spd_done = -1){ _img_spd_done = 0; }
	if (_imagespd_manual = -1){ _imagespd_manual = noone; }
	if (_uphill_move = -1){ _uphill_move = false; }
	if (_loop_move = -1){ _loop_move = false; }
	
	with (instance_create_depth(0, 0, 0, Omulti_goto))
	{
		object = _obj;
		origin_x = _ori_x;
		origin_y = _ori_y;
		x_pos = _x_pos;
		y_pos = _y_pos;
		spd = _spd;
		spr_list = _spr_list;
		spr_done = _spr_done;
		img_done = _img_done;
		img_spd_done = _img_spd_done;
		imagespd_manual = _imagespd_manual;
		uphill_move = _uphill_move;
		loop_move = _loop_move;
		pause_after_beat = _pause_after;
	}
}