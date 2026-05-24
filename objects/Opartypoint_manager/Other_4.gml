var _player = Oplayer;
if (!instance_exists(Oplayer))
{
	if (instance_exists(Ohoots_cutscene))
	{
		_player = Ohoots_cutscene;	
	}
}

//create points if they haven't already been made (this is for when you load into a file)
if (instance_exists(_player) && !instance_exists(Opartypoint))
{
	for (var s = 0; s < party_size; s++)
	{
		with (instance_create_depth(x, y, depth, Opartypoint))
		{
			record = 20 * (s + 1);	
		}
	}
}

//changing position of points when room transitions
if (instance_exists(Ofade) && instance_exists(Opartypoint))
{
	if (Ofade.trans_type = "map")
	{
		with (Opartypoint)
		{
			x += 160 * -Ofade.horz;
			y += 144 * -Ofade.vert;
		}
		for (var r = array_size - 1; r > 0; r--)
		{
			pos_x[r] += 160 * -Ofade.horz;
			pos_y[r] += 144 * -Ofade.vert;
		}
	}
}




