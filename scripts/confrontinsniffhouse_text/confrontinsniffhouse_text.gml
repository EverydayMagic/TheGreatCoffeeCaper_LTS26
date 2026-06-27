function confrontinsniffhouse_text(_text_id){
	switch (_text_id)
	{
		case "notovahhere":
			Text("Not over here...&Not over there...", "Puffy Irritated");
				talk_turn(Opuffy, Spuffy_sidetalk_nosmile, -1, true);
				talk_turn(Opuffy, Spuffy_sidetalk_nosmile, -1, false, 16);
				pause(16, 16, 5);
			Text("Goodness!", "Puffy Angry");
				talk_turn(Opuffy, Spuffy_mad_f);
			Text("Where in the fowest are those beans?", "Puffy Angry");
			add_move_order();
		break;
		case "teardishouse":
			Text("Oooo!&I'll tear this house apart to find them!", "Puffy Dark");
				pause(5, 5, 5);
			add_move_order();
		break;
		case "stoprightthere":
			Text("Stop right there you puffy fiend!", "Charlie Interrogative");
			Text("You again?!", "Puffy Distressed");
			Text("Hey, where's Stump?", "Puffy NoSmile");
				pause(4, 4, 3);
			Text("He's -uh- preoccupied at the moment.", "Hoots Regular");
			Text("Oh that cwazy deer! He always messes up my pwans!", "Puffy Angry");
				pause(18, 18, 5);
			Text("I'll just have to steal someting else!", "Puffy Devious");
			add_move_order();
		break;
		case "whatrelaxingwalk":
			Text("What a relaxing walk!", "Sniffles Happy");
			Text("I can't wait to come back to the tranquil peace of my home.", "Sniffles Happy");
			Text("Say, this scene doesn't match my narration!", "Sniffles Regular");
				pause(4, 4, 5);
		break;
		case "datwooksimpor":
			Text("That wooks important!", "Puffy Devious");
				textspeed_change(0.25);
		break;
		case "seesuckahs":
			Text("See ya suckers!", "Puffy Regular");
		break;
		case "myniece":
			Text("My niece!&Come back here you-", "Sniffles CrazyYell");
				pause(9, 9, 5);
			Text("uh-&ah-", "Sniffles CrazyYellEyeClosed");
				pause(3,3, 10);
			Text("-ACHOOOOOO!", "Sniffles Achoo");
				textspeed_change(2);
				skip();
		break;
		case "sinusesterrible":
			Text("Goodness me...", "Sniffles Regular");
			Text("My sinuses are just terrible in this autumn air...", "Sniffles Regular");
			Text("Detective...I don't know what you're doing here...", "Sniffles Regular");
				pause(11, 11, 5);
			Text("-But could you please rescue my niece?", "Sniffles Regular");
			Text("Consider it done Sniffles!", "Charlie PumpedFist");
			Text("Thanks, um...", "Sniffles Regular");
				pause(7, 7, 10);
			Text("And you are...?", "Sniffles Regular");
			Text("...&Charlie...", "Charlie Red");
				pause(3, 3, 15);
			Text("I'm Charlie...", "Charlie Regular");
				pause(3, 3, 10);
		break;
		case "letsmovecharlie":
			Text("Come now, let's move Charlie!", "Hoots Happy");
				pause(9, 9, 5);
			Text("If we don't hurry, I might miss my mid-morning nap!", "Hoots Yawn");
				pause(18, 18, 5);
		break;
	}
}

/*
Charlie follows behind Hootsworth again. The player goes inside. Once inside Sniffles’ house, they find Puffy looking around in different rooms. Charlie and Hootsworth hide in the living room.

Puffy: “Not ovah here. Not ovah there. Goodness! Where in da fowest are dose beans?” 

Puffy: “Oooo! I’ll tear dis house apart to find dem!”

Puffy starts to get stormy.

Charlie: “Stop right there you puffy fiend!”

Puffy: “You again?! Hey, where’s Stump?”

Hootsworth: “He’s - uh - preoccupied at the moment.”

Puffy: “Oh dat cwazy deer! He always messes up my pwans! I’ll just hafta steal someting else!”

Sniffles comes through the door with his egg in the stroller.

Sniffles: “What a relaxing walk! I can’t wait to come back to the equally tranquil peace of my home… Say, this scene doesn’t match my narration!”

Puffy: “Dat wooks important! See ya suckahs!”

Puffy steals Sniffles’ egg!

Sniffles: “My niece! Come back here you - ah - AH - AHCHOOO!”

Sniffles sneezes so hard he propels himself into a wall! Decorative plates fall off the shelves as part of it slips off the wall. The picture frame tilts.

Sniffles: “Goodness me. My sinuses are just terrible in this autumn air. Hootsworth, I don’t know what you’re doing here, but could you please rescue my niece?”

Charlie: “Consider it done Sniffles!”

Sniffles: “Thanks, um… and you are?”

A bead of sweat rolls down Charlie’s head.

Charlie:  “Charlie… I’m Charlie.”

Charlie turns to Hootsworth.

Hootsworth: “Let’s get a move on Charlie! If we don’t hurry I might miss my mid morning nap!”

Hootsworth and Charlie go outside.

The music quotes down and it's silent.

Charlie: “Hootsworth, I’ve been your partner in this town for months now. Why does everyone ignore me?”

Hootsworth: “Why Charles, you aren’t ignored. You’re just… er, a bit small that’s all. But you’re still my partner.”

Charlie: “Yeah... I guess.”

Hootsworth: “Let's find out where those bandits went. That’ll cheer you up.”
