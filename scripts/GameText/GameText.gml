// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Game_Text(_text_id){
var _diabubble = 1;
var _signbubble = 2;
var _yellowcol = #FFDD3D;
global.textActive = true;

///This just goes through each of these functions to find what text to put
///Does the same stuff as the original system but it's more organized now
CutsceneTextFind(_text_id);
NPCTextFind(_text_id);
FlavorTextFind(_text_id);
ItemTextFind(_text_id);


switch(_text_id) {
	
	//Only for trailer
	case "snifflestrailer":
		//Text("Oh dear...&I hope you boys find those beans...", "Sniffles Regular");
		//	pause(11, 11, 15);
		Text("She sells sea shells by the sea shore", "Hoots Regular");
		Text("She sells sea shells by the sea shore", "Charlie Regular");
		Text("She sells sea shells by the sea shore", "Joe Regular");
		Text("She sells sea shells by the sea shore", "Jitters Regular");
		Text("She sells sea shells by the sea shore", "Sniffles Regular");
		Text("She sells sea shells by the sea shore", "Puffy Regular");
		Text("She sells sea shells by the sea shore", "Clawdine Regular");
		Text("She sells sea shells by the sea shore", "Stump Regular");
		Text("She sells sea shells by the sea shore");
	break;
	case "jitterstrailer":
		Text("Stole the coffee!?&It wasn't me!", "Jitters Wah");
			pause(18, 18, 5);
		Text("Stop pointing fingers!!", "Jitters Wah");
	break;
	case "clawdinetrailer":
		Text("Someone stole the coffee beans, you say?", "Clawdine HmmCrossed");
		Text("Let's find the punk who did it!", "Clawdine Fire");
	break;
	
	case "sparkfound_battletutorial":
		Text("Aha!&A Spark!", "No Hat Hoots Regular");
			pause(4, 4, 10);
			text_color(6, 11, orange_col, orange_col, orange_col, orange_col);
		Text("Where there's Sparks, there's a clue to be found!", "No Hat Hoots Happy");
			pause(21, 21, 10);
			text_color(13, 19, orange_col, orange_col, orange_col, orange_col);
		global.battleTutorial[0] = false;
	break;
	
	case "donthaveallday_battletutorial":
		Text("But we don't have all day!", "No Hat Hoots Regular");
		Text("If my watch runs out, the Spark will disappear!", "No Hat Hoots Regular");
			text_color(6, 19, orange_col, orange_col, orange_col, orange_col); 
			pause(20, 20, 10);
		global.battleTutorial[1] = false;
	break;
	
	case "bumpspark_battletutorial":
		Text("Ah ha!&There's a spark!", "No Hat Hoots Happy");
			pause(6, 6, 10);
		Text("Press 'Z' to bump the spark out of its hiding place!");
			pause(9, 9, 10);
			text_color(5, 9, orange_col, orange_col, orange_col, orange_col);
			text_color(12, 17, orange_col, orange_col, orange_col, orange_col);
		Text("Hoot?&Hooo's there?", "No Hat Hoots Regular");
			pause(5, 5, 10);
		global.battleTutorial[2] = false;
	break;
	
	case "draftedfiend_battletutorial":
		Text("Hoot!&Dratted fiend!", "No Hat Hoots Regular");
			pause(5, 5, 5);
		Text("That one pinched a little...", "No Hat Hoots Regular");
			text_color(8, 24, orange_col, orange_col, orange_col, orange_col);
		Text("Don't let your health meter reach 0!");
			text_color(14, 27, orange_col, orange_col, orange_col, orange_col);
			text_color(33, 34, orange_col, orange_col, orange_col, orange_col);
		Text("...", "No Hat Hoots Curious");
			pause(0, 2, 10);
		Text("I must be hearing things...", "No Hat Hoots Drowsy");
		global.battleTutorial[3] = false;
	break;
	
	case "chasespark_battletutorial":
		Text("There they go!&I shall give chase!", "No Hat Hoots Happy");
			text_color(23, 32, orange_col, orange_col, orange_col, orange_col);
		global.battleTutorial[4] = false;
	break;
	
	case "tiredspark_battletutorial":
		Text("Ah ha!&All worn out!", "No Hat Hoots Regular");
			pause(6, 6, 10);
		Text("Now's my chance!", "No Hat Hoots Happy");
		if (!global.settings.battle_control_hold)
		{
			Text("When your over the spark, MASH 'Z'!");
				pause(25, 25, 10);
				text_color(25, 33, orange_col, orange_col, orange_col, orange_col); 
		} else {
			Text("When your over the spark, HOLD 'Z'!");
				pause(25, 25, 10);
				text_color(25, 33, orange_col, orange_col, orange_col, orange_col);	
		}
		global.battleTutorial[5] = false;
	break;
	
	case "bigsparkboss_intro":
		Text("Hmmm...", "Hoots Curious");
		Text("Where are the sparks?", "Hoots Curious");
		global.bigsparkboss_intro[0] = false;
	break;
	case "bigsparkboss_intro2":
		Text("Oh my...", "Hoots Wide-Eyed");
		Text("Looks like Hootsworth has found a rare spark!");
		Text("I have?", "Hoots Curious");
		Text("Why yes!&And right before the end of the demo too!");
			pause(8, 8, 10);
		Text("Demo?&What is a-", "Hoots Shocked");
			pause(5, 5, 10);
			auto(5, true);
		Text("Ah, nevermind that Detective!");
		Text("These sparks attack until they get tired...");
			text_color(12, 19, orange_col, orange_col, orange_col, orange_col);
			text_color(34, 39, orange_col, orange_col, orange_col, orange_col); 
		Text("That's your chance to move in!&What fun!");
			pause(30, 30, 10);
		Text("Well it seems like I have my work cut out for me...", "Hoots Drowsy");
		global.bigsparkboss_intro[0] = true;
	break;

	/////////
	//OTHER//
	/////////
		case "directions":
			var _sign = Osign
			Text("<- &Hootsworth Detective Agency", _sign, _signbubble);
			Text("^ &Stage", _sign, _signbubble);
			Text("-> &Neighborhood", _sign, _signbubble);
		break;
		case "roadblock":
			Text("CAUTION!&THIS AREA IS NOT SAFE!", Oroadblock,_signbubble);
			Text("(don't go past this)&&-Caleb", Oroadblock,_signbubble);
		break;
	
		case "headtest":
			Text("Blah", "Hoots Regular", Oplayer);
			Text("Blorg", "No Hat Hoots Regular", Oplayer);
			Text("No text goes here just so you know buddy.");
		break;
		case "selectfont_gamestart":
			Text("She sells sea shells down by the sea shore.");
		break;
		case "doorlocked":
			Text("The door is locked.");
		break;
		case "pushblockinstructions":
			Text("Hmm...", "Hoots Curious");
			Text("I might be able to push this, but my hands are full...", "Hoots Curious");
				pause(29, 29, 5);
		break;
		

	//-----------------------OTHER------------------------//
		case "cutsceneerror": Text("Cutscene ID don't work boy"); break;
		case "foundbug":
			Text("Woah! Looks like you found an error!", "Jitters Wild");
			Text("Hopefully these are pretty rare to find...", "Jitters Calm");
			Text("They can be pretty scary, so make sure you report this!", "Jitters Scary");
		break;
		case "lamp did this":
			Text("Why did you do this?");
		break;
		//default: Text("Um, Frank?&I think there's been an error.");

}
}