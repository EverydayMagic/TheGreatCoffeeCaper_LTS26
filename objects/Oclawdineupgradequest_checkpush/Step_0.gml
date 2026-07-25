var _inst =  instance_place(x, y, Opushblock);
if (instance_exists(_inst))
{
	if (_inst.xspd = 0 && _inst.yspd = 0)
	{
		//start cutscene
		if (global.saveslot_story[global.saveslot][STORY_PACE.CLAWDINE_UPGRADE_QUEST] = 0 && global.saveslot_story[global.saveslot][STORY_PACE.CLAWDINE_UPGRADE_QUEST_BEFOREPUSH] = 1)
		{
			ex_cutscene("Clawdine Upgrade Quest");
		} else if (global.saveslot_story[global.saveslot][STORY_PACE.CLAWDINE_UPGRADE_QUEST] = 1) {
			instance_destroy();
		}
	}
}

//continue cutscene
if (global.cutsceneActive && global.story_beat = STORY_PACE.CLAWDINE_UPGRADE_QUEST)
{
	ex_cutscene("Clawdine Upgrade Quest");
}