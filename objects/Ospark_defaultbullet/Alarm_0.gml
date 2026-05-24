/// @description set starting x and y

//change x and y based on spark dir
visible = true;
switch (round((direction/45)))
{
	case 0:
		x += 6;
		y += 2;
	break;
	case 1:
		x += 6;
		y -= 3;
	break;
	case 2:
		x += 0;
		y -= 1;
	break;
	case 3:
		x -= 6;
		y -= 4;
	break;
	case 4:
		x -= 6;
		y += 2;
	break;
	case 5:
		x -= 5;
		y += 6;
	break;
	case 6:
		x += 0;
		y += 6;
	break;
	case 7:
		x += 5;
		y += 6;
	break;
	case 8:
		x += 6;
		y += 2;
	break;
}

//no loop












