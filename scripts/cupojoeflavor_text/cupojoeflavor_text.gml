// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cupojoeflavor_text(_text_id){
	var _diabubble = 1;
	
	var _charlie = noone;
	if (instance_exists(Ocharliemouse))
	{
		_charlie = Ocharliemouse;	
	} else if (instance_exists(Ocharliemouse_cutscene)) {
		_charlie = Ocharliemouse_cutscene;	
	}
	
	switch (_text_id)
	{
		#region Cup O Joe Room
			
			//Mug Shelf
			case "cupojoemugshelf":
				Text("So many mugs...&So few beans...", "Joe Scared");
					pause(15, 15, 10);
			break;
			
			//Jars
			case "cupojoejars":
				Text("My, my!&What is that smelly smell?", "Hoots Wide-Eyed");
					pause(3, 3, 2);
					pause(7, 7, 10);
				Text("Is that?", "Hoots Curious");
				Text("-sniff-&-sniff-", "Hoots Eyes Closed");
					pause(7, 7, 10);
				Text("Cinnamon?", "Hoots Happy");
			break;
			
			//Broken Window
			case "cupojoebrokenwindow":
				Text("Ah yes...&An important clue...", "Hoots Squint");
					pause(9, 9, 10);
				Text("Joe, good sir? I believe I found something.", "Hoots Curious");
					pause(14, 14, 10);
				Text("Oh?", "Joe Regular");
				Text("It seems your window has been cracked.", "Hoots Regular");
				Text("...&Um...Yes...&Thank you.", "Joe Wide-Eyed");
					pause(0, 2, 2);
					pause(3, 3, 10);
					pause(8, 8, 5);
					pause(15, 15, 10);
			break;
			
			//Don't Leave the Place
				case "cupojoedontleave":
					Text("Hootsworth!&We can't leave yet!", "Charlie Happy", Ocharliemouse, _diabubble);
						pause(11, 11, 10);
				break;
			
			//Joe After Closet
				case "joeaftercloset":
					Text("Good luck on your mystery, Detective!", "Joe Regular");
						if ((round(Oplayer.direction/90)) = 0) //talk turn
						{
							talk_turn(Ojoeturtle, Sjoeturtle_sidetalk_l);	
						} else if ((round(Oplayer.direction/90)) = 2) {
							talk_turn(Ojoeturtle, Sjoeturtle_sidetalk);	
						} else if ((round(Oplayer.direction/90)) = 3) {
							talk_turn(Ojoeturtle, Sjoeturtle, 1);	
						}
				break;
			
			//Chair Pushed
				case "chairpushed":
					Text("It has been pushed.", "Hoots Regular");
				break;
			
		#endregion
		
		#region Coffee Closet Room
			
			//shelf close to the door
			case "cupocloset_shelfclose":
				Text("An assortment of fuits and jars.&(Musn't touch...)", "Hoots Regular");
					pause(32, 32, 10);
			break;
			
			case "cupocloset_shelffar":
				Text("Jars and plates and such...", "Hoots Regular");
			break;
			
			case "cupocloset_bag_1":
				Text("I wonder what could have gone here?", "Hoots Curious");
				if (instance_exists(_charlie) && _charlie.visible)
				{
					Text("H-huh??", "Charlie Confused");
						pause(1, 1, 5);
				}
			break;
			
			case "cupocloset_bag_2":
				Text("And here is another mysterious bag!", "Hoots Shocked");
				if (instance_exists(_charlie) && _charlie.visible)
				{
					Text("Mysterious!?&What are you talking about?", "Charlie Um");
						pause(12, 12, 5);
				}
			break;
			
			case "cupocloset_bag_3":
				Text("More bags...&The plot thickens.....", "Hoots Eyes Closed");
					pause(12, 12, 10);
				if (instance_exists(_charlie) && _charlie.visible)
				{
					Text("??????", "Charlie Red");
				}
			break;
			
			case "cupocloset_bag_4":
				Text("A fourth!?&There's an entire mystery afoot!", "Hoots Eyes Closed");
					pause(10, 10, 10);
				if (instance_exists(_charlie) && _charlie.visible)
				{
					Text("Hootsworth, those are for beans.&Ah, forget it...", "Charlie FacePalm");
						pause(11, 11, 5);
						pause(32, 32, 10);
						pause(36, 36, 5);
				}
			break;
			
		#endregion
	}
}