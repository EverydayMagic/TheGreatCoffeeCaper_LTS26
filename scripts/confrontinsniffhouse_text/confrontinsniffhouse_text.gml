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
			add_move_order();
		break;
		case "youagainpuff":
			Text("You again?!", "Puffy Distressed");
				talk_turn(Opuffy, Spuffy_shocked_f);
			Text("Hey, where's Stump?", "Puffy NoSmile");
				talk_turn(Opuffy, Spuffy_idle_f_nosmi);
				pause(4, 4, 3);
			add_move_order();
		break;
		case "hespreoccu":
			Text("He's -uh- preoccupied at the moment.", "Hoots Regular");
			add_move_order();
		break;
		case "hemessespwans":
			Text("Oh that cwazy deer!", "Puffy Irritated");
				talk_turn(Opuffy, Spuffy_mad_f);
			Text("He always messes up my pwans!", "Puffy Angry");
				talk_turn(Opuffy, Spuffy_mad2_f);
			Text("I'll just have to steal someting else!", "Puffy Devious");
				talk_turn(Opuffy, Spuffy_determined_f);
			add_move_order();
		break;
		case "whatrelaxingwalk":
			Text("What a relaxing walk!", "Sniffles Happy");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 1);
				talk_turn(Ohoots_cutscene, Splayer_capidle, 1);
			Text("I can't wait to come back to the peace of my home...", "Sniffles Happy");
			add_move_order();
		break;
		case "doesntmatchnarration":
			Text("Say, this scene doesn't match my narration!", "Sniffles Regular");
				pause(4, 4, 5);
			add_move_order();
		break;
		case "datwooksimpor":
			Text("That wooks important!", "Puffy Devious");
				talk_turn(Opuffy, Spuffy_determined_f);
			add_move_order();
		break;
		case "seesuckahs":
			Text("See ya suckers!", "Puffy Regular");
			add_move_order();
		break;
		case "myniece":
			Text("My niece!&Come back here you-", "Sniffles CrazyYell");
				pause(9, 9, 5);
			Text("uh-&ah-", "Sniffles CrazyYellEyeClosed");
				talk_turn(Osniffles, Ssniffles_uhah);
				pause(3,3, 10);
			add_move_order();
		break;
		case "mynieceachoo":
			Text("-ACHOOOOOO!", "Sniffles Achoo");
				talk_turn(Osniffles, Ssniffles_achoo);
				textspeed_change(2);
				auto(5, true);
			add_move_order();
		break;
		case "sinusesterrible":
			Text("Goodness me...", "Sniffles Regular");
			Text("My sinuses are just terrible in this autumn air...", "Sniffles Regular");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0);
			Text("Detective...I don't know what you're doing here...", "Sniffles Regular");
				pause(11, 11, 5);
			Text("-But could you please rescue my niece?", "Sniffles Regular");
			Text("Consider it done Sniffles!", "Charlie PumpedFist");
				talk_turn(Ocharliemouse_cutscene, Scmouse_pumpfist);
			Text("Thanks, um...", "Sniffles Regular");
				talk_turn(Osniffles, Ssniffles_idle, 0, true);
				pause(7, 7, 10);
			Text("And you are...?", "Sniffles Regular");
			Text("...&Charlie...", "Charlie Red");
				talk_turn(Ocharliemouse_cutscene, Scmouse_embarrassed_red_side);
				pause(3, 3, 15);
			Text("I'm...&Charlie...", "Charlie Regular");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 3);
				pause(6, 6, 10);
			add_move_order();
		break;
		case "letsmovecharlie":
			Text("Come now, let's move Charlie!", "Hoots Regular");
				pause(9, 9, 5);
				talk_turn(Ohoots_cutscene, Splayer_capidle, 3);
			Text("If we don't hurry, I might miss my mid-morning nap!", "Hoots Happy");
				pause(18, 18, 5);
				talk_turn(Ohoots_cutscene, Splayer_capidle, 2);
			add_move_order();
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
