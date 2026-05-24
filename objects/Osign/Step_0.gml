//var _inst = [Oplayer, Ohoots_cutscene, Ocharliemouse, Ocharliemouse_cutscene, Opuffy, Ostump, Oegg_stroller, Osniffles];
//for (var i = 0; i < array_length(_inst); i++)
//{
//	if (instance_exists(_inst[i]))
//	{
//		if (y < _inst[i].y)
//			depth = below_depth;
//		else
//			depth = above_depth;
//	}
//}

if (instance_exists(Oplayer))
{
	if (instance_exists(Ointeractbox) && !instance_exists(Otextbox) && !bookwormed && !Ocluehunt.cluehunt_active && !global.gamePaused && !Ocluehunt.trans_to_battle)
	{
		if (place_meeting(x, y, Ointeractbox)) 
		{
			if (global.debugActive = true){ Odebugperst.interacting_with[0] = self.object_index; Odebugperst.interacting_with[1] = self.id;}
			
			if (Oplayer.direction = 270)
			{
				if (Oplayer.y < y)
				{
					create_textbox("sign_behind");	
				}
			}
			if (Oplayer.direction = 90)
				create_textbox(text_id);
		}
	}
}

depth = -y;

if (instance_exists(Obookworm))
	Obookworm.depth = depth - 1;
else
	bookwormed = false;







