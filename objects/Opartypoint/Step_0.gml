//This point(s) will always follow Hootsworth to give party members a point to return to

var _player = Oplayer;
if (!instance_exists(Oplayer))
{
	if (instance_exists(Ohoots_cutscene))
	{
		_player = Ohoots_cutscene;	
	}
}

if (instance_exists(_player))
{
	var _pm = Opartypoint_manager;
	
	x = _pm.pos_x[record - 1];
	y = _pm.pos_y[record - 1];	
}

depth = -y;

//show_debug_message("id: " + string(self.id));
//show_debug_message("x: " + string(x) + " y: " + string(y));
