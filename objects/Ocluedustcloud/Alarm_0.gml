/// @description fade in
if (instance_exists(Oplayer))
{
	if (image_alpha < 1)
	{
		image_speed = 1;
		image_alpha += 1/15;
		alarm_set(0, 1);
	} else {
		//create next cloud
		var _xmod = irandom_range(-3, 3);
		var _ymod = irandom_range(-2, 2);
		instance_create_depth(Oplayer.x + _xmod, Oplayer.y + _ymod, Oplayer.depth - 1, Ocluedustcloud);
	
		image_speed = 0;
		image_alpha = 1;
		alarm[1] = 1;
	}
}















