if (instance_exists(Oplayer) && Oplayer.state = PlayerStateFree)
{
	if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)//Invest Cup O Joe not done
	{
		if (instance_exists(Ointeractbox) && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle)
		{
			if (place_meeting(x, y, Ointeractbox))
			{
				if (!keepscool)
				{
					create_textbox("foxkeepscool");
					keepscool = true;
				} else {
					create_textbox("alwayskeepscool");	
				}
			}
		}
	}
}

if (instance_exists(Oplayer) && Oplayer.state = PlayerStateFree)
{
	if (global.saveslot_story[global.saveslot][STORY_PACE.CONFRONT_IN_SNIFF_HOUSE] = 1 && room = Rbeforeneighborhood)
	{
		show_debug_message("TEXT: " + string(instance_exists(Otextbox)));
		if (instance_exists(Ointeractbox) && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle)
		{
			if (place_meeting(x, y, Ointeractbox))
			{
				if (global.saveslot_story[global.saveslot][STORY_PACE.SLICK_QUEST] = 0)
				{
					ex_cutscene("Slick Quest");
					slickquest = true;
				} else {
					create_textbox("ainttalkcoin");
				}
			}
		}	
	}
}
/*

if (global.saveslot_story[global.saveslot][STORY_PACE.CONFRONT_IN_SNIFF_HOUSE] = 1 && room = Rbeforeneighborhood)
{
	show_debug_message("TEXT: " + string(instance_exists(Otextbox)));
	if (instance_exists(Ointeractbox) && !instance_exists(Otextbox) && !global.gamePaused)
	{
		if (place_meeting(x, y, Ointeractbox))
		{
			if (global.saveslot_story[global.saveslot][STORY_PACE.SLICK_QUEST] = 0)
			{
				ex_cutscene("Slick Quest");
				slickquest = true;
			} else {
				create_textbox("ainttalkcoin");
			}
		}
	}	
}

*/

if (slickquest)
{
	ex_cutscene("Slick Quest");	
}

depth = -y;



















