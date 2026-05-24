
var _sparks = [
	Ospark_enemy,
	Obigsparkboss,
]

for (var i = 0; i < array_length(_sparks); i++)
{
	if (instance_exists(_sparks[i]))
	{
		if (!global.battle_lock && (instance_number(_sparks[i]) > 0))
		{
			if (abs(handle_rot) < 359)
			{
				handle_rot -= (360/total_time);
				time_elapsed = round(abs(total_time * (handle_rot/360)));
			} else handle_rot = -360;
		}
	}
}


//loop every second
//alarm_set(0, 30);







