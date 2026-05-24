
//for (var i = 0; i < array_length(Ocluebattle_manager.spark_ids); i++)
//{
//	var _inst = Ocluebattle_manager.spark_ids[i];
	
	
//	if (instance_exists(_inst))
//	{
//		taken = (_inst.x = x) and (_inst.y = y) and (_inst.cur_hp > 0);
//	}	
	
//	if (taken){ break; }
//}

if (instance_exists(Ospark_enemy))
{
	var _spot = self.id;
	with (Ospark_enemy)
	{
		var _onspot = (x = _spot.x && y = _spot.y)
		var _headtospot = (target_x = _spot.x && target_y = _spot.y)
		
		taken = (_onspot || _headtospot);
		
		if (taken){ break; }
	}
}


//show_debug_message("ID: " + string(self.id) + " TAKEN: " + string(taken));














