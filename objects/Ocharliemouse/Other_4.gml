
//if (instance_exists(Oplayer))
//{
//	x = Oplayer.x;
//	y = Oplayer.y;

//	touchhoots = true;

//	if (global.cutsceneActive != true)
//		global.charlie_follow = true;
//	else
//		global.charlie_follow = false;

//}

if (instance_exists(Ofade))
{
	if (Ofade.trans_type = "map")
	{
		x -= 160 * Ofade.horz;
		y -= 144 * Ofade.vert;
		
		//show_debug_message("!mouse x: " + string(x) + " mouse y: " + string(y));
	}
}