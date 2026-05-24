if (instance_exists(Oplayer))
{
	if (place_meeting(x, y, Oplayer))
		Oplayer.depth = Oplayer.old_depth - above - 50;	
}

if (instance_exists(Ocharliemouse))
{
	if (Ocharliemouse.touchhoots = false)
		if (place_meeting(x, y, Ocharliemouse) && !place_meeting(Ocharliemouse.x, Ocharliemouse.y, Oonebelow))
			Ocharliemouse.depth = Ocharliemouse.old_depth - above - 50;	
}






