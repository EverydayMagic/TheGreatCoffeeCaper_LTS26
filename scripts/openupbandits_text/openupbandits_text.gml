function openupbandits_text(_text_id){
	switch(_text_id)
	{
		case "openupbandits_beforeletter":
			Text("Open up you no-good bean bandits!", "Charlie DoorBang");
				talk_turn(Ocharliemouse_cutscene, Scmouse_doorbang);
			Text("Keep dat door shut, Stump!", "Puffy Distressed");
			Text("It's no use!", "Charlie Distressed");
				if (instance_exists(Ohoots_cutscene)) //talkturn
				{
					if (round(Ohoots_cutscene.direction/90) = 0)
					{
						talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_side, -1, true);	
					} else if (round(Ohoots_cutscene.direction/90) = 1) {
						talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_front);		
					}
				}
			Text("That deer has the door shut tight!", "Charlie DoorBang");
				talk_turn(Ocharliemouse_cutscene, Scmouse_doorbang);
			Text("What do we do, Hootsworth!?", "Charlie Distressed");
				if (instance_exists(Ohoots_cutscene)) //talkturn
				{
					if (round(Ohoots_cutscene.direction/90) = 0)
					{
						talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_side, -1, true);	
					} else if (round(Ohoots_cutscene.direction/90) = 1) {
						talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_front);		
					}
				}
			add_move_order();
		break;
		
		case "openupbandits":
			Text("Open up you no-good bean bandits!", "Charlie DoorBang");
				talk_turn(Ocharliemouse_cutscene, Scmouse_doorbang);
			Text("Keep dat door shut, Stump!", "Puffy Distressed");
			add_move_order();
		break;
		case "itnouse":
			Text("It's no use!", "Charlie Distressed");
				if (instance_exists(Ohoots_cutscene)) //talkturn
				{
					if (round(Ohoots_cutscene.direction/90) = 0)
					{
						talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_side, -1, true);	
					} else if (round(Ohoots_cutscene.direction/90) = 1) {
						talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_front);		
					}
				}
			Text("That deer has the door shut tight!", "Charlie DoorBang");
				talk_turn(Ocharliemouse_cutscene, Scmouse_doorbang);
			Text("What do we do, Hootsworth!?", "Charlie Distressed");
				if (instance_exists(Ohoots_cutscene)) //talkturn
				{
					if (round(Ohoots_cutscene.direction/90) = 0)
					{
						talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_side, -1, true);	
					} else if (round(Ohoots_cutscene.direction/90) = 1) {
						talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_front);		
					}
				}
			add_move_order();
		break;
		case "hmmthink":
			Text("Hmm...&(Think, think...)", "Hoots Think");
				pause(6, 6, 15);
				talk_turn(Ohoots_cutscene, Splayer_capthink);
			Text("In situations like this, I like to sit down...", "Hoots Regular");
				pause(24, 24, 5);
				talk_turn(Ohoots_cutscene, Splayer_capsit, 0, false, 25); 
			Text("and...", "Hoots Drowsy");
				textspeed_change(0.5);
			Text("think through things...", "Hoots Yawn");
				textspeed_change(0.3);
				talk_turn(Ohoots_cutscene, Splayer_capsit_yawn);
			add_move_order();
		break;
		case "hootssnore":
			Text("*SNORE*", "Hoots Sleep");
		break;
		case "charlieyellhoots":
			Text("Hootsworth!", "Charlie Distressed");
			Text("Hoot?", "Hoots Drowsy");
				talk_turn(Ohoots_cutscene, Splayer_capsit);
			add_move_order();
		break;
		case "ahyes":
			Text("Ah, yes!", "Hoots Happy");
				talk_turn(Ohoots_cutscene, Splayer_capidle, 3);
				pause(3, 3, 5);
			Text("I found this on the ground just over there.", "Hoots Happy");
				talk_turn(Ohoots_cutscene, Splayer_capidle, 2);
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0);
			Text("Hootsworth handed 'Love Letter' to Charlie.");
				text_color(18, 30, orange_col, orange_col, orange_col, orange_col);
			Text("Poor Stump must have dropped it when he ran...", "Hoots Regular");
			Text("What luck!", "Charlie Happy");
			Text("Let's read what it says!", "Charlie Happy");
			Text("Dearest...", "Hoots PaperRead");
				talk_turn(Ohoots_cutscene, Splayer_paperread, 0);
			add_move_order();
		break;
		case "mrstumplongwords":
			Text("...", "Hoots PaperReadSquint");
				talk_turn(Ohoots_cutscene, Splayer_paperread, 1);
				pause(0, 2, 10);
			Text("Charlie?", "Hoots PaperReadTrouble1");
			Text("I'm afraid Mr.Stump has done something terrible...", "Hoots PaperReadTrouble1");
			Text("What?&What do you see?", "Charlie Distressed");
				talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_side);
				pause(5, 5, 5);
			Text("It seems our friend Stump uses very long words...", "Hoots PaperReadTrouble2");
				talk_turn(Ocharliemouse_cutscene, Scmouse_embarrassed_cap, 0, false, 35);
			Text("(And the terribly difficult kind at that...)", "Hoots PaperReadTrouble1");
			Text("Here Hootsworth, let me see...", "Charlie Happy");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0);
				pause(16, 16, 10);
			add_move_order();
		break;
		case "ohmydisturbing":
			Text("Hmm...&Mhm, mhm...", "Charlie PaperRead");
				pause(6, 6, 15);
				pause(11, 11, 5);
			Text("Oh my...", "Charlie PaperReadRed");
				talk_turn(Ocharliemouse_cutscene, Scmouse_readpaper, 1);
			Text("How disturbing...", "Charlie PaperReadRed");
			Text("Hootsworth?", "Charlie PaperRead");
				talk_turn(Ocharliemouse_cutscene, Scmouse_readpaper, 0);
			Text("Hmm?", "Hoots Regular");
				talk_turn(Ohoots_cutscene, Splayer_capidle, 2);
			Text("This love littered letter gives me an idea!", "Charlie Happy");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0);
			Text("If we could build a secret admirer for Stump...", "Charlie Curious");
				talk_turn(Ocharliemouse_cutscene, Scmouse_think, 0);
			Text("Then we could sneak our way in and stop Puffy!", "Charlie PumpedFist");
				talk_turn(Ocharliemouse_cutscene, Scmouse_pumpfist);
			Text("How clever!&Glad we thought of it!", "Hoots Happy");
				pause(11, 11, 10);
			Text("Hehe...&Yeah, 'we'...", "Charlie Heh");
				talk_turn(Ocharliemouse_cutscene, Scmouse_sweat_side, -1, true);
				pause(7, 7, 10);
				pause(13, 13, 10);
			Text("But where can we find someone to build it?", "Charlie Curious");
				talk_turn(Ocharliemouse_cutscene, Scmouse_think, 0);
			Text("I'm sure someone in the forest could assist!", "Hoots Happy");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0);
			add_move_order();
		break;
		
		
		case "openupbandits_aftercut":
			Text("Keep dat door shut, Stump!", "Puffy Distressed");
			Text("Looks like we need to find another way inside...", "Charlie Curious");
		break;
	}
}
