function moleguide_text(_text_id){

	switch (_text_id)
	{
		
		case "wheremissinghat":
			Text("Here's my Spark Glass!", "No Hat Hoots Happy");
				talk_turn(Ohoots_cutscene, Splayer_idle, 3);
				text_color(9, 20, orange_col, orange_col, orange_col, orange_col);
			Text("But wherever is my missing Hat?", "No Hat Hoots Curious");
				talk_turn(Ohoots_cutscene, Splayer_idle, 2);
				talk_turn(Ohoots_cutscene, Splayer_idle, 0, false, 15);
				text_color(26, 29, orange_col, orange_col, orange_col, orange_col);
			//Text("Sounds like a job for my trusty Spark Glass!", "No Hat Hoots Happy");
			//	talk_turn(Ohoots_cutscene, Splayer_nocap_mglass_idle, 3);
			//	text_color(31, 43, orange_col, orange_col, orange_col, orange_col);
			add_move_order();
		break;
		
		case "hootsparkglass":
			Text("Hoot...?", "No Hat Hoots Regular");
				talk_turn(Ohoots_cutscene, Splayer_idle, 1);
			add_move_order();
		break;
		
		case "presscglass":
			Text("Press 'C' to use your Spark Glass!");
				pause(9, 9, 5);
				text_color(5, 9, orange_col, orange_col, orange_col, orange_col);
				text_color(21, 32, orange_col, orange_col, orange_col, orange_col);
			Text("My, my!&And who are you?!", "No Hat Hoots Shocked");
				pause(7, 7, 5);
			Text("Call me Tippy!");
			Text("I'm just a helpful mole filled with good advice!");
			Text("...&Living under your floorboards.");
				pause(0, 2, 5);
				pause(3, 3, 10);
			Text("Pardon me for asking, but...", "No Hat Hoots Regular");
			Text("How long have you been... under my floorboards?", "No Hat Hoots Curious");
				pause(22, 25, 2);
			add_move_order();
		break;
		
		case "longenoughhoots":
			Text("Long enough, Hootsworth...&Long enough...");
				pause(23, 25, 5);
				pause(26, 26, 5);
				pause(38, 40, 5);
				textvoice_change(noone);
				textspeed_change(0.5);
			Text("...", "No Hat Hoots Wide-Eyed");
				pause(0, 2, 5);
				textvoice_change(noone);
			add_move_order();
		break;
		
		case "solongpressc":
			Text("So long!&And don't forget to press 'C'!");
				text_color(34, 37, orange_col, orange_col, orange_col, orange_col);
			add_move_order();
		break;
		
		
		
	}
}