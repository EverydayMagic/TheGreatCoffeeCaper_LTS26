if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_CLAWDINE_BEFORE_INVEST] = 0)//if Talk to Clawdine Before Invest not done
{
	if (instance_exists(Ointeractbox))
	{
		if (place_meeting(x, y, Ointeractbox) && !instance_exists(Otextbox))
		{
			cutsceneing = true;	
		}
	}
} else instance_destroy();

if (cutsceneing)
{
	ex_cutscene("Meet Clawdine before invest");
}

















