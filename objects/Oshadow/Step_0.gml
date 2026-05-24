switch(room){
	
	case Rwoodsaftergate:
		image_index = 0;
		visible = true;
	break;
	
	case Rwoodsentrance:
		image_index = 1;
		visible = true;
	break;
	
	case Rlostwoods:
		image_index = 2;
		visible = true;
	break;
	
	case Rwoodsslope:
		image_index = 3;
		visible = true;
	break;
	
	case Rwoodscanyon:
		image_index = 4;
		visible = true;
	break;
	
	case Routbearhouse:
		image_index = 5;
		visible = true;
	break;
	
	default: visible = false;
}

if (percent < 2)
{
	percent += 0.01;
} else {
	percent = 0;
	up =! up;
	startx = x;
	starty = y;
}


position = animcurve_channel_evaluate(curve, (percent/2));

var _endx = startx - 2;
var _endy = starty + 2;
var _distx = _endx - startx;
var _disty = _endy - starty;

if (up = true)
{
	x = startx - (_distx * position);
	y = starty - (_disty * position);
} else {
	x = startx + (_distx * position);
	y = starty + (_disty * position);
}
