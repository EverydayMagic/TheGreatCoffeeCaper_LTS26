if (global.story_beat = 1 && sprite_index != idle_talk_spr)
	time_source_start(sniff_time);
else
	time_source_stop(sniff_time);


if (global.story_beat >= 17 && global.story_beat < 21)
{
	if (instance_exists(Ointeractbox))
	{
		if (place_meeting(x, y, Ointeractbox) && !instance_exists(Otextbox))
		{
			create_textbox("snifflesstroller_outstage");
		}
	}
}

if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0 && room = Routcoffeehouse)//Invest Cup O Joe not done
{
	if (instance_exists(Ointeractbox) && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle)
	{
		if (place_meeting(x, y, Ointeractbox))
		{
			create_textbox("snifflesoutshop");	
		}
	}
}

depth = -y;


