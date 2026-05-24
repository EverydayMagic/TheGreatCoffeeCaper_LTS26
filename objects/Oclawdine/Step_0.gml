#region Prior to Story Beat 21 stuff

	if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)//if Invest CupOJoe not done
	{
		if (sprite_index = Sclawdine_slash && image_index >= (image_number - 1))
		{
			image_index = (image_number - 1);
			image_speed = 0;
			if (alarm[0] = -1){ alarm[0] = 10; }
		}
	}

	

#endregion

//hoots depth control
//if (instance_exists(Oplayer))
//{
//	if (Oplayer.y < y){ depth = Oplayer.depth - 5; } else { depth = old_depth; }	
//}

//show_debug_message("CLAWDINE DEPTH: " + string(depth));
//if (instance_exists(Oplayer))
//	show_debug_message("HOOTS DEPTH: " + string(Oplayer.depth));
if (!depth_manual)
	depth = -y;
