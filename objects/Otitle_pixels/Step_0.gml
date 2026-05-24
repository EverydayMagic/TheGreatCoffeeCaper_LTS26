if (Otitle_menu.beat > 3 && Otitle_menu.beat != 5)
{
	if (place_meeting(x, y, Otitle_circle) || place_meeting(Otitle_circle.x, Otitle_circle.y, self))
		instance_destroy();
} else {

	if (Otitle_menu.beat = 5)
		instance_destroy();
	else
		exit;
}









