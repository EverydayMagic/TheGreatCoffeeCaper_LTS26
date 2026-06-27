///@description falls in a row
if (instance_exists(Oplayer))
{
	with (Opushblock_hole)
	{
		if (full_by = Oplayer)
		{
			//force reset
			sprite_index = Spushblock_hole;
			image_index = 0;
			image_speed = 0;
			full_by = noone;
			full = false;
			with (Oplayer)
			{
				ResetRoomPos(); //take back to room start pos
			}
			if (instance_exists(Opartypoint))
			{
				Oplayer.sprite_index = Splayer_capidle;
				Oplayer.image_index = 3;
			}
			Oplayer.visible = true;
			Oplayer.state = PlayerStateFree;
			Oplayer.state_manual = false;
			Opartypoint_manager.reset_points();
			with (Opushblock_hole){ alarm[1] = 15; }
			Oplayer.alarm[2] = 1;
		}
	}
}