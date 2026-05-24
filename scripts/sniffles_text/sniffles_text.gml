function sniffles_text(_text_id){
	switch(_text_id)
	{
		case "snifflesstroller_outstage":
			if (global.saveslot_npc_story[global.saveslot][0][1] = 0)
			{
				Text("Hello detective!", "Sniffles Happy");
				Text("My lovely niece and I are taking a walk around town!", "Sniffles Happy"); 
				global.saveslot_npc_story[global.saveslot][0][1] = 1;
			
			} else if (global.saveslot_npc_story[global.saveslot][0][2] = 0) {
				Text("Detective?", "Sniffles Regular");
				Text("Why are you looking at me like my house is in danger?", "Sniffles...");
					talk_turn(Osniffles, Ssniffles_stroller_shock);	
				global.saveslot_npc_story[global.saveslot][0][2] = 1;
				
			} else if (global.saveslot_npc_story[global.saveslot][0][2] = 1) {
				Text("...", "Sniffles...");
					talk_turn(Osniffles, Ssniffles_stroller_shock);	
					pause(0, 2, 5);
				global.saveslot_npc_story[global.saveslot][0][3] = 1;	
			}
		break;
		
		case "snifflesstroller_outstage_pt2":
			
			global.sniffles_interactions[global.saveslot][0][1] = 1;
		break;
		
		case "snifflesstroller_outstage_pt3":
			
			global.sniffles_interactions[global.saveslot][0][2] = 1;
		break;
	}
}