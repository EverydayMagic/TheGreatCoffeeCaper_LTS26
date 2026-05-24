if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)//Invest Cup O Joe not done
{
	if (instance_exists(Ointeractbox) && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle)
	{
		if (place_meeting(x, y, Ointeractbox))
		{
			create_textbox("jittersjoeclosed");	
		}
	}
}

depth = -y;














