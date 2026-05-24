
function bookworm_text(_text_id){
	var _diabubble = 1;

	switch (_text_id)
	{
		case "clumsyspelling":
			Text("Tsk, tsk!&Such clumsy spelling!");
				talk_turn(Obookworm, Obookworm.idle_onsign_spr);
				pause(4, 4, 10);
				pause(9, 9, 10);
			Text("How does anyone know where to go in this town?");
			Text("Excuse me little...", "Hoots Regular", Oplayer, _diabubble);
				talk_turn(Obookworm, Obookworm.idle_spr);
			Text("Bookworm, if you please...");
				talk_turn(Obookworm, Obookworm.idle_onsign_spr);
			Text("And I'm quite tall for my species, thank you very much...");
				pause(34, 34, 5);
			Text("But enough about me.&You wanted to see the sign, didn't you?");
				pause(21, 21, 15);
			Text("Quite so! If you could-", "Hoots Regular", Oplayer, _diabubble);
				talk_turn(Obookworm, Obookworm.idle_spr);
				pause(9, 9, 10);
			Text("Well, you couldn't possibly at the moment");
				talk_turn(Obookworm, Obookworm.idle_onsign_spr);
				pause(5, 5, 5);
			Text("I've never seen such a poorly written sign!");
			Text("Once I've corrected it, I'll be moving on to a new bookcase to sort.");
				pause(23, 23, 10);
			Text("Do you have a bookcase, by chance?");
			Text("Do I?!", "Hoots Happy", Oplayer, _diabubble);
				talk_turn(Obookworm, Obookworm.idle_spr);
			Text("Bookworm chap, the finest editions of Detective Sherly-", "Hoots Regular", Oplayer, _diabubble);
				pause(14, 14, 5);
			Text("Yes, yes, the children's novels...");
				talk_turn(Obookworm, Obookworm.idle_onsign_spr);
				pause(4, 4, 5);
				pause(9, 9, 10);
			Text("I can alphabetize those in no time.&Now, back to business...");
				pause(35, 35, 10);
				pause(40, 40, 10);
			add_move_order();
		break;
		
		case "tsktsk":
			Text("Tsk, tsk!&Such clumsy spelling!");
				talk_turn(Obookworm, Obookworm.idle_onsign_spr);
				pause(4, 4, 10);
				pause(9, 9, 10);
			add_move_order();
		break;	
	}
}