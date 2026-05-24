for (var i = 0; i < array_length(Ocluebattle_manager.spark_ids); i++)
{
	if (instance_exists(Ocluebattle_manager.spark_ids[i]))
	{
		if (Ocluebattle_manager.spark_ids[i].target_x = x && Ocluebattle_manager.spark_ids[i].target_y = y)
		{
			taken = true;
			break;
		} else {
			taken = false;	
		}
	}
}

show_debug_message("runway x: " + string(x) + " y: " + string(y));














