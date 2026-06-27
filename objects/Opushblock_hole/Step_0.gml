//var _cantfill = false;
//var _fl = full;
//with (Opushblock_hole)
//{
//	if (full)
//	{
//		_cantfill = true;
//		if (_fl = full){ _cantfill = false; } else { break; }
//	}
//}
if (full_by != noone)
{
	//special case for player
	if ((place_meeting(x, y, Ohootbox) || full_by = Oplayer) && instance_exists(Oplayer))
	{
		if (instance_exists(Osweatbeads)){ instance_destroy(Osweatbeads); }
		sprite_index = Spushblock_hole_hootsfall;
		if (image_index < image_number - 1)
		{
			full = true;
			image_speed = 1;
			Oplayer.visible = false;
			Oplayer.state = PlayerStateLocked;
				
			//if there's Charlie, do a "!" bubble
			if (instance_exists(Ocharliemouse))
			{
				with (instance_create_depth(x, y, Ocharliemouse.depth, Obubble))
				{
					char_track = Ocharliemouse;
					bubble_type = 5;
					kill_time = 5;
					h_mod = 1;
				}
			}
		} else {
			image_speed = 0;
			if (alarm[0] = -1)
			{ 
				alarm[0] = 5;
				with (Opushblock_hole)
				{
					col = instance_create_layer(x, y, "Col", Ocol);
					with (col)
					{
						image_xscale = 2;
						image_yscale = 2;
					}
				}
			}
		}
	} else {
		switch (full_by.sprite_index)
		{
			case Scrate:
				image_index = 1;
			break;
		
			default: image_index = 1; break;
		}	
	}
}
if (image_index != 0)
{
	if (full_by != Oplayer){ instance_destroy(full_by); full_by = noone; }
}
