function FlickStateFly(){
	
	//vertical collision checking
	if ((y - sprite_height) < 0 || (y + sprite_height) > room_height)
	{
		flown++;
		state = FlickStateRepos;
		exit;
	}
	
	//horizontal collision checking
	if ((x + sprite_width) > room_width || (x - sprite_width) < 0)
	{
		flown++;
		state = FlickStateRepos;
		exit;
	}
	
	
	//figure out sprite direction
	face_dir = round(direction/90);
	
	//zoom away
	motion_add(direction, 0.3);
	
	//sparkle trail
	if (alarm[1] = -1){ alarm[1] = 2; }
	
	////collision checks
	//if (alarm[2] = -1){ alarm[2] = 2; }
}