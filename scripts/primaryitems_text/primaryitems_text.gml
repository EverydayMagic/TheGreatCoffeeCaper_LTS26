function primaryitems_text(_text_id){
	switch (_text_id)
	{
		#region Charlie Talks
		
			case "surelythereareclues":
				Text("I'm sure you can find some clues in here!", "Charlie Happy");
				add_move_order();
			break;
			
			case "sparkbybarrel":
				Text("I think I saw some sparkles over by those barrels...", "Charlie Curious");
					talk_turn_auto(Ocharliemouse_cutscene, 2, 3, 0, 1, Scmouse_idle);
			break;
			
			case "oneclueleft":
				Text("There might be more clues. Try looking behind things...", "Charlie Curious");
					pause(27, 27, 10);
					talk_turn_auto(Ocharliemouse_cutscene, 2, 3, 0, 1, Scmouse_idle);
			break;
		
		#endregion

		#region CloudPuff Found

			case "whatfluffything":
				Text("What do you suppose this fluffy thing is?", "Hoots Curious");
				Text("Hmm...A cotton ball?&A rabbit's tail?", "Charlie Curious");
					pause(5, 5, 10);
					pause(20, 20, 10);
				Text("...!", "Charlie Shocked");
				Text("Could it be the severed organs of a stuffed animal?!", "Charlie Distressed");
					talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_backward);
				Text("Perhaps we should keep looking.", "Hoots Regular");
					talk_turn(Ohoots_cutscene, Splayer_capidle, 2);
					talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 1);
				Text("I have a feeling there's more clues to be found...", "Hoots Regular");
					talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 2);
				add_move_order();
			break;
	
		#endregion
		
		#region BlueHat Found
			
			case "dappercap":
				Text("What a dapper cap if I do say so myself.", "Hoots Happy");
				Text("Looks like our thief has a good sense of fashion!", "Charlie Curious");
				Text("Hoot hoot?", "Hoots Curious");
					talk_turn(Ohoots_cutscene, Splayer_capidle, 1);
				Text("What's that shining over there?", "Hoots Curious");
				add_move_order();
			break;
			
		#endregion
		
		#region MusicSheet Found
		
			case "strangewriting":
				Text("What strange writing!", "Charlie Curious");
				Text("Looks like a careful arrangement of notes", "Charlie Curious");
					pause(44, 44, 10);
				Text("Yes, yes...&Perhaps so...", "Hoots Curious");
					pause(3, 3, 5);
					pause(11, 11, 10);
				Text("Or...", "Hoots Curious");
					talk_turn(Ohoots_cutscene, Splayer_capidle, 3);
				Text("A secret code to lead us to the thieves...", "Hoots Curious");
				Text("With musical notes to cover the trail...", "Hoots Curious");
				Text("How bothersome...", "Hoots Curious");
				Text("Er-&Hootsworth?", "Charlie Red");
					pause(3, 3, 10);
				Text("Precisely so...", "Hoots Regular");
					//pause(6, 6, 10);
				Text("Hootsworth?", "Charlie Um");
				Text("I can hear the notes now...", "Hoots Happy");
				Text("Da...&Da du dee...&Da dum...", "Hoots Happy");
					pause(5, 5, 10);
					pause(18, 18, 10);
				Text("Hootsworth!!", "Charlie Distressed");
					talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_side, -1, true);
				Text("Oh!", "Hoots Regular");
					talk_turn(Ohoots_cutscene, Splayer_capidle, 0);
					talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 2);
				Text("Yes Charlie?", "Hoots Happy");
				Text("I think it's just sheet music...", "Charlie Um");
				Text("Of course Charles!&What else might it be?", "Hoots Happy");
					pause(18, 18, 10);
				add_move_order();
			break;
		
		#endregion
	
	}

}