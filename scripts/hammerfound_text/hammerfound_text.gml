function hammerfound_text(_text_id){
	switch(_text_id){
		
		case "handedhammer":
			Text("Hootsworth handed 'Hammer' to Clawdine.");
				text_color(17, 26, orange_col, orange_col, orange_col, orange_col);
			add_move_order();
		break;
		
		case "myhammer":
			Text("MY HAMMER!!!", "Clawdine Stars");
				talk_turn(Oclawdine, Sclawdine_star_talk);
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 1);
			add_move_order();
		break;
		
		case "hammerthanks":
			Text("Thanks Hootsworth!", "Clawdine Happy");
				talk_turn(Oclawdine, Sclawdine_talk_l);
			Text("One wooden deer comin' up!", "Clawdine BigSmile");
				talk_turn(Oclawdine, Sclawdine_smile);
			add_move_order();
		break;
		
		case "sayididgood":
			Text("Say, I did pretty good!", "Clawdine HappyNoStars");
				talk_turn(Oclawdine, Sclawdine_deerhold_talk);
				pause(4, 4, 5);
			add_move_order();
		break;
		case "didntshehoots":
			Text("You sure did!&Didn't she Hootsworth?", "Charlie Happy");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0, false, 13); 
				talk_turn(Oclawdine, Sclawdine_deerhold, 0);
				pause(13, 13, 15);
			Text("Hoot?", "Hoots Yawn");
				talk_turn(Ohoots_cutscene, Splayer_capsit_yawn);
				talk_turn(Ocharliemouse_cutscene, Scmouse_embarrassed_cap);
			Text("Oh yes, quite...", "Hoots Drowsy");
				talk_turn(Ohoots_cutscene, Splayer_capidle, 1);
				pause(2, 2, 5);
				pause(7, 7, 10);
			Text("Though...How do we carry this to Stump?", "Hoots Curious");
				talk_turn(Ohoots_cutscene, Splayer_capthink);
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 1);
				pause(6, 9, 2);
			add_move_order();
		break;
		case "carryha":
			Text("Carry it?&HA!", "Clawdine HappyNoStars");
				talk_turn(Oclawdine, Sclawdine_deerhold_talk);
				pause(9, 9, 10);
			add_move_order();
		break;
		
		case "youfitinside":
			Text("You fit inside it, silly!", "Clawdine BigSmile");
				talk_turn(Oclawdine, Sclawdine_smile);
				pause(18, 18, 3);
			Text("Pardon?", "Hoots Shocked");
				add_move_order();
		break;
		
		case "clawdinefire...":
			Text("...", "Clawdine Fire");
				pause(0, 2, 5);
			add_move_order();
		break;
		
		case "seemyselfin":
			Text("Th-that won't be necessary..!", "Charlie Shocked");
				pause(2, 2, 2);
			Text("I can see myself in...", "Charlie Heh");
			add_move_order();
		break;
		
		case "readytoride":
			Text("Ok gang!", "Clawdine HappyOpen");
				talk_turn(Oclawdine, Sclawdine_talk);
			Text("Ready to ride?!", "Clawdine Fire");
				talk_turn(Oclawdine, Sclawdine_fire);
			Text("Now wait just a moment!!!!", "Hoots Shocked");
				textspeed_change(1.5);
			Text("Ugh- fine!", "Clawdine HmmCrossed");
				talk_turn(Oclawdine, Sclawdine_hips_eyebrow);
				pause(4, 4, 10);
			Text("I'll give you 'till the count of three.", "Clawdine BigSmile");
				talk_turn(Oclawdine, Sclawdine_smile);
			Text("...phew&A chance to catch our-", "Hoots Drowsy");
				textspeed_change(0.5);
				pause(7, 7, 10);
				skip();
			Text("Three!!!!!!!!", "Clawdine Fire");
				talk_turn(Oclawdine, Sclawdine_fire);
				skip();
			Text("Oh my!!!!!!!!", "Hoots Shocked");
				skip();
			add_move_order();
		break;
		
	}
}

/*

Clawdine: “My hammer! Thanks Hootsworth. One wooden deer coming up!”

A cartoonish dust cloud appears as Clawdine carves out a wooden deer. Hootsworth falls asleep while this is happening!

Clawdine: “Say, I did pretty good!”

Charlie: “You sure did - didn’t she Hootsworth?”

Hootsworth: “Hoot?” (waking up) “Oh yes, quite. How are we supposed to carry this?”

Clawdine: “Carry it? Ha! You fit inside it, silly!”

Hootsworth: “Pardon?”

Clawdine picks up a surprised Hootsworth and forcefully shoves him inside the back of the wooden deer. Clawdine goes towards Charlie and reaches out. Charlie backs up a step.

Charlie: “Th-that won’t be necessary! I can see myself in.”

Charlie quickly hops inside the back of the deer.

Clawdine: “Okay gang! Ready to ride?”

Hootsworth: “Wait what?!”

Clawdine: “Ugh - fine! I’ll give you ‘til the count of three.”

Clawdine waits only a second.

Clawdine: “Three!”


Clawdine slashes the deer, laughing as the wooden deer barrels out the doorway. Once outside, Charlie says his line. 