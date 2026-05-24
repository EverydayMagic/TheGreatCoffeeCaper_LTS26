//var _inst = [Oplayer, Ocharliemouse, Ohoots_cutscene, Ocharliemouse_cutscene, Opuffy, Ostump, Oegg_stroller, Osniffles];

//for (var i = 0; i < array_length(_inst); i++)
//{
//	if (instance_exists(_inst[i]))
//	{
//		if (_inst[i].y < y - modifier)
//			depth = _inst[i].depth - 10;
//		else
//			depth = _inst[i].depth + 10;
//	}
//}

depth = -y;

visible =! instance_exists(Ofade);

//show_debug_message("fence_depth: " + string(depth));









