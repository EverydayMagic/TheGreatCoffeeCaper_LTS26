if (instance_exists(Ointeractbox))
{
	if (place_meeting(x, y, Ointeractbox))
	{
		if (!global.lamps_on)
		{
			on =! on;
			onoff_num++;
		} else {
			if (!instance_exists(Otextbox))
				create_textbox("lamp did this");
		}
	}
}

if (on)
	image_index = 0;
else
	image_index = 1;



if (onoff_num > 200 && !global.lamps_on)
{
	global.lamps_on = true;
	alarming = true;
	alarm[0] = 1;
}

if (global.lamps_on && !alarming)
{
	alarming = true;
	alarm[0] = 1;	
}

depth = -y;