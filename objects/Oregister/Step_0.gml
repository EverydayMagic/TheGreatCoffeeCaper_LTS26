if (instance_exists(Ointeractbox))
{
	if (place_meeting(x, y, Ointeractbox) && Oplayer.x < x && Oplayer.y > (y - 7))
	{
		if (!moving)
		{
			moving = true;
			image_speed = 1;
		}
	}
}

//open the register
if (!open)
{
	if (moving)
	{
		sprite_index = Sregister_open;
		if (image_index >= image_number - 1)
		{
			open = true;
			moving = false;
		}
	} else {
		sprite_index = Sregister_idle;
		image_index = 0;
		image_speed = 0;
	}
}

//close the register
if (open)
{
	if (moving)
	{
		sprite_index = Sregister_close;
		if (image_index >= image_number - 1)
		{
			open = false;
			moving = false;
			register_count++;
		}
	} else {
		sprite_index = Sregister_idle;
		image_index = 1;
		image_speed = 0;
	}
}



if (instance_exists(Oplayer))
{
	if (Oplayer.y < (y - 8))
		depth = Oplayer.depth - 1;
	else
		depth = Oplayer.depth + 1;
}







