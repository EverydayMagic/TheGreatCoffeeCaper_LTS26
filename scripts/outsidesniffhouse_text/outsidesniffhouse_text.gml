function outsidesniffhouse_text(_text_id){
	switch (_text_id)
	{
		case "beenpartnerforseason":
			Text("Hootsworth...", "Charlie Regular");
			Text("I've been your partner for a season now...", "Charlie Regular");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0);
			Text("Why does everyone ignore me?", "Charlie Regular");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 1);
			Text("Why Charles, you aren't ignored...", "Hoots Sympa");
				talk_turn(Ohoots_cutscene, Splayer_capidle, 2);
			Text("You're just... er, a bit small.&That's all...", "Hoots Regular");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0);
				pause(14, 14, 5);
				pause(18, 18, 10);
				pause(31, 31, 10);
			Text("But you're still my partner.", "Hoots Happy");
			add_move_order();
		break;
		case "yeahiguess":
			Text("Yeah...&I guess.", "Charlie Regular");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 1);
				pause(7, 7, 10);
			add_move_order();
		break;
		case "findbanditscheer":
			Text("Let's find out where those bandits went.", "Hoots Regular");
				talk_turn(Ohoots_cutscene, Splayer_capidle, 3);
			Text("That'll cheer you up.", "Hoots Happy");
				talk_turn(Ohoots_cutscene, Splayer_capidle, 2);
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0);
			add_move_order();
		break;
	}
}

/*
Charlie: “Hootsworth, I’ve been your partner in this town for a season now. Why does everyone ignore me?”

Hootsworth: “Why Charles, you aren’t ignored. You’re just… er, a bit small that’s all. But you’re still my partner.”

Charlie: “Yeah... I guess.”

Hootsworth: “Let's find out where those bandits went. That’ll cheer you up.”
