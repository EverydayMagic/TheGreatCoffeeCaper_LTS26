function ResetRoomPos(){
	var _x = -1;
	var _y = -1;
	
	//housing
	for (var h = 0; h < array_length(global.house_rooms); h++)
	{
		if (room = global.house_rooms[h])
		{
			_x = 80;
			_y = 125;
									
			with (Opartypoint_manager)
			{
				with (Opartypoint)
				{
					x = 80;
					y = 124;
				}
					
				for (var r = array_size - 1; r > 0; r--)
				{
					pos_x[r] = 80;
					pos_y[r] = 126;
				}	
			}
		}
	}
						
	//special housing	
	for (var sh = 0; sh < array_length(global.special_house_rooms); sh++)
	{
		if (room = global.special_house_rooms[sh])
		{
			_x = 80;
			_y = 125;
									
			with (Opartypoint_manager)
			{
				with (Opartypoint)
				{
					x = 80;
					y = 124;
				}
					
				for (var r = array_size - 1; r > 0; r--)
				{
					pos_x[r] = 80;
					pos_y[r] = 126;
				}	
			}
		}
	}
						
	//outside
	for (var out = 0; out < array_length(global.outside_rooms); out++)
	{
		if (room = global.outside_rooms[out])
		{							
			switch (room)
			{
				case Rneighborhood:
					_x = 75;
					_y = 95;
				break;
				case Routbighouse:
					_x = 90;
					_y = 128;
				break;
				case Routchophouse:
					_x = 36;
					_y = 104;
				break;
				case Routcoffeehouse:
					_x = 136;
					_y = 88;
				break;
				case Routsidehooters:
					_x = 112;
					_y = 104;
				break;
				case Rbeforeneighborhood:
					_x = 56;
					_y = 80;
				break;
				case Rbridge:
					_x = 84;
					_y = 108;
				break;
				case Rinbetween:
					_x = 148;
					_y = 104;
				break;
				case Rladder:
					_x = 88;
					_y = 128;
				break;
				case Rpathtopond:
					_x = 108;
					_y = 28;
				break;
				case Rroadtohoots:
					_x = 40;
					_y = 104;
				break;
				case Rstage:
					_x = 77;
					_y = 136;
				break;
			}
			
			with (Opartypoint_manager)
			{
				with (Opartypoint)
				{
					x = _x;
					y = _y - 1;
				}
					
				for (var r = array_size - 1; r > 0; r--)
				{
					pos_x[r] = _x;
					pos_y[r] = _y - 1;
				}	
			}
		}
	}
	
	//default
	if (_x = -1 && _y = -1)
	{
		_x = room_width/2;
		_y = room_height/2;
	}
	
	
	x = _x;
	y = _y;
}