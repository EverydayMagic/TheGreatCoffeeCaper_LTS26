switch (room)
{
	case Rladder:
		x = 96;
		y = 49;
		visible = false;
	
		if (place_meeting(x, y, Oplayer))
			ladder = true;	
		else 
			ladder = false;
	break;
	
	case Rwoodshop:
		x = 64;
		y = 18;
		visible = true;
		
		if (instance_exists(Oclawdine))
		{
			depth = Oclawdine.depth + 10;	
		}
	
		if (place_meeting(x, y, Oplayer))
			ladder = true;	
		else 
			ladder = false;
	break;
	
	default: visible = false; break;
}


depth = -y;

if (visible = false)
	ladder = false;


//show_debug_message("onroof: " + string(onroof));



