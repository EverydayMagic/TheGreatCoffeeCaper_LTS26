//MAKE SURE THE PARTY MEMBER HAS THE APPROPRIATE SPRITE VARIABLES IN CREATE EVENT

function partypoint_changespr(){
	
	//change sprite based on direction headed
	var _xchange = x - xprevious;
	var _ychange = y - yprevious;
	
	//think of a graph when you look at this
	
	if (_xchange > 0) //right side
	{
		//moving NE, E, and SE
		sprite_index = walk_r_spr;
		image_speed = 1;
	}	
	
	if (_xchange = 0) //along y axis
	{
		if (_ychange > 0) //along negative y-axis (flipped because of gamemaker y-axis)
		{
			//moving S
			sprite_index = walk_d_spr;
			image_speed = 1;
		}
		
		if (_ychange = 0) //at (0, 0)
		{
			//not moving
			if (floor(image_index) mod 2 = 0)
			{
				image_speed = 0;
			}
		}
		
		if (_ychange < 0) //along postive y-axis (flipped because of gamemaker y-axis)
		{
			//moving N
			sprite_index = walk_u_spr;
			image_speed = 1;
		}	
	}
	
	if (_xchange < 0) //left side
	{
		//moving NW, W, and SW
		sprite_index = walk_l_spr;
		image_speed = 1;
	}
}