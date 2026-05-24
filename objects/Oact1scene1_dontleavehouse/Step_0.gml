//if (global.saveslot_story[global.saveslot][1][1] = 1 && Oitem_manager.inv[0].name != "Unknown")
//{
//	with (instance_create_depth(70, 132, -bbox_bottom, Owarp_block))
//	{
//		target_x = 72;
//		target_y = 84;
//		dest = Routsidehooters;
//		inout = true;
//		trans_type = "iris";
//		image_xscale = 2.5;
//		party_dir = 1;
//	}
	
//	instance_destroy();
//} else {
//	if (place_meeting(x, y, Oplayer) && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle)
//	{
//		if (global.saveslot_story[global.saveslot][1][1] = 1  && Oitem_manager.inv[0].name = "Unknown")
//		{
//			if (!instance_exists(Otextbox))
//				Oplayer.y -= 1;
//			create_textbox("hootshousedontleave");
//		}
//	}
//}

if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && Oitem_manager.inv[0].name != "Unknown")
{
	with (instance_create_depth(70, 128, -bbox_bottom, Owarp_block))
	{
		target_x = 72;
		target_y = 84;
		dest = Routsidehooters;
		inout = true;
		trans_type = "iris";
		image_xscale = 2.5;
		party_dir = 1;
	}
	
	instance_destroy();
} else {
	if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1  && Oitem_manager.inv[0].name = "Unknown")
	{
		if (place_meeting(x, y, Oplayer) && !instance_exists(Otextbox) && !global.gamePaused)
		{
			if (!instance_exists(Otextbox))
				Oplayer.y -= 1;
			create_textbox("hootshousedontleave");
		}
	
	}
}








