
function investigatecupojoe_text(_text_id){
	var _diabubble = 1;
	
	switch (_text_id)
	{
		case "cmonjoe":
			Text("C'mon Joe!&Spill the beans!", "Charlie Interrogative", Ocharliemouse, _diabubble);
			Text("What are you hiding from?!", "Charlie Interrogative", Ocharliemouse, _diabubble);
			Text("Spill the beans indeed! (my poor coffee beans...)", "Joe Shell", Ojoeturtle, _diabubble);
			Text("Coffee beans? Now that does sound suspicious...", "Charlie Interrogative", Ocharliemouse, _diabubble);
				pause(13, 13, 10);
			Text("How would a coffee bean scare you into your shell?", "Charlie Curious", Ocharliemouse, _diabubble);
			Text("...!", "Charlie Shocked", Ocharliemouse, _diabubble);
			Text("Did they rise up in a revolt and try to brew you?", "Charlie Shocked", Ocharliemouse, _diabubble);
			Text("Who's the rebel bean, Joe!?", "Charlie Interrogative", Ocharliemouse, _diabubble);
			add_move_order();
		break;
		case "meanmouth":
			Text("Is it this one???&Oooo and it's got a mean mouth on it!", "Charlie InterogativeBean", Ocharliemouse, _diabubble);
				pause(17, 17, 15);
			Text("Hey! Don't bring my mother into this!", "Charlie YellBean", Ocharliemouse, _diabubble);
			Text("I never mentioned your mother!!", "Joe Shell", Ojoeturtle, _diabubble);
			add_move_order();
		break;
		case "goodmorning":
			Text("Hoot, hoot.&Good morning chaps!", "Hoots Happy", Ohoots_cutscene, _diabubble);
				pause(11, 11, 15);
			add_move_order();
		break;
		case "hootsworthfromjoe":
			Text("Hootsworth!", "Joe Regular", Ojoeturtle, _diabubble);
			Text("Hootsworth!&Thank goodness you're here.", "Charlie Happy", Ocharliemouse, _diabubble);
				talk_turn(Ojoeturtle, Ojoeturtle.idle_spr, 3);
			add_move_order();
		break;
		case "knowsmorewords":
			Text("This bean knows more words than I'd care to repeat!", "Charlie YellBean", Ocharliemouse, _diabubble);
			Text("I'll need help bringing it in for questioning...", "Charlie InterogativeBean", Ocharliemouse, _diabubble);
			Text("Now don't you take my coffee beans too!", "Joe Shocked", Ojoeturtle, _diabubble);
				talk_turn(Ojoeturtle, Ojoeturtle.shocked_talk_spr);
			Text("Whatever the rebel bean said, I'm sure it didn't mean it...", "Joe Scared", Ojoeturtle, _diabubble);
				talk_turn(Ojoeturtle, Ojoeturtle.idle_flatmouth_spr, 3);
			Text("Rebel Bean?", "Hoots Drowsy", Ohoots_cutscene, _diabubble);	
			Text("...", "Hoots Yawn");
				talk_turn(Ohoots_cutscene, Splayer_cap_yawn);
				pause(0, 2, 5);
			Text("This is all too much for one morning...", "Hoots Drowsy");
				talk_turn(Ohoots_cutscene, Splayer_capidle, 1);
			add_move_order();
		break;
		case "hazelnutlatte":
			Text("Joe, could you kindly whip me up a Hazelnut Latte?", "Hoots Drowsy", Ohoots_cutscene, _diabubble);
			Text("I'm simply bushed from all my reading this morning...", "Hoots Yawn", Ohoots_cutscene, _diabubble);
			add_move_order();
		break;
		case "comeonjoe":
			Text("Come on Joe, I can't solve a case with a dry throat...", "Hoots Drowsy", Ohoots_cutscene, _diabubble);
				pause(12, 12, 15);
			add_move_order();
		break;
		case "wellhootsworth":
			Text("Well Hootsworth, that's just it.", "Charlie Confused", Ocharliemouse, _diabubble);
				pause(16, 16, 15);
			Text("The coffee...&The beans...&They're all-", "Charlie Um", Ocharliemouse, _diabubble);
				pause(13, 13, 15);
				pause(26, 26, 15);
			Text("They're gone.", "Joe Wide-Eyed", Ojoeturtle, _diabubble);
				talk_turn(Ojoeturtle, Ojoeturtle.shocked_talk_spr);
			Text("Ah...&I see.", "Hoots Regular", Ohoots_cutscene, _diabubble);
				talk_turn(Ojoeturtle, Ojoeturtle.shocked_spr, 2);
				pause(5, 5, 15);
			add_move_order();
		break;
		case "zzz":
			Text("*SNORE*", "Hoots Sleep", Ohoots_cutscene, _diabubble);
			add_move_order();
		break;
		case "hootswakeup":
			Text("Hootsworth!&Wake up!", "Charlie Distressed", Ocharliemouse, _diabubble);
				talk_turn(Ocharliemouse_cutscene, Scmouse_distressed_side, -1, true);
			Text("Hoot, hoot?&Charlie? Is my order ready yet?", "Hoots Drowsy", Ohoots_cutscene, _diabubble);
				talk_turn(Ohoots_cutscene, Splayer_capsit_yawn);
				pause(11, 11, 15);
				pause(20, 20, 15);
			Text("It'll never be ready! All of the coffee is gone!", "Charlie Distressed", Ocharliemouse, _diabubble);
				pause(21, 21, 15);
			Text("Funny...", "Hoots Drowsy", Ohoots_cutscene, _diabubble);
			Text("I recall you saying something similar in my nightmare...", "Hoots Drowsy", Ohoots_cutscene, _diabubble);
			Text("I wish this was a nightmare...", "Joe Scared", Ojoeturtle, _diabubble);
				talk_turn(Ojoeturtle, Ojoeturtle.idle_flatmouth_spr, 3);
			Text("No need to fret my dear Joe!", "Hoots Regular", Ohoots_cutscene, _diabubble);
				talk_turn(Ohoots_cutscene, Splayer_capidle, 1);
			add_move_order();
		break;
		case "thegreathootsworth":
			Text("The great Detective Hootsworth-", "Hoots Happy", Ohoots_cutscene, _diabubble);
			Text("-and his equally great assistant, Charlie Mouse!", "Charlie UmActually", Ocharliemouse, _diabubble);
				talk_turn(Ocharliemouse_cutscene, Ocharliemouse_cutscene.idle_sweat_finger_spr);
				talk_turn(Ohoots_cutscene, Ohoots_cutscene.idle_cap_hoist_shock_spr);
			Text("-ahem-", "Hoots Regular", Ohoots_cutscene, _diabubble);
				talk_turn(Ohoots_cutscene, Splayer_capidle, 0);
			Text("......", "Charlie SweatSmile");
				talk_turn(Ocharliemouse_cutscene, Scmouse_sweat_side);
			add_move_order();
		break;
		case "findhoodunit":
			Text("Will find out hooo dunnit!!", "Hoots Happy", Ohoots_cutscene, _diabubble);
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 2);
			add_move_order();
		break;
		case "ifneedhelp":
			Text("If you need help Hootsworth, just say so.", "Charlie Happy", Ocharliemouse, _diabubble);
			Text("I'm all ears!", "Charlie Happy", Ocharliemouse, _diabubble);
			add_move_order();
		break;	
		
		case "hootsworthhelpfromcharlie":
			Text("What is it Hootsworth?&Do you need help?", "Charlie Confused", Ocharliemouse_cutscene, _diabubble);
				pause(22, 22, 10);
				talk_turn_auto(Ocharliemouse_cutscene, 2, 3, 0, 1, Scmouse_idle);
			Text("Great detectives, such as myself, don't need 'help'", "Hoots Happy", Oplayer, _diabubble);
				pause(17, 17, 5);
				pause(33, 33, 5);
				pause(44, 44, 5);
			Text("...but, if you could remind me-", "Hoots Regular", Oplayer, _diabubble);
				pause(7, 7, 10);
			Text("About how to use your spark glass?&Easy!", "Charlie Happy", Ocharliemouse_cutscene, _diabubble);
				pause(34, 34, 10);
			Text("Just press 'C' and you're set to track down anything!", "Charlie Happy", Ocharliemouse_cutscene, _diabubble);
				pause(14, 14, 5);
				text_color(10, 14, orange_col, orange_col, orange_col, orange_col);
			Text("Even moles know that!", "Charlie Happy", Ocharliemouse_cutscene, _diabubble);
			Text("Of course!&I remember now.", "Hoots Regular", Oplayer, _diabubble);
				pause(10, 10, 10);
			Text("If you need any more help, just holler!", "Charlie Happy", Ocharliemouse_cutscene, _diabubble);
				pause(26, 26, 10);
		break;
		
		case "outofbusiness":
			Text("I might have to close down if you can't find those beans...", "Joe Scared", Ojoeturtle, _diabubble);
				talk_turn_auto(Ojoeturtle, 2, 3, 0, 1, Sjoeturtle_flatmouth); 
			Text("The town will tear itself apart without them...", "Joe Wide-Eyed");
			Text("He he...&We sure do love our coffee...", "Joe Regular");
				pause(8, 8, 10);
		break;
	}
}