
if (instance_exists(Ointeractbox))
{
	if (place_meeting(x, y, Ointeractbox) && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle && !instance_exists(Ofade) && Oplayer.state = PlayerStateFree && !Oplayer.hoots_push) 
	{
		var _dir = true;
		if (dir_needed != -1) 
		{
			var _player = noone;
			if (instance_exists(Oplayer))
			{ 
				_player = Oplayer;
			} else if (instance_exists(Ohoots_cutscene)) {
				_player = Ohoots_cutscene;	
			}
			
			if (!is_array(dir_needed))
			{
				if (round(_player.direction/90) != dir_needed)
				{
					_dir = false;	
				}
			} else {
				for (var i = 0; i < array_length(dir_needed); i++)
				{
					if (round(_player.direction/90) != dir_needed[i])
					{
						_dir = false;
					} else {
						_dir = true;
						break;
					}
				}
			}
		}
		
		if (_dir)
		{
			create_textbox(text_id);
		}
	}
}









