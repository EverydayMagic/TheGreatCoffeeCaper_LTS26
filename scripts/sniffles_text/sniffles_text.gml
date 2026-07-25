function sniffles_text(_text_id){
	switch(_text_id)
	{
		case "snifflesstroller_outstage":
			if (global.saveslot_story[global.saveslot][STORY_PACE.SNIFFLES_STROLLER_OUTSTAGE_1] = 0)
			{
				Text("Hello detective!", "Sniffles Happy");
				Text("My lovely niece and I are taking a walk around town!", "Sniffles Happy"); 
				global.saveslot_story[global.saveslot][STORY_PACE.SNIFFLES_STROLLER_OUTSTAGE_1] = 1;
			
			} else if (global.saveslot_story[global.saveslot][STORY_PACE.SNIFFLES_STROLLER_OUTSTAGE_2] = 0) {
				Text("Detective?", "Sniffles Regular");
				Text("Why are you looking at me like my house is in danger?", "Sniffles...");
					talk_turn(Osniffles, Ssniffles_stroller_shock);	
				global.saveslot_story[global.saveslot][STORY_PACE.SNIFFLES_STROLLER_OUTSTAGE_2] = 1;
				
			} else if (global.saveslot_story[global.saveslot][STORY_PACE.SNIFFLES_STROLLER_OUTSTAGE_2] = 1) {
				Text("...", "Sniffles...");
					talk_turn(Osniffles, Ssniffles_stroller_shock);	
					pause(0, 2, 5);
				global.saveslot_story[global.saveslot][STORY_PACE.SNIFFLES_STROLLER_OUTSTAGE_3] = 1;
			}
		break;
	}
}