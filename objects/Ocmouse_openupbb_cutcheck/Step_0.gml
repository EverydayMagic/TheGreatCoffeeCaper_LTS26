if (!global.cutsceneActive)
{
	if (instance_exists(Ointeractbox) && !cutting)
	{
		if (place_meeting(x, y, Ointeractbox))
		{
			if (global.saveslot_story[global.saveslot][STORY_PACE.OPEN_UP_BANDITS] = 0)
			{
				if (global.saveslot_story[global.saveslot][STORY_PACE.LOVELETTER_FOUND] = 1)
				{
					cut = "Open Up Bandits";
				} else cut = "Open Up Bandits BeforeLetter";
				
			} else instance_destroy();
		}
	}
}

if (cut != 0){ ex_cutscene(cut); cutting = true; }


if (instance_exists(Oplayer)){ depth = Oplayer.depth + 5; }
if (instance_exists(Ohoots_cutscene)){ depth = Ohoots_cutscene.depth + 5; }



if (instance_exists(Ocharliemouse_cutscene)){ visible = false; }








