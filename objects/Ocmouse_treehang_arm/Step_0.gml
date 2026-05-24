var _cmouse = Ocharliemouse_cutscene
if (instance_exists(_cmouse))
{
	x = _cmouse.x + 1;
	y = _cmouse.y + 4;
	
	if (place_meeting(x, y, Otree) && treed)
	{
		depth = Otree.depth - 1;
	}
}

















