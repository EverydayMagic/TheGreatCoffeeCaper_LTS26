
function hootersflavor_text(_text_id){
var _diabubble = 1;

	/////////////////////
	//HOOTSWORTHS HOUSE//
	/////////////////////
	
	//if (global.saveslot_story[global.saveslot][1][1] = 1 && global.saveslot_story[global.saveslot][8][1] = 1)
							//Text("Perhaps there will be time for coffee later...", "Hoots Regular", Oplayer, _diabubble);	
	switch (_text_id)
	{
		//Coffee Cup
			case "hootshousecoffee":
				if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0 && Oitem_manager.inv[1].display_name != "Spark Glass")
				{
					Text("There's no time for coffee! I need my spark glass!", "No Hat Hoots Regular", Ohoots_cutscene, _diabubble);
						pause(27, 27, 10);
						text_color(37, 48, orange_col, orange_col, orange_col, orange_col);
				} else {
					if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0 && Oitem_manager.inv[0].name = "Unknown")
					{
						Text("There's no time for coffee! I need my hat!", "No Hat Hoots Regular", Oplayer, _diabubble);
							pause(27, 27, 10);
							text_color(37, 40, orange_col, orange_col, orange_col, orange_col);
					} else {
						if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0 && Oitem_manager.inv[0].name != "Unknown")
						{
							Text("There's no time for coffee! I need to get to 'Cup O' Joe'!", "Hoots Regular", Oplayer, _diabubble);
								pause(27, 27, 10);
								text_color(45, 56, orange_col, orange_col, orange_col, orange_col);
						} else {
							if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 1)
								Text("Perhaps there will be time for coffee later...", "Hoots Regular", Oplayer, _diabubble);		
						}
					}
				}
			break;
		//Magnifying Glass
			case "hootshousemglass":
				Text("Here's my spark glass!", "No Hat Hoots Regular", Oplayer, _diabubble);
				Text("Now where did I leave that hat of mine?","No Hat Hoots Curious", Oplayer, _diabubble);
					text_color(26, 30, orange_col, orange_col, orange_col, orange_col);
			break;
		//Detective Hat
			case "hootshousehootshat":
				Text("That's better!", "Hoots Regular", Oplayer, _diabubble);
				Text("A detective is never complete without his proper attire.", "Hoots Happy", Oplayer, _diabubble);
				Text("Now I need to get to Cup O' Joe!", "Hoots Regular", Oplayer, _diabubble);
					text_color(20, 30, orange_col, orange_col, orange_col, orange_col);
				add_move_order();
			break;
		//Bookcase
			case "hootshousebookcase":
				if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
				{
					if (global.playerIdle = Splayer_idle)
					{
						Text("I can read later!&I must get going!", "No Hat Hoots Regular", Oplayer, _diabubble);
					} else {
						Text("I can read later!&I must get going!", "Hoots Regular", Oplayer, _diabubble);
					}
				} else {
					Text("My wonderful book collection.", "Hoots Happy", Oplayer, _diabubble);
				}
			break;
		//Dishes
			case "hootshousedishes":
				if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
				{
					if (global.playerIdle = Splayer_idle)
					{
						Text("I can admire dishes later!&I must get going!", "No Hat Hoots Regular", Oplayer, _diabubble);
					} else {
						Text("I can admire dishes later!&I must get going!", "Hoots Regular", Oplayer, _diabubble);
					}
				} else {
					Text("Look at these plates sorted so neatly.", "Hoots Happy", Oplayer, _diabubble);
				}
			break;
		//Sink
			case "hootshousesink":
				if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
				{
					if (global.playerIdle = Splayer_idle)
					{
						Text("I can get water later!&I must get going!", "No Hat Hoots Regular", Oplayer, _diabubble);
					} else {
						Text("I can get water later!&I must get going!", "Hoots Regular", Oplayer, _diabubble);
					}
				} else {
					Text("I'm not very thirsty right now, perhaps some other time.", "Hoots Regular", Oplayer, _diabubble);
				}
			break;
		//Jars
			case "hootshousejars":
				if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
				{
					if (global.playerIdle = Splayer_idle)
					{
						Text("I can get snacks later!&I must get going!", "No Hat Hoots Regular", Oplayer, _diabubble);
					} else {
						Text("I can get snacks later!&I must get going!", "Hoots Regular", Oplayer, _diabubble);
					}
				} else {
					Text("My wonderful jar of coffee beans.", "Hoots Regular", Oplayer, _diabubble);
					Text("For the best brew and a scrumptious snack!", "Hoots Happy", Oplayer, _diabubble);
				}
			break;
		//Grandfather Clock
			case "hootshouseclock":
				if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
				{
					if (global.playerIdle = Splayer_idle)
					{
						Text("My, my, look at the time!&I must get going!", "No Hat Hoots Regular", Oplayer, _diabubble);
					} else {
						Text("My, my, look at the time!&I must get going!", "Hoots Regular", Oplayer, _diabubble);
					}
				} else {
					Text("My, my, look at the time!", "Hoots Regular", Oplayer, _diabubble);
				}
			break;
		//Bed
			case "hootshousebed":
				if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
				{
					if (global.playerIdle = Splayer_idle)
					{
						Text("There's no time for a nap!&I must get going!", "No Hat Hoots Regular", Oplayer, _diabubble);
					} else {
						Text("There's no time for a nap!&I must get going!", "Hoots Regular", Oplayer, _diabubble);
					}
				} else {
					Text("Quite the comfy bed...", "Hoots Regular", Oplayer, _diabubble);
					Text("Stuffed with the fallen feathers of my ancestors!", "Hoots Happy", Oplayer, _diabubble);
				}
			break;
		//Book
			case "hootshousebook":
				if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
				{
					if (global.playerIdle = Splayer_idle)
					{
						Text("No time for a quick read!&I must get going!", "No Hat Hoots Regular", Oplayer, _diabubble);
					} else {
						Text("No time for a quick read!&I must get going!", "Hoots Regular", Oplayer, _diabubble);
					}
				} else {
					if (global.playerIdle = Splayer_idle)
					{
						Text("My lovely book!", "No Hat Hoots Regular", Oplayer, _diabubble);
						Text("Who knows what mysteries Detective Sherly will solve!", "No Hat Hoots Happy", Oplayer, _diabubble);
					} else {
						Text("My lovely book!", "Hoots Regular", Oplayer, _diabubble);
						Text("Who knows what mysteries Detective Sherly will solve!", "Hoots Happy", Oplayer, _diabubble);
					}
				}
			break;
		//Painting
			case "hootshousepainting":
				if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
				{
					if (global.playerIdle = Splayer_idle)
					{
						Text("There's no time to admire a painting!&I must get going!", "No Hat Hoots Regular", Oplayer, _diabubble);
					} else {
						Text("There's no time to admire a painting!&I must get going!", "Hoots Regular", Oplayer, _diabubble);	
					}
				} else {
					if (global.playerIdle = Splayer_idle)
					{
						Text("My wonderful painting!", "No Hat Hoots Happy", Oplayer, _diabubble);
						Text("A lovely piece to look at!", "No Hat Hoots Happy", Oplayer, _diabubble);	
					} else {
						Text("My wonderful painting!", "Hoots Happy", Oplayer, _diabubble);
						Text("A lovely piece to look at!", "Hoots Happy", Oplayer, _diabubble);	
					}
				}
			break;
		//Charlie Bed
			case "hootshousecharliebed":
				if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
				{
					if (global.playerIdle = Splayer_idle)
					{
						Text("There's no time for a nap on Charlie's bed!", "No Hat Hoots Regular", Oplayer, _diabubble);
					} else {
						Text("There's no time for a nap on Charlie's bed!", "Hoots Regular", Oplayer, _diabubble);
					}	
				} else {
					Text("Here is Charlie's bed!", "Hoots Happy", Oplayer, _diabubble);
					Text("He's been a lovely roommate.", "Hoots Happy", Oplayer, _diabubble);
					Text("A little jittery at times though...", "Hoots Regular", Oplayer, _diabubble);
					if (instance_exists(Ocharliemouse))
					{
						Text("...", "Charlie Red");
					}
				}
			break;
		//Charlie Clothes
			case "hootshousecharlieclothes":
				if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
				{
					if (global.playerIdle = Splayer_idle)
					{
						Text("No time to play dress up with Charlie's clothes!", "No Hat Hoots Regular", Oplayer, _diabubble);
					} else {
						Text("No time to play dress up with Charlie's clothes!", "Hoots Regular", Oplayer, _diabubble);
					}	
				} else {
					Text("Here are Charlie's clothes!", "Hoots Happy", Oplayer, _diabubble);
					if (instance_exists(Ocharliemouse))
					{
						Text("Yep, sure is...&heh heh...", "Charlie Heh");
							pause(4, 4, 5);
							pause(15, 15, 10);
					}
				}
			break;
		//Don't Leave the House
			case "hootshousedontleave":
				if (Oitem_manager.inv[0].name != "Hoots Hat")
				{
					Text("I can't leave yet!&I need to get dressed!", "No Hat Hoots Regular", Oplayer, _diabubble);
						pause(18, 18, 10);
						text_color(19, 39, orange_col, orange_col, orange_col, orange_col);
				} else {
					Text("I can't leave yet!&I need to get dressed!", "Hoots Regular", Oplayer, _diabubble);
						pause(18, 18, 10);
						text_color(19, 39, orange_col, orange_col, orange_col, orange_col);
				}
			break;
	}
}