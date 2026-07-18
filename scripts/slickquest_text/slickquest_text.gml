function slickquest_text(_text_id){
	switch(_text_id)
	{
		case "salutationsfox":
			//add in a case for if you talked to slick before cup o joe
			Text("Salutations my good fellow.", "Hoots Happy");
			Text("Slick.&The name's Slick.");
				pause(6, 6, 10);
			Text("Slick, then.", "Hoots Regular"); //Hoots Annoyed
			Text("Did you happen to see a cloud with an egg just now?", "Hoots Regular");
			add_move_order();
		break;
		case "maybeididnt":
			Text("Maybe I did.&Maybe I didn't.");
				pause(12, 12, 10);
			Text("That's...not very helpful.", "Hoots Squint");
				pause(8, 8, 5);
			Text("Could you spare some more details?", "Hoots Regular");
			Text("Hmm, my memory is a bit foggy...");
				pause(4, 4, 5);
			Text("A little someth'n oughtta jog it...");
			Text("Pardon?", "Hoots Curious");
			Text("Ya know...&Dough. Lettuce. Cheddar.");
				pause(10, 10, 10);
				pause(17, 17, 5);
				pause(26, 26, 5);
			Text("Are you...&making a sandwich?", "Hoots Think");
				pause(10, 10, 10);
			add_move_order();
		break;
		case "moolahbirdy":
			Text("Moolah, birdy!&I'm talkn' about money!");
				pause(14, 14, 10);
			Text("Ah, yes! Of course.", "Hoots Happy");
				talk_turn(Ohoots_cutscene, Splayer_capidle, 1);
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 1);
			Text("Er, we do not carry money...", "Hoots Wide-Eyed");
				//HOOTS SWEAT RUB HEAD SPRITE
				pause(3, 3, 5);
			add_move_order();
		break;
		case "tellyawhatdeal":
			Text("Tell ya what, I'll make ya a nice deal...");
				pause(13, 13, 5);
			Text("If ya do a little treasure hunt'n for me...");
			Text("I'll tell ya where that cloud stashed the egg.");
			Text("Capital!&What is it you're looking for?", "Hoots Happy");
				pause(8, 8, 10);
			Text("A few days ago, I lost my lucky coin.");
				pause(15, 15, 2);
			Text("Find that, and I'll give ya the lowdown on the egg.");
				pause(10, 10, 5);
			add_move_order();
		break;
		case "greathootsoncase":
			Text("The great Detective Hootsworth is on the case!", "Hoots Regular");
			add_move_order();
		break;
		case "aintgonnafind":
			Text("HA! You ain't gonna find it with that dinky thing!");	
				talk_turn(Ohoots_cutscene, Splayer_caphoist_shock);
				pause(3, 3, 5);
			Text("M-m-my Spark Glass?", "Hoots Wide-Eyed");
				talk_turn(Ohoots_cutscene, Splayer_diag_shock, 0, true);
			Text("More like basic glass!");
			Text("You, my feathered friend, are in need of an upgrade.");
				pause(4, 4, 5);
				pause(25, 25, 5);
			Text("Well, wherever can I get one?", "Hoots Wide-Eyed");
			Text("Beats me. But I ain't talking without my lucky coin.");
				pause(9, 9, 10);
			add_move_order();
		break;
		
		case "ainttalkcoin":
			Text("I ain’t talk'n without my lucky coin...");
			//with (Ofox)
			//{
			//	if (alarm[0] = -1){ alarm[0] = 1; }
			//}
		break;
	}
}

/*
Hootsworth: “Salutations my good fellow.”

Slick: “Slick. The name’s Slick.”

Hootsworth: “Slick, then. Did you happen to see a cloud with an egg just now?”

Slick: “Maybe I did. Maybe I didn’t.”

Hootsworth: “That’s… not very helpful. Could you be more specific?”

Slick: “Hmm, my memory is a bit foggy. A little someth’n oughtta jog it.”

Hootsworth: “Pardon?”

Slick: “Ya know. Dough. Lettuce. Cheddar.”

Hootsworth: “Are you… making a sandwich?”

Slick: “Moolah, birdy! I’m talk’n about money!”

Hootsworth: “Ah, yes! Of course. Er, we don’t carry money.”

Slick: “*Sigh* Tell ya what: if ya do a little treasure hunt’n for me, I’ll tell ya where that cloud stashed the egg.”

Hootsworth: “Capital! What is it you’re looking for?”

Slick: “A few days ago, I lost my lucky coin. Find that, and I’ll give ya the lowdown on the egg.”

Hootsworth raises up his Spark Glass

Hootsworth: “The great Detective Hootsworth is on the case!”

Slick’s eyes widen and he laughs! (I kind of picture it sounding like Lancer’s laugh in Deltarune)

Slick: “Ha! Ya ain’t gonna find it with that dinky thing!”

Hootsworth’s eyes widen mid-pose.

Hootsworth: “M-m-my Spark Glass?”

Slick: “More like a basic glass! You, my feathered friend, are in need of an upgrade.”

Hootsworth: “Wherever can I get one?”

Slick: “Beats me. But I ain’t talk’n without my lucky coin.”

The conversation ends. If the player interacts with Slick again, he will say this:

Slick: “I ain’t talk’n without my lucky coin.”
