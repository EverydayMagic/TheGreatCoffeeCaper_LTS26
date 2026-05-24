//Spawning in the Rain
if (room = Rgame_start)
{
	if (Ostartstart.beat >= 7)
		visible = true;
	else
		visible = false;
} else visible = true;

while (instance_number(Orain) < 25)
{
	if (spawn = "up")
	{
		var _sx = irandom_range(0, camera_get_view_width(VIEW) - 10);
		var _sy = irandom_range(-20, -5);
	} else {
		var _sx = irandom_range(camera_get_view_width(VIEW) + 5, camera_get_view_width(VIEW) + 20);
		var _sy = irandom_range(0, camera_get_view_height(VIEW) - 5);
	}
	
	instance_create_depth(_sx, _sy, depth, Orain);
}

//Movement of Rain
if (x > death_x && y < death_y)
{
	if (!instance_exists(Ofade))
	{
		x -= spd;
		y += spd;
	}
} else {
	
	if (sprite_index != Sraindrop)
	{
		sprite_index = Sraindrop;	
	} else {
		if (image_index > image_number - 1)
			instance_destroy();
	}
}


if (instance_exists(Ofade))
	depth = Ofade.depth + 1;








