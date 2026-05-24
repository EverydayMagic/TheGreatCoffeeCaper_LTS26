function partypoint_irischange(){
	var _player = Oplayer;
	if (!instance_exists(Oplayer))
	{
		if (instance_exists(Ohoots_cutscene))
		{
			_player = Ohoots_cutscene;	
		}
	}
	
	if (instance_exists(_player) && !global.cutsceneActive)
	{
		if (instance_exists(Ofade))
		{
			if (Ofade.trans_type = "iris" && room = Ofade.newRoom && !Ofade.loading)
			{
				//determine whether we should be behind or in front of player (depth wise)
				var _ymod = 0;
				var _xmod = 0;
				
				sprite_index = idle_spr;
				image_speed = 0;
		
				switch(Ofade.party_dir)
				{
					case 0:
						_ymod = -1;
						_xmod = 1;
						image_index = 2;
					break;
					case 1:
						_ymod = -1;
						_xmod = 0;
						image_index = 3;
					break;
					case 2:
						_ymod = -1;
						_xmod = -1;
						image_index = 0;
					break;
					case 3:
						_ymod = 1;
						_xmod = 0;
						image_index = 1;
					break;
				}

				if (instance_exists(_player))
				{
					x = Ofade.newX + (1 * _xmod);
					y = Ofade.newY + (1 * _ymod);
				}
			}
		}
	}
}