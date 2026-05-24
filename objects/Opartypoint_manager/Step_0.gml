var _player = Oplayer;
if (!instance_exists(Oplayer))
{
	if (instance_exists(Ohoots_cutscene))
	{
		_player = Ohoots_cutscene;	
	}
}

if (instance_exists(_player) && !instance_exists(Ofade))
{
	if (_player.pm_backup)
	{
		//back all data up a step to make room for the next value in the array
		for (var i = array_size - 1; i > 0; i--)
		{
	
			pos_x[i] = pos_x[i - 1];
			pos_y[i] = pos_y[i - 1];
			
			toRecordSprite[i] = toRecordSprite[i - 1];
			toRecordImageIndex[i] = toRecordImageIndex[i - 1];
			toRecordImageSpeed[i] = toRecordImageSpeed[i - 1];
	
		}
	}
	
	//show_debug_message("pos_x: " + string(pos_x));
	//show_debug_message("pos_y: " + string(pos_y));
}

//for iris transition
////this has to go here instead of "Room Start" because player doesn't get newX and newY when the event runs
if (instance_exists(Opartypoint) && instance_exists(Ofade))
{
	if (Ofade.trans_type = "iris" && !Ofade.loading)
	{
		if (instance_exists(_player))
		{
			if (Ofade.trans_type = "iris" && room = Ofade.newRoom)
			{
				//determine whether we should be behind or in front of player (depth wise)
				var _ymod = 0;
				var _xmod = 0;
				
				switch(Ofade.party_dir)
				{
					case 0:
						_ymod = 0;
						_xmod = 1;
					break;
					case 1:
						_ymod = -1;
						_xmod = 0;
					break;
					case 2:
						_ymod = 0;
						_xmod = -1;
					break;
					case 3:
						_ymod = 1;
						_xmod = 0;
					break;
				}
				
				if (instance_exists(_player))
				{
					with (Opartypoint)
					{
						x = Ofade.newX + (1 * _xmod);
						y = Ofade.newY + (1 * _ymod);
					}
					
					for (var r = array_size - 1; r > 0; r--)
					{
						pos_x[r] = Ofade.newX + (1 * _xmod);
						pos_y[r] = Ofade.newY + (1 * _ymod);
					}
					
				}	
			}
		}
	}	
}

//show_debug_message("party points: " + string(instance_number(Opartypoint)));

