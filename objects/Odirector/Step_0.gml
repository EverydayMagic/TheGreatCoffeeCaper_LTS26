switch (room) //For when cutscenes start when the player immeadietly enters the room
{
	case Rcoffeeshop:
		//if prologue hasn't been completed
		if (global.saveslot_story[global.saveslot][STORY_PACE.OPENING_CUTSCENE] = 0)
		{
			ex_cutscene("opening_cutscene");
		}
		
		if (global.saveslot_story[global.saveslot][STORY_PACE.OPENING_CUTSCENE] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0)
		{	
			ex_cutscene("Investigate CupOJoe");
		}
	break;
	
	
	case Rhooters:
		//If prologue has been completed but hootsworth's intro hasn't
		if (global.saveslot_story[global.saveslot][STORY_PACE.OPENING_CUTSCENE] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 0)
		{
			ex_cutscene("Act 1; Chapter 1; Scene 1;");
		}
		
		if (Oitem_manager.inv[0].name != "Hoots Hat" && global.story_beat = STORY_PACE.MOLE_MGLASS_TUTORIAL && !instance_exists(Ofade))
		{
			ex_cutscene("Mole Guide");	
		}
		
	break;
	
	case Routcoffeehouse:
		//if the closet stuff is done and thats the most that has been done
		if (global.saveslot_story[global.saveslot][STORY_PACE.FOUND_ALL_MAIN_CLUES] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.CHARLIE_DASH_AHEAD] = 0)
		{
			ex_cutscene("Charlie Dash Ahead");
		}
	break;
	
	case Rbeforeneighborhood:
		//meeting the bean bandits
		if (global.saveslot_story[global.saveslot][STORY_PACE.FOUND_ALL_MAIN_CLUES] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.MEET_BEAN_BANDITS] = 0)
		{
			ex_cutscene("Meet Bean Bandits");
		}
	break;
	
	case Rwoodshop:
		//meet clawdine
		if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_CLAWDINE] = 0 && global.saveslot_story[global.saveslot][STORY_PACE.OPEN_UP_BANDITS] = 1)
		{
			ex_cutscene("Meet Clawdine");	
		}
		//found hammer
		if (global.saveslot_story[global.saveslot][STORY_PACE.HAMMER_FOUND] = 0 && global.saveslot_story[global.saveslot][STORY_PACE.MEET_CLAWDINE] = 1 && Oitem_manager.inv[7].name = "Hammer")
		{
			ex_cutscene("Hammer Found");	
		}
	break;
	
	case Routchophouse:
		if (global.saveslot_story[global.saveslot][STORY_PACE.TIME_TO_FLIRT_DEER] = 0 && global.saveslot_story[global.saveslot][STORY_PACE.HAMMER_FOUND] = 1)
		{
			ex_cutscene("Time To Flirt Deer");	
		}
	break;
	
	
	
	
}

for (var i = 0, _cdone = 0; i < STORY_PACE.ENUM_LENGTH; i++)
{
	if (global.saveslot_story[global.saveslot][i] = 1)
		_cdone++;
	cuts_done = _cdone;
}
show_debug_message("cuts done: " + string(cuts_done));

//show_debug_message("story beat: " + string(global.story_beat))
//show_debug_message("meet clawdine: " + string(global.saveslot_story[global.saveslot][21][1]));
//show_debug_message("hammer found: " + string(global.saveslot_story[global.saveslot][22][1]));

global.story_percent[global.saveslot] = (100 / STORY_PACE.ENUM_LENGTH) * cuts_done;
//show_debug_message("story percent: " + string(global.story_percent[global.saveslot]))
