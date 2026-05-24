function foundallclues_text(_text_id){
	var joe = Ojoeturtle;
	var charlie = Ocharliemouse_cutscene;
	var hoots = Ohoots_cutscene;
	
	switch(_text_id)
	{
		case "anyluckboys":
			Text("Any luck back here boys?", "Joe Regular");
				talk_turn(joe, joe.idle_side_talk_l_spr);
			Text("Joe, my dear turtle, a great detective doesn't need luck!", "Hoots Regular");
				talk_turn(joe, joe.idle_spr, 2);
				pause(20, 20, 10);
			Text("We use our skills and intuition to figure out hooo dunnit!", "Hoots Happy");
			Text("So, you reckon you know who stole my beans?", "Joe Regular");
				talk_turn(joe, joe.idle_side_talk_l_spr);
				pause(3, 3, 10);
			Text("Well...&Now you see...&I wouldn't say...", "Hoots Shocked");
				talk_turn(joe, joe.idle_spr, 2);
				pause(7, 7, 10);
				pause(22, 22, 10);
			Text("Not yet.", "Charlie Happy");
			Text("But, we've got all we need to get to the bottom of this!", "Charlie PumpedFist");
				talk_turn(charlie, Scmouse_pumpfist);
				pause(4, 4, 10);
			Text("Oh!&Well that's a relief to hear...", "Joe Regular");
				talk_turn(joe, joe.idle_side_talk_l_spr);
				pause(3, 3, 10);
			Text("Thank you, um...", "Joe Wide-Eyed");
				talk_turn(joe, joe.shocked_talk_side_spr, -1, false, 10);
				pause(10, 10, 10);
			Text("...&What was your name, sonny?", "Joe Wide-Eyed");
				pause(3, 3, 10);
			Text("...", "Charlie Red");
				talk_turn(joe, joe.shocked_spr, 1);
				talk_turn(charlie, charlie.idle_embarrassed_red_side_spr, 0);
				pause(0, 2, 5);
			Text("Charlie.&I-I come to your shop everyday...", "Charlie Red");
				pause(8, 8, 10);
				pause(9, 9, 5);
			Text("Oh, that's right!", "Joe Regular");
				talk_turn(joe, joe.idle_side_talk_l_spr);
				pause(3, 3, 5);
			Text("These old eyes don't see like they used to.", "Joe Regular");
			Text("You're the feller who loves hazelnut lattes, right?", "Joe Regular");
				pause(44, 44, 5);
			Text("Coffee isn't really my thing...", "Charlie Um");
				talk_turn(charlie, Scmouse_sweat_side, -1, true);
				talk_turn(joe, joe.idle_spr, 2);
			Text("I just pick them up for Hootsworth...", "Charlie Um");
			add_move_order();
		break;
		
		case "meetyououtside":
			Text("I'll meet you outside, Hootsworth!", "Charlie Red");
			add_move_order();
		break;
		
		case "quickthing":
			Text("Quick little thing!&heh heh...", "Joe Regular");
				pause(19, 19, 10);
			Text("Oh yes!", "Hoots Regular");
				talk_turn(joe, joe.idle_spr, 2);
			Text("Charlie's always eager about a mystery!", "Hoots Happy");
			Text("Well, then I guess you better get a move on too!", "Joe Regular");
				talk_turn(joe, joe.idle_side_talk_l_spr);
				pause(5, 5, 10);
			Text("We're on the case my good Joe!&Hoot, hoot!", "Hoots Happy");
				talk_turn(joe, joe.idle_spr, 2);
				pause(30, 30, 5);
			add_move_order();
		break;
	}
}