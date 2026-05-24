
function prologue_text(_text_id){
	var _diabubble = 1;
	
	switch (_text_id)
	{
		case "yo joe":
			Text("Yo, Joe!", "Jitters Wah", Ojitters, _diabubble);
			Text("I gots me an empty mug 'ere!", "Jitters Wah");
			Text("I'll be with you in a jiffy, Jitters!", "Joe Regular", Ojoeturtle, _diabubble);
				talk_turn(Ojoeturtle, Sjoeturtle_coffeetalk_side);
				talk_turn(Ojitters, Ojitters.idle_annoyed_spr);
			Text("Here's some coffee for the road, Sniffles.", "Joe Regular", Ojoeturtle, _diabubble);
				talk_turn(Ojoeturtle, Ojoeturtle.idle_coffee_talk_spr);
			add_move_order();
		break;
		case "thanks joe":
			Text("Thanks Joe. My nose is forever in debt to you.", "Sniffles Regular", Osniffles, _diabubble);
			Text("That coffee loosens my sinuses right-", "Sniffles Regular", Osniffles, _diabubble);
			Text("uh-&ah-", "Sniffles Uh", Osniffles, _diabubble);
				pause(3,3, 10);
			Text("AHCHOOOOO!!!", "Sniffles Achoo", Osniffles, _diabubble);
				talk_turn(Osniffles, Osniffles.sneeze_spr, 1);
				textspeed_change(2);
				skip();
			add_move_order();
		break;
		case "see you tomorrow":
			Text("See you tomorrow Sniffles!", "Joe Regular", Ojoeturtle, _diabubble);
			add_move_order();
		break;
		case "now, i think everything":
			Text("Now, I think everything has been taken care of...", "Joe Regular", Ojoeturtle, _diabubble);
			Text("So, why do I feel like I'm forgetting-", "Joe Regular", Ojoeturtle, _diabubble);
			add_move_order();
		break;
		case "me you're forgetting me":
			Text("ME!&You're forgetting me! Jitters!", "Jitters Wah", Ojitters, _diabubble);
				pause(3, 3, 15);
				pause(25, 25, 15);
			Text("The squirrel who is dying of thirst!", "Jitters Wah", Ojitters, _diabubble);
			Text("Oh, Jitters! I beg your pardon!", "Joe Regular", Ojoeturtle, _diabubble);
				talk_turn(Ojoeturtle, Ojoeturtle.idle_side_talk_spr);
				pause(12, 12, 10);
			Text("I'll refill that mug quicker...", "Joe Regular", Ojoeturtle, _diabubble);
			Text("...than Sniffles sneezing himself out the window!", "Joe Regular", Ojoeturtle, _diabubble);
			Text("heh heh...", "Joe Regular", Ojoeturtle, _diabubble);
			add_move_order();
		break;
		case "now that's more":
			Text("Now that's more like it!", "Jitters Regular MouthAjar");
			Text("................................&................................&................................", "Jitters Coffee", Ojitters, _diabubble);
				talk_turn(Ojitters, Ojitters.idle_coffee_sip_spr);
				text_wave(0, 97);
			add_move_order();
		break;
		case "if you don't mind":
			Text("If you don't mind Jitters...", "Joe Regular");
			Text("I'm closing up, so if you could drink that a little fast-", "Joe Regular");
				talk_turn(15, 15, 10);
			add_move_order();
		break;
		case "golly jitters":
			Text("-er.", "Joe Wide-Eyed");
			Text("Golly Jitters!", "Joe Wide-Eyed");
			Text("Must be a vacuum in that tummy of yours!", "Joe Shocked");
			Text("Ha! I wish!", "Jitters Wild", Ojitters, _diabubble);
				talk_turn(Ojoeturtle, Ojoeturtle.shocked_spr, 2);
				talk_turn(Ojitters, Ojitters.idle_crazy_coffee_talk_spr);
			Text("The only thing in my tummy is a love for your brew!", "Jitters Wild", Ojitters, _diabubble);
			Text("All this caffeine lets me zip straight home!", "Jitters Wild MouthClose", Ojitters, _diabubble);
			Text("Then, I can avoid all of the nighttime monsters!", "Jitters Wild", Ojitters, _diabubble);
				pause(5, 5, 5);
			Text("Well, I didn't name this place 'Cup O' Joe' for nothing.", "Joe Regular");
				talk_turn(Ojoeturtle, Ojoeturtle.idle_talk_spr);
				talk_turn(Ojitters, Ojitters.idle_crazy_coffee_spr);
				pause(5, 5, 5);
			Text("heh heh...", "Joe Regular");
			add_move_order();
		break;
		case "did you say":
			Text("Jitters...?", "Joe Shocked");
			Text("...did you say monsters?", "Joe Shocked");
				text_shake(15, 22);
			add_move_order();
		break;
		case "sure!":
			Text("Sure!", "Jitters Regular MouthAjar", Ojitters, _diabubble);
			Text("There all kinds of things lurking about!", "Jitters Regular MouthAjar", Ojitters, _diabubble);
			Text("Creepy crawlies and stranger dangers!", "Jitters Regular", Ojitters, _diabubble);
			Text("Lurking about in the night...", "Jitters Scary", Ojitters, _diabubble);
			Text("Crawlies!? Strangers??!!", "Joe Shocked");
				talk_turn(Ojoeturtle, Ojoeturtle.shocked_talk_spr);
				talk_turn(Ojitters, Ojitters.idle_coffee_side_spr);
				textspeed_change(1.25);
				pause(10, 10, 15);
			Text("You better believe it!!!", "Jitters Regular MouthAjar", Ojitters, _diabubble);
				talk_turn(Ojoeturtle, Ojoeturtle.shocked_spr, 2);
				talk_turn(Ojitters, Ojitters.idle_coffee_side_talk_spr);
			Text("Say, you don't look so good Joe...", "Jitters Regular", Ojitters, _diabubble);
				pause(4, 4, 15);
			Text("Huh? Oh...yeah", "Joe Wide-Eyed");
				talk_turn(Ojoeturtle, Ojoeturtle.shocked_talk_spr);
				talk_turn(Ojitters, Ojitters.idle_coffee_side_spr);
				pause(4, 4, 15);
				pause(7, 9, 2);
			Text("I'm just feeling a tad hot in this stuffy shop...", "Joe Scared");
				talk_turn(Ojoeturtle, Sjoeturtle_flatmouth, 3);
			Text("Hmm...&Now that you mention it-", "Jitters Calm", Ojitters, _diabubble);
				talk_turn(Ojitters, Ojitters.idle_talk_ccup_spr);
				pause(3, 5, 2);
				pause(6, 6, 10);
			Text("It does feel a little stuffy...", "Jitters Calm", Ojitters, _diabubble);
			Text("Welp! Time to brave the terrors of the night!", "Jitters Regular", Ojitters, _diabubble);
				pause(5, 5, 5);
			Text("See ya Joe!", "Jitters Regular MouthAjar", Ojitters, _diabubble);
			Text("Wheeeeeeee!!!", "Jitters Wild", Ojitters, _diabubble);
				talk_turn(Ojitters, Ojitters.idle_crazy_talk_spr, 1);
				textspeed_change(2);
				skip();
			add_move_order();
		break;
		case "bye jitters":
			Text("Bye Jitters!", "Joe Regular");
			add_move_order();
		break;
		case "check twice":
			Text("Heh heh...", "Joe Regular", Ojoeturtle, _diabubble);
			Text("Doesn't hurt to check twice, right?", "Joe Scared", Ojoeturtle, _diabubble);
				pause(27, 27, 5);
			add_move_order();
		break;
		case "scared hah":
			Text("Scared of spooky strangers, eh?", "Joe Scared");
			Text("Ha!&Silly squirrel...", "Joe Regular");
				pause(3, 3, 10);
			Text("All of that coffee is making him see things.", "Joe Regular");
			add_move_order();
		break;
		case "mother mocha":
			Text("SWEET MOTHER OF MOCHA!!!", "Joe DarkMode Shocked");
			add_move_order();
		break;
		case "a monster":
			Text("A MONSTER!!!", "Joe Shell");
				text_shake(0, 11);
			auto(30);
			add_move_order();
		break;
	}
}