function timetoflirtdeer_text(_text_id){
	switch (_text_id)
	{
		case "guesstoflirt":
			Text("I guess it's time to flirt with a deer...", "Charlie Red");
			Text("How do we move this thing?", "Charlie Confused");
			Text("Hoot!&Is that a foot pedal poking me?", "Hoots Shocked");
				pause(5, 5, 10);
			Text("I'll try pushing it.", "Hoots Regular");
			add_move_order();
		break;
	}
}