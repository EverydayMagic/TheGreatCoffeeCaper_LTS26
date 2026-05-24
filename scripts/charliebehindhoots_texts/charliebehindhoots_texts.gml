function charliebehindhoots_texts(_text_id){
	switch(_text_id)
	{
		#region Charlie Dash Ahead
		
			case "mustyoudashahead":
				Text("Must you dash ahead so often Charlie?", "Hoots Yawn");
				Text("I'm not much of a morning bird you know...", "Hoots Drowsy");
				add_move_order();
			break;
		
			case "sorryjustexcited":
				Text("Sorry!&Just excited to solve this case!", "Charlie Happy");
					pause(6, 6, 10);
				add_move_order();
			break;
			case "but...":
				Text("But...", "Charlie Regular");
				add_move_order();
			break;
			case "ifitmakes":
				Text("If it makes you feel better...", "Charlie Happy");
				add_move_order();
			break;
			case "stickrightbehind":
				Text("I'll stick right behind you.", "Charlie Happy");
				add_move_order();
			break;
		
		#endregion
		
		#region Where Going?
		
			case "doyouknowwheregoing":
				Text("Hey, Hootsworth?", "Charlie Confused");
				Text("Do-", "Charlie Confused");
				Text("Do you know where you're going?", "Charlie Confused");
				add_move_order();
				Text("Why Charles!&I'm offended!", "Hoots Harumph");
					talk_turn(Ohoots_cutscene, Splayer_capidle, 2);
					pause(12, 12, 10);
				Text("Great detectives always know where they're going...", "Hoots Harumph");
					talk_turn(Ohoots_cutscene, Splayer_harumph);
				add_move_order();
			break;
		
		#endregion
		
		#region Where Going?2
			
			case "iknowyouknowwhere":
				Text("I know you know where you where you're going but", "Charlie Confused");
					auto(30);
				Text("-if you could to tell me what you know so I could know,", "Charlie Confused");
					auto(30);
				Text("I feel like we'd get wherever we're going a lot sooner", "Charlie Confused");
					auto(30);
				Text("...you know?", "Charlie Um");
					pause(2, 2, 10);
				add_move_order();
			break;
			
			case "...no":
				Text("...&No.", "Hoots Regular");
					pause(0, 2, 10);
					pause(3, 3, 30);
				Text("...&Oh.", "Charlie Regular");
					pause(0, 2, 10);
					pause(3, 3, 30);
				add_move_order();
			break;
			
		#endregion
	}
}