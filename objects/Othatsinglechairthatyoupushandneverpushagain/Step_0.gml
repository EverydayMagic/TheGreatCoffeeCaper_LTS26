
if (Ocluehunt.cluehunt_active && instance_exists(Oplayer) && x != 112)
{
	if (pushing)
	{
		if (x < 112)
		{
			x += 16/30;
		} else {
			x = 112;
			pushing = false;
			global.gamePaused = false;
			
			with (Ocol)
			{
				if (special = true){ instance_destroy(); }
			}
			with (instance_create_layer(114, 80, "Col_Broken", Ocol))
			{
				image_xscale = 1.5;
				image_yscale = 2;	
			}
		}
	}
	
	if (point_distance(x, y, Oplayer.x, Oplayer.y) <= 16 && x != 112)
	{
		if (!pushing)
		{
			image_index = 1;
			
			if (instance_exists(Ointeractbox) && round(Oplayer.direction/90) = 0)
			{
				if (place_meeting(x, y, Ointeractbox))
				{
					image_index = 2;
					pushing = true;
					global.gamePaused = true;
				}
			}
		}
	} else {
		if (!pushing)
			image_index = 0;	
	}	
}

if (!Ocluehunt.cluehunt_active && x = 112)
{
	if (instance_exists(Ointeractbox) && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle)
	{
		if (place_meeting(x, y, Ointeractbox))
		{
			create_textbox("chairpushed");	
		}
	}
}






















