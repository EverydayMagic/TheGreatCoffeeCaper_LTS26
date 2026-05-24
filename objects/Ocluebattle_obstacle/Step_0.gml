
//for (var i = 0; i < array_length(Ocluebattle_manager.spark_ids); i++)
//{
//	var _spark = Ocluebattle_manager.spark_ids[i];
//	if (instance_exists(_spark) && !decoration)
//	{
//		if ((place_meeting(uni_col.x, uni_col.y, _spark) || place_meeting(_spark.x, _spark.y, uni_col)) && !_spark.being_attacked)
//		{
//			if (_spark.y < y)
//				depth = _spark.depth - 1;
//			else
//				depth = _spark.depth + 1;
			
//			//show_debug_message("BOOK Y: " + string(y));
//			//show_debug_message("SPARK Y: " + string(_spark.y));
//		}
//	}
//}


//if (decoration)
//{
//	if (instance_exists(Ospark_enemy))
//		depth = Ospark_enemy.depth + 1;
//	else
//		depth = Omglass.depth + 1;
//}

//for (var i = 0; i < array_length(Ocluebattle_manager.spark_ids); i++)
//{
//	if (instance_exists(Ocluebattle_manager.spark_ids[i]))
//	{
//		if ((Ocluebattle_manager.spark_ids[i].target_x = x && Ocluebattle_manager.spark_ids[i].target_y = y) || (Ocluebattle_manager.spark_ids[i].x = x && Ocluebattle_manager.spark_ids[i].y = y))
//		{
//			taken = true;
//			break;
//		} else {
//			taken = false;	
//		}
//	}
//}

for (var i = 0; i < array_length(Ocluebattle_manager.spark_ids); i++)
{
	var _spark = Ocluebattle_manager.spark_ids[i];
	
	if (instance_exists(_spark))
	{	
		if ((_spark.target_x = x && _spark.target_y = y) || (_spark.x = x && _spark.y = y))
		{
			taken = true;
			break;
		} else {
			taken = false;	
		}
	}
}

depth = -60;