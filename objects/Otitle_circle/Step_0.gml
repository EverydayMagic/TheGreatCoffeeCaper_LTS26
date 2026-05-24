var Otitlemenu = Otitle_menu;

switch (Otitlemenu.beat)
{
	//First Coffee Caper Logo
	case 2:
		visible = true;
	break;
	
	//Circle Appears
	case 3:
		if (radius < 40)
			radius += spd;
	break;
	
	//Circle Grows
	case 4:
		if (radius < 280)
			radius += spd;
		else
			instance_destroy();
	break;
	
	case 5:
		instance_destroy();
	break;
	
}

//show_debug_message("gui w: " + string(GUI_W));
//show_debug_message("gui h: " + string(GUI_H));









