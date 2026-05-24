function meetbeanbandits_text(_text_id){	
	var puffy = Opuffy;
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	switch (_text_id)
	{
				
		case "wegotdis":
			Text("C'mon!&We got dis in da bag!", "Puffy Devious");
				talk_turn(puffy, puffy.idle_side_talk_spr);
				pause(6, 6, 10);
			Text("...", "Stump Regular");
				talk_turn(puffy, puffy.idle_r_spr);
				pause(0, 2, 10);
			Text("Don't gimme dat wook!", "Puffy Irritated");
				talk_turn(puffy, puffy.idle_mad_r_spr);
			Text("Dis heist will be even easier den dat wast one!", "Puffy Irritated");
			add_move_order();
		break;
		
		case "morningpuffy":
			Text("Oh look!&It's Puffy!", "Hoots Regular");
				pause(8, 8, 10);
			Text("Good morning Puffy!", "Hoots Happy");
			Text("Here now, Charles.&Say hi to-", "Hoots Happy");
				pause(18, 18, 10);
			add_move_order();
		break;
		
		case "hootsmmph":
			Text("-mmph!", "Hoots Mmph");
			add_move_order();
		break;
		
		case "didyahearsomething":
			Text("What's dat?", "Puffy NoSmile");
				talk_turn(puffy, puffy.idle_side_talk_nosmile_spr, -1, true);
			Text("Did ya hear someth'n, Stump?", "Puffy NoSmile");
				talk_turn(puffy, puffy.idle_side_talk_nosmile_spr);
			Text("...", "Stump Regular");
				talk_turn(puffy, puffy.idle_r_spr);
				pause(0, 2, 10);
			Text("I didn't tink so.&Must'a been da wind...", "Puffy NoSmile");
				talk_turn(puffy, puffy.idle_side_talk_nosmile_spr);
				pause(17, 17, 15);
			add_move_order();
		break;
		
		case "nogoodbandits":
			Text("It's those notoriously naughty no-good bandits!", "Charlie Whisper");
			Text("Let's hide behind that tree and spy...", "Charlie Whisper");
			add_move_order();
		break;
		
		case "treeandspy":
			Text("I've got a better idea...", "Hoots Whisper");
				talk_turn(hoots, Splayer_whisper, 0);
			Text("Let's hide behind that tree and spy...", "Hoots Whisper");
			Text("...", "Charlie Whisper");
				pause(0, 2, 10);
			add_move_order();
		break;
		
		case "anywayeasypeesy":
			Text("Anyways, dis heist is easy peesy!", "Puffy Happy");
				talk_turn(puffy, puffy.idle_side_talk_nosmile_spr);
				pause(8, 8, 5);
			Text("I've been up in da sky watch'n dis bird for days.", "Puffy Devious");
			Text("He always weaves his house for a morning stwoll!", "Puffy Devious");
			Text("When he's gone, we'll bweak in and take what's ours!", "Puffy Devious");
				pause(15, 15, 10);
			Text("Ya got it?", "Puffy Irritated");
			Text("...", "Stump Regular");
				talk_turn(puffy, puffy.idle_mad_r_spr);
				pause(0, 2, 10);
			Text("Stump, if you mess up dis heist wike da wast one...", "Puffy Angry");
				pause(6, 6, 5);
			add_move_order();
		break;
		
		case "illooo":
			Text("I'll-ooo&I'll-", "Puffy Dark");
				talk_turn(Opuffy, Spuffy_stormy_f);
			add_move_order();
		break;
		
		case "morningstroll":
			Text("What a beeeautiful day for a morning stroll!", "Sniffles Happy");
			Text("Dats da guy Stump!&We gotta hide!", "Puffy Distressed");
				talk_turn(puffy, puffy.idle_shocked_r_spr);
				pause(18, 18, 10);
			add_move_order();
		break;
		
		case "wonderfultolive":
			Text("It's wonderful to live in a town like this!", "Sniffles Happy");
			Text("Door unlocked,", "Sniffles Happy");
			Text("Cherished belongings left unattended...", "Sniffles Happy");
			Text("Not a worry in the world!", "Sniffles Happy");
			Text("Isn't that right, my darling unhatched niece?", "Sniffles Happy");
				pause(17, 17, 5);
			add_move_order();
		break;
		
		case "youdagree":
			Text("I knew you'd agree!", "Sniffles Happy");
			add_move_order();
		break;
		
		case "nowsourchance":
			Text("Now's our chance!", "Puffy Devious");
				talk_turn(puffy, Spuffy_treehang, 1);
			Text("C'mon-!", "Puffy Devious");
			add_move_order();
		break;
		case "oof":
			Text("Oof!&It's a bit cwamped back here..", "Puffy NoSmile");
				talk_turn(puffy, Spuffy_treehang, 4);
				pause(4, 4, 15);
			Text("Stump! Have you been cheat'n on your diet?", "Puffy Irritated");
				talk_turn(puffy, Spuffy_treehang, 2);
				pause(6, 6, 10);
			Text("Diet!?&What are you implying you little-", "Hoots Shocked");
				talk_turn(puffy, Spuffy_treehang, 5);
				talk_turn(hoots, Splayer_treehang, 1);
				pause(6, 6, 15);
			add_move_order();
		break;
		case "dafuzz":
			Text("Da fuzz?!&Wun for your life!", "Puffy Distressed");
				pause(9, 9, 10);
			add_move_order();
		break;
		case "whatpuffysaid":
			Text("Did you hear what Puffy said?!", "Charlie Distressed");
				talk_turn(charlie, charlie.idle_distressed_side_spr, -1, true);
				talk_turn(hoots, hoots.idle_cap_spr, 0);
			Text("I am NOT going on a diet.", "Hoots Harumph");
				talk_turn(hoots, Splayer_harumph, 0);
				pause(8, 8, 5);
			Text("Not that!&They're thieves!", "Charlie Distressed");
				pause(9, 9, 10);
			Text("They pulled a heist and they're pulling another one now!", "Charlie Distressed");
			Text("The white fluff we found must be from that cloud.", "Charlie Curious");
				talk_turn(charlie, Scmouse_think, 0);
			Text("They gotta be our bean bandits!", "Charlie Shocked");
				talk_turn(charlie, charlie.idle_distressed_side_spr, -1, true);
			Text("Let's go get 'em!", "Charlie PumpedFist");
				talk_turn(charlie, Scmouse_pumpfist, 0);
			add_move_order();
		break;
		case "waitcharlie":
			Text("Wait, Charlie!", "Hoots Shocked");
				pause(5, 5, 5);
			add_move_order();
		break;
		case "ohwellsuchbold":
			Text("Oh well,&I'll catch up...", "Hoots Yawn");
				talk_turn(hoots, Splayer_cap_yawn);
				pause(8, 8, 10);
			Text("Such a bold fellow...", "Hoots Drowsy");
				talk_turn(hoots, Splayer_capidle, 3);
			Text("Though, I've never seen him this eager before...", "Hoots Regular");
				pause(7, 7, 10);
			add_move_order();
		break;
		case "hootwhatsthat":
			Text("Hoot?&What could that be?", "Hoots Curious");
				pause(5, 5, 15);
			add_move_order();
		break;
	}
}