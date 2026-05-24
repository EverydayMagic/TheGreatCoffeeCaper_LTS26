if (global.saveslot_story[global.saveslot][STORY_PACE.WHERE_GOING] = true)
{
	instance_destroy();
	exit;
}

if ((place_meeting(x, y, Oplayer) || global.cutsceneActive))
{
	ex_cutscene(cutscene);	
}















