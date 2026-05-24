
switch(room) {
	
	case Routsidehooters:
		image_index = 0;
	break;
	
	case Rroadtohoots:
		image_index = 1;
	break;
	
	case Rwoodsentrance:
		image_index = 2;
	break;
	
	case Rbridge:
		image_index = 3;
	break;
	
	case Routboardedhouse:
		image_index = 4;
	break;
	
	default:
		image_index = 5;
	break;
}

if (room != Rwoodsentrance)
{
	if (abs(x_xtra) >= sprite_width)
		x_xtra = 0;
} else {
	if (abs(x_xtra) >= 48)
		x_xtra = 0;
}






//show_debug_message(x_xtra);


