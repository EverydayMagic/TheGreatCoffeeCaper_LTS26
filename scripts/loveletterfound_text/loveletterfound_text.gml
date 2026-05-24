function loveletterfound_text(_text_id){
	switch(_text_id)
	{
		case "confusingparchment":
			Text("What a confusing parchment...", "Hoots Curious");
			Text("Perhaps I should return it to Stump.", "Hoots Happy");
			add_move_order();
		break;
	}
}