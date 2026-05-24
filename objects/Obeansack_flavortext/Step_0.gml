if (instance_exists(Ointeractbox))
{
	if (place_meeting(x, y, Ointeractbox) && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle && !instance_exists(Ofade) && Oplayer.state = PlayerStateFree && !Oplayer.hoots_push)
	{
		var _par = Obeansack_flavortext_tracker;
		
		if (self_tracker = 0)
		{
			create_textbox("cupocloset_bag_" + string(_par.tracker));	
		} else {
			create_textbox("cupocloset_bag_" + string(self_tracker));		
		}
		
		var _push = true;
		for (var i = 0; i < array_length(_par.interacted_with); i++)
		{
			if (_par.interacted_with[i] = self.id)
			{
				_push = false;
			}	
		}
		if (_push)
		{ 
			array_push(_par.interacted_with, self.id);
			self_tracker = _par.tracker;
			_par.tracker++;
		}
	}
}






















