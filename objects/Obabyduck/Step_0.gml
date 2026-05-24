depth = -y;

if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)//Invest Cup O Joe not done
{
	if (instance_exists(Ointeractbox) && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle)
	{
		if (place_meeting(x, y, Ointeractbox))
		{
			switch (duck_type)
			{
				case 0:
					create_textbox("needmacawfee");	
				break;
				case 1:
					create_textbox("fowestdwink");	
				break;
				case 2:
					create_textbox("earlgrey");
				break;
			}
		}
	}
}



















