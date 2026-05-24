
function act1chap1scene1_text(_text_id){
	var _diabubble = 1;
	
	switch (_text_id)
	{
		case "to be continued":
			Text("Just when she had turned from the door...", "No Hat Hoots Read", Ohoots_cutscene, _diabubble);
			Text("Detective Sherly suddenly heard...", "No Hat Hoots Read", Ohoots_cutscene, _diabubble);
			Text("a frightening roar!!!", "No Hat Hoots Read Shocked", Ohoots_cutscene, _diabubble);
			Text("She turned around...", "No Hat Hoots Read", Ohoots_cutscene, _diabubble);
			Text("and squeezing its massive body through the door...", "No Hat Hoots Read", Ohoots_cutscene, _diabubble);
			Text("was the scariest monster Sherly had ever seen!", "No Hat Hoots Read Shocked", Ohoots_cutscene, _diabubble);
			Text("...&TO BE CONTINUED?!", "No Hat Hoots Read Flabergasted", Ohoots_cutscene, _diabubble);
				pause(4, 4, 15);
			add_move_order();
		break;
		case "hate cliff hangers":
			Text("Oh, how I do hate cliff-hangers!", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
			Text("How is a detective supposed to find out hoooo dunnit?", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
			add_move_order();
		break;
		case "sunrise already":
			Text("My, my, look at the time!&Sunrise already?", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
				pause(26,26,15);
			Text("I'll have to borrow the sequel from Charlie later.", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
			add_move_order();
		break;
		case "sock drawer":
			Text("I do hope to solve dangerous cases...", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
			Text("Detective Sherly makes them seem so fun!", "No Hat Hoots Happy", Ohoots_cutscene, _diabubble);
			Text("The biggest mystery I've ever solved was the case...", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
			Text("of the missing.....", "No Hat Hoots Drowsy", Ohoots_cutscene, _diabubble);
				textspeed_change(0.75);
			Text("sock drawer........", "No Hat Hoots Yawn", Ohoots_cutscene, _diabubble);
				textspeed_change(0.5);
			add_move_order();
		break;
		case "snore":
			Text("*SNORE*", "No Hat Hoots Sleep", Ohoots_cutscene, _diabubble);
			add_move_order();
		break;
		case "must be the wind":
			Text("Hmmm...?", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
			Text("Must have been the wind...", "No Hat Hoots Drowsy", Ohoots_cutscene, _diabubble);
			add_move_order();
		break;
		case "hoo goes there":
			Text("Hoot!&Hoot!", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
				pause(5, 5, 10);
			Text("Hooo goes there?", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
			add_move_order();
		break;
		case "confound it":
			Text("Confound it!&Hooo is up this early in the morning?!", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
				pause(12, 12, 10);
			add_move_order();
		break;
		case "no coffee":
			Text("Hootsworth!", "Charlie Distressed", Ocharliemouse, _diabubble);
			Text("Cup of Joe!", "Charlie Distressed", Ocharliemouse, _diabubble);
			Text("The beans!", "Charlie Distressed", Ocharliemouse, _diabubble);
			Text("No coffee!", "Charlie Distressed", Ocharliemouse, _diabubble);
			add_move_order();
		break;
		case "umhoots":
			Text("Um, Hootsworth?", "Charlie Confused", Ocharliemouse, _diabubble);
				talk_turn(Ocharliemouse_cutscene, Ocharliemouse_cutscene.idle_spr, 1);
				pause(3, 3, 10);
			Text("Ooooh, Charlie...&My poor spine......", "No Hat Hoots Starry", Ohoots_cutscene, _diabubble);
				talk_turn(Ohoots_cutscene, Ohoots_cutscene.idle_knockout_spr, 1);
				pause(6, 6, 5);
				pause(17,17,10);
			add_move_order();
		break;
		case "starsswirlinghead":
			Text("Quit laying around Hootsworth!&This is serious!", "Charlie Distressed", Ocharliemouse, _diabubble);
				talk_turn(Ohoots_cutscene, Ohoots_cutscene.idle_knockout_spr, 0);
				talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_backward);
				pause(31, 31, 10);
			Text("And the stars swirling around my head aren't?", "No Hat Hoots Starry", Ohoots_cutscene, _diabubble);
				talk_turn(Ohoots_cutscene, Ohoots_cutscene.idle_knockout_spr, 1);
			add_move_order();
		break;
		case "no rest":
			Text("There's no time for resting Hootsworth!", "Charlie Distressed", Ocharliemouse, _diabubble);
			Text("Something happened last night at 'Cup of Joe'!", "Charlie Distressed", Ocharliemouse, _diabubble);
				text_color(32, 44, orange_col, orange_col, orange_col, orange_col); 
			Text("The whole town's in a tizzy!!", "Charlie Distressed", Ocharliemouse, _diabubble);
			Text("A tizzy, eh?", "No Hat Hoots Curious", Ohoots_cutscene, _diabubble);
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 1);
			Text("You go on ahead.", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
			Text("Once I have my things, I'll meet you there.", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
				text_color(0, 20, orange_col, orange_col, orange_col, orange_col);
				pause(22, 22, 10);
			Text("Good idea!", "Charlie Happy", Ocharliemouse, _diabubble);
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 1);
			Text("It'll put the town's nerves at ease to know you're-", "Charlie Regular", Ocharliemouse, _diabubble);
			Text("I mean-that WE are on the case...", "Charlie Happy", Ocharliemouse, _diabubble);
				pause(14, 14, 15);
			Text("See you there Hootsworth!", "Charlie Happy", Ocharliemouse, _diabubble);
			add_move_order();
		break;
		case "get a new partner":
			Text("Hoot!", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
			Text("I need a partner that doesn't give my head such a tizzy...", "No Hat Hoots Starry", Ohoots_cutscene, _diabubble);
			add_move_order();
		break;
	}
}