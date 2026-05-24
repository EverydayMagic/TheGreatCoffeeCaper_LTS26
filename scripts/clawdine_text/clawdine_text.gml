function clawdine_text(_text_id){
	switch (_text_id)
	{
		#region Meet Clawdine Before Invest
			
			case "pluckmywhiskers":
				Text("Well pluck my whiskers!", "Clawdine HappyNoStars");
					if ((round(Ohoots_cutscene.direction/90)) = 0) //talk turn
					{
						talk_turn(Oclawdine, Sclawdine_talk_l);
						talk_turn(Ohoots_cutscene, Splayer_capidle, 0);
					} else if ((round(Ohoots_cutscene.direction/90)) = 2) {
						talk_turn(Oclawdine, Sclawdine_talk_r);
						talk_turn(Ohoots_cutscene, Splayer_capidle, 2);
					} else {
						talk_turn(Oclawdine, Sclawdine_talk);
						talk_turn(Ohoots_cutscene, Splayer_capidle, 1);
					}
				Text("If it isn't Detective Hootsworth!", "Clawdine HappyNoStars");
				Text("Morning Clawdine!&What do you have there?", "Hoots Happy");
					if ((round(Ohoots_cutscene.direction/90)) = 0) //talk turn
					{
						talk_turn(Oclawdine, Sclawdine_idle, 2);
					} else if ((round(Ohoots_cutscene.direction/90)) = 2) {
						talk_turn(Oclawdine, Sclawdine_idle, 0);
					} else {
						talk_turn(Oclawdine, Sclawdine_idle, 3);	
					}
					pause(17, 17, 10);
				Text("Oh, you know me!&Just another project.", "Clawdine BigSmile");
					if ((round(Ohoots_cutscene.direction/90)) = 0) //talk turn
					{
						talk_turn(Oclawdine, Sclawdine_talk_l);
						talk_turn(Ohoots_cutscene, Splayer_capidle, 0);
					} else if ((round(Ohoots_cutscene.direction/90)) = 2) {
						talk_turn(Oclawdine, Sclawdine_talk_r);
						talk_turn(Ohoots_cutscene, Splayer_capidle, 2);
					} else {
						talk_turn(Oclawdine, Sclawdine_talk);
						talk_turn(Ohoots_cutscene, Splayer_capidle, 1);	
					}
					pause(16, 16, 10);
				Text("I'm replacing the leg of one of Joe's tables.", "Clawdine BigSmile");
				Text("Do you need me to build something for ya?", "Clawdine Happy");
				Text("Oh, no thank you. Not at the moment.", "Hoots Regular");
					if ((round(Ohoots_cutscene.direction/90)) = 0) //talk turn
					{
						talk_turn(Oclawdine, Sclawdine_idle, 2);
					} else if ((round(Ohoots_cutscene.direction/90)) = 2) {
						talk_turn(Oclawdine, Sclawdine_idle, 0);
					} else {
						talk_turn(Oclawdine, Sclawdine_idle, 3);
					}
				Text("I'm on my way to see our friend Joe.", "Hoots Happy");
				Text("It seems I'm needed for official detective business.", "Hoots Happy");
				Text("Meow!&That sounds important!", "Clawdine HmmHips");
					if ((round(Ohoots_cutscene.direction/90)) = 0) //talk turn
					{
						talk_turn(Oclawdine, Sclawdine_talk_l);
						talk_turn(Ohoots_cutscene, Splayer_capidle, 0);
					} else if ((round(Ohoots_cutscene.direction/90)) = 2) {
						talk_turn(Oclawdine, Sclawdine_talk_r);
						talk_turn(Ohoots_cutscene, Splayer_capidle, 2);
					} else {
						talk_turn(Oclawdine, Sclawdine_talk);
						talk_turn(Ohoots_cutscene, Splayer_capidle, 1);		
					}
					pause(5, 5, 10);
				Text("Well, I shouldn't keep you 'round here any longer...", "Clawdine Happy");
					pause(5, 5, 5);
				Text("If you ever need someth'n built, my claws are the best!", "Clawdine BigSmile");
					pause(32, 32, 5);
				Text("Catch you later, Hootsworth!", "Clawdine HappyNoStars");
				add_move_order();
			break;
			
		#endregion
	}
}

/*
Clawdine: “Well pluck my whiskers! If it isn’t Detective Hootsworth!”

Hootsworth: “Morning Clawdine! What do you have there?”

Clawdine: “Oh, you know me! Just another project. I’m replacing the leg of one of Joe’s tables. Do you need me to build something for you?”

 Hootsworth: “Not at the moment. I’m actually heading over to Cup of Joe right now on official detective business.”

Clawdine: “Meow! That sounds important. If you ever do need me to build something, my claws would love to dig into a new project. Catch you later, Hootsworth!”

*/