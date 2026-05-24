function meetclawdine_text(_text_id){
	switch (_text_id)
	{
		case "clawdine?":
			Text("Clawdine?", "Hoots Regular");
			add_move_order();
		break;
		case "maybenothere":
			Text("Maybe she's not here?", "Charlie Curious");
			Text("I guess we'll have to find someone else who can build-", "Charlie Um");
				talk_turn(Ocharliemouse_cutscene, Scmouse_sweat_side, -1, true);
			add_move_order();
		break;
		case "someonesaybuild":
			Text("Did someone say build?!", "Clawdine HappyOpen");
			Text("...oh, heh heh.&Sorry...", "Clawdine Regular");
				talk_turn(Oclawdine, Sclawdine_hips_talk);
				pause(6, 6, 5);
				pause(15, 15, 10);
			Text("Didn't mean to make you folks jump!", "Clawdine HappyOpen");
				talk_turn(Oclawdine, Sclawdine_laugh);
			Text("Er-nonsense!&Detectives are never afraid!", "Hoots Harumph");
				talk_turn(Oclawdine, Sclawdine_hips, 0);
				talk_turn(Ohoots_cutscene, Splayer_harumph);
				pause(2, 2, 5);
				pause(12, 12, 10);
			Text("We were merely... surprised...", "Hoots Harumph Eye");
				pause(17, 17, 10);
			Text("Well that's a relief!", "Clawdine HappyNoStars");
				talk_turn(Oclawdine, Sclawdine_hips_talk);
			Text("So what's the project ya got for me?", "Clawdine HmmHips");
			Text("My claws are itching to carve out a new idea!", "Clawdine BigSmile");
				talk_turn(Oclawdine, Sclawdine_smile);
			Text("Can you make a wooden deer?", "Charlie Confused");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 1);
			Text("Ooooooo&A sculpture!", "Clawdine Stars");
				talk_turn(Oclawdine, Sclawdine_star_talk);
				pause(0, 0, 5);
				pause(7, 7, 10);
			Text("You bet I can!", "Clawdine BigSmile");
				talk_turn(Oclawdine, Sclawdine_smile);
			Text("But, I can't find my hammer...", "Clawdine HmmHips");
				talk_turn(Oclawdine, Sclawdine_hips_eyebrow);
				pause(4, 4, 5);
			Text("It's such a mess around here...", "Clawdine Depressed");
				talk_turn(Oclawdine, Sclawdine_sad_talk);
			add_move_order();
		break;
		case "detectivecantfind":
			Text("No trouble for a great detective!&(such as myself...)", "Hoots Happy");
				pause(33, 33, 5);
			Text("I can- uh...&Well, I-", "Charlie Shocked");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 2);
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0, false, 6);
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 3, false, 12);
				talk_turn(Ocharliemouse_cutscene, Scmouse_sweat_side, -1, true, 18);
				pause(6, 6, 5);
				pause(12, 12, 5);
				pause(18, 18, 5);
			Text("I bet I can find it too!", "Charlie Shocked");
			add_move_order();
		break;
		
		case "dontleaveclawdinehouse":
			Text("I need my hammer...", "Clawdine Depressed");
		break;
	}	
}