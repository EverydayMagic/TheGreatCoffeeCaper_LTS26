

//first clouds
	if (room != Rwoodsentrance)
	{
		x = 0 + x_xtra;	
		y = 0;
		draw_self();
	} else {
		x = 112 + x_xtra;
		y = 0;
		draw_self();
	}

//second clouds
	if (room != Rwoodsentrance)
	{
		x = 0 + sprite_width + x_xtra;	
		y = 0;
		draw_self();		
	} else {
		x = 112 + 48 + x_xtra;	
		y = 0;
		draw_self();
	}













