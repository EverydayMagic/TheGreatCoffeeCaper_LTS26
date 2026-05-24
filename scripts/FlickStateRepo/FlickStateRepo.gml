function FlickStateRepos(){
	motion_set(direction, 0);
	
	//find the mglass
	direction = point_direction(x, y, Omglass.x, Omglass.y);
	
	if (flown >= 3)
	{
		state = FlickStateTired;
		exit;
	}
	
	if (alarm[0] = -1){ alarm[0] = 60; }	
}