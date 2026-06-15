function trojandeerconfront_text(_text_id){
	switch (_text_id)
	{
		case "layoncharm":
			Text("Alright, you knock on the door, I'll lay on the charm.", "Charlie Regular");
				pause(8, 8, 5);
				pause(31, 31, 5);
			Text("Once Stump is head over heels for the deer, you sneak in.", "Charlie Regular");
				pause(43, 43, 5);
			Text("Got it?", "Charlie Regular");
			add_move_order();
		break;
		case "zzzidont":
			Text("zzzzz", "Hoots Sleep");
				text_wave(0, 4);
				textspeed_change(0.25);
			Text("I don't believe this.", "Charlie Regular");
			add_move_order();
		break;
		case "hootwhatgoing":
			Text("Hoot hoot?&What's going on?", "Hoots Shocked");
				pause(10, 10, 5);
			add_move_order();
		break;
		case "justknockondoor":
			Text("Just knock on the door and stay out of sight!", "Charlie Regular");
				talk_turn(Ohoots_cutscene, Splayer_capsit_shock_side, 1);
			add_move_order();
		break;
		case "ohstumpy":
			Text("Oh Stumpy!&It's me! Your secret admirer!", "Charlie Regular");
				pause(10, 10, 5);
				pause(19, 19, 5);
				textvoice_change(snd[page_number - 1], 1.25);
			add_move_order();
		break;
		case "igotyourletterand":
			Text("I got your letter, and I'm ready to come into the-", "Charlie Regular");
				pause(18, 18, 5);
				textvoice_change(snd[page_number - 1], 1.25);
			add_move_order();
		break;
		case "heynowwhats":
			Text("Hey now!&What's going on!?", "Charlie RedShocked");
				pause(8, 8, 5);
			Text("*SMOOOOOOOOCH!*", "Stump Love");
				pause(3, 8, 3);
			Text("I'm as passionate as the next deer, but this is really too-", "Charlie Red");
				pause(35, 35, 5);
			Text("*SMOOCH!*&*SMACK!*&*SMOOCH!*", "Stump Love");
				pause(9, 9, 3);
				pause(18, 18, 3);
			add_move_order();
		break;
		case "stumpyyell":
			Text("STUMPY!");
				talk_turn(Ostump, Sstump_kisstrojan_shock);
			add_move_order();
		break;
		case "lovingwildbuck":
			Text("Stump, you two-timing free-loving wild buck!");
				pause(6, 6, 3);
			Text("Did my letter mean nothing to you?");
			Text("?!", "Stump Regular");
			Text("I've never been so humiliated in my life!");
			add_move_order();
		break;
		case "justasplanned":
			Text("Excellent!&Just as I planned!", "Hoots Happy");
				pause(10, 10, 5);
			Text("What?!&No one could have planned that!", "Charlie Regular");
				pause(6, 6, 5);
			Text("A great detective's intuition is quite mysterious...", "Hoots Eyes Closed");
			Text("Nearly as puzzling as the mysteries he solves!", "Hoots Regular");
			Text("And love is the greatest mystery of them all...", "Hoots Regular");
			Text("Let's just go inside...", "Charlie FacePalm");
				talk_turn(Ocharliemouse_cutscene, Scmouse_embarrassed_cap);
			add_move_order();
		break;
		
	}
}
