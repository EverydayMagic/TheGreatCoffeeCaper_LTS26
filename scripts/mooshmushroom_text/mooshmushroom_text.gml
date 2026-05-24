// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mooshmushroom_text(_text_id){
	var _diabubble = 1;
	
	switch (_text_id)
	{
		#region Meet Moosh
		
			case "hmmm?":
				Text("Hmmm?", Omooshmushroom, _diabubble);
				add_move_order();
			break;
			case "finally audience":
				Text("*Gasp!*&Finally!&An audience!", Omooshmushroom, _diabubble);
					pause(7,7,5);
					pause(16,16,5);
				Text("Actually, I'm a detective.", "Hoots Happy", Oplayer, _diabubble);
				Text("Detective, eh?", Omooshmushroom, _diabubble);
				add_move_order();
			break;
			case "investigate dance":
				Text("Well get ready to investigate these dance moves!", Omooshmushroom, _diabubble);
				add_move_order();
			break;
			case "applause":
				Text("Well?", Omooshmushroom, _diabubble);
				Text("Well, what?", "Hoots Regular",Oplayer, _diabubble);
				Text("Applause ya big silly!", Omooshmushroom, _diabubble);
				Text("Oh...um,&Bravo!&Hoot hoot!", "Hoots Happy", Oplayer, _diabubble);
					pause(4, 4, 2);
					pause(8, 8, 5);
					pause(15, 15, 10);
				Text("Tee hee!", Oplayer, _diabubble);
				add_move_order();
			break;
		
		#endregion
		
		#region time in between "Meet Moosh" and "Moosh Again"
			
			case "moosh_waittilldance":
				Text("Whew...&Hi detective, how can I help ya?");
					pause(7, 7, 10);
					pause(21, 21, 5);
				Text("Hello again! Do you mind doing that little dance?", "Hoots Happy");
					pause(12, 12, 10);
				Text("Sorry detective, no can do.");
					pause(16, 16, 5);
				Text("These little legs need to rest...");
				Text("But come by later for another performance if you'd like!");
				add_move_order();
			break;
			
		#endregion
		
		#region Moosh Again
		
			case "mooshagain_1":
				Text("Oh boy!&Back for an encore, eh?");
					pause(7, 7, 10);
					pause(27, 27, 5);
				add_move_order();
			break;
			case "mooshagain_2":
				Text("Check out these moves!");
				add_move_order();
			break;
			
		#endregion
		
	}
}