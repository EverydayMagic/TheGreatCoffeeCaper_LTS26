depth = -y;

visible =! instance_exists(Ofade);

if (appled)
{
	for (var _apple_count = 0; _apple_count < apple_max; _apple_count++)
	{
		var _ap_x = x - 8 + (8 * _apple_count);
		var _ap_y = y - 24 - (8 * _apple_count);
		if (_apple_count = 2){ _ap_y = y - 24; }
		
		instance_create_depth(_ap_x, _ap_y, depth - 10, Oapple);
	}
	apple_max = 0;
}
show_debug_message("apples: " + string(instance_number(Oapple)));