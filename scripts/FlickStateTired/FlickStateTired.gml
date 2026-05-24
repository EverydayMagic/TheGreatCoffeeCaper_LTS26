function FlickStateTired(){
	flown = 0;
	motion_set(direction, 0);
	
	//create sweat
	var _id = self.id;
	if (!instance_exists(Osweatbeads))
	{
		with (instance_create_depth(0, 0, depth, Osweatbeads))
		{
			char_track = _id;
			h_mod = 2;
		}
	} else {
		for (var i = 0; i < instance_count; i++)
		{
			var _inst = instance_id[i];
			if (object_get_name(_inst) = "Osweatbeads")
			{
				with (_inst)
				{
					if (char_track != _id)
					{
						with (instance_create_depth(0, 0, depth, Osweatbeads))
						{
							char_track = _id;
							h_mod = 2;
						}
					}
				}
			}
		}
	}
	
	if (alarm[0] = -1){ alarm[0] = 60; }
}