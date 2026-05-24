sbeat_debug = false;
sbeat_input = "";
start_cutdebug = false;

global.story_beat = -1;
global.story_percent[0] = 0;
cuts_done = [];

story_data[0] = 0;
existing_in_room[0] = 0;
npc_story_char_list[0] = 0;

no_cut_mustwait = false;

enum STORY_PACE
{
	OPENING_CUTSCENE,
	ACT1_CHAP1_SCENE1,
	MOLE_MGLASS_TUTORIAL,
	EQUIP_HOOTSHAT,
	MEET_MOOSH,
	MOOSH_AGAIN,
	MOOSH_FINALE,
	MOOSH_WAIT_TILL_DANCE,
	MEET_BOOKWORM,
	BOOKWORM_AGAIN,
	MEET_CLAWDINE_BEFORE_INVEST,
	INVESTIGATE_CUPOJOE,
	CLUES_IN_CLOSET,
	CLOUDPUFF_FOUND,
	BLUEHAT_FOUND,
	MUSICSHEET_FOUND,
	FOUND_ALL_MAIN_CLUES,
	CHARLIE_DASH_AHEAD,
	WHERE_GOING,
	MEET_BEAN_BANDITS,
	LOVELETTER_FOUND,
	SNIFFLES_STROLLER_OUTSTAGE_1,
	SNIFFLES_STROLLER_OUTSTAGE_2,
	SNIFFLES_STROLLER_OUTSTAGE_3,
	OPEN_UP_BANDITS_BEFORE_LETTER,
	OPEN_UP_BANDITS,
	MEET_CLAWDINE,
	HAMMER_FOUND,
	TIME_TO_FLIRT_DEER,
	TROJAN_DEER_CONFRONT,
	
	ENUM_LENGTH,//THIS IS ALWAYS LAST!!! When you want to find length of enum, do STORY_PACE.ENUM_LENGTH - 1
}

for (var ss = 0; ss < 3; ss++)
{
	//set each story point for each save file to zero
	for (var sp = 0; sp < STORY_PACE.ENUM_LENGTH; sp++)
	{
		global.saveslot_story[ss][sp] = 0;	
	}
}

//ONLY FOR REFERENCE UNTIL THE FULL TRANSITION TO ENUM IS COMPLETE!!
#region Cutscene/Story Beat Name
	//global.story_pace[0, 0] = "opening cutscne";
	//global.story_pace[1, 0] = "Act 1; Chapter 1; Scene 1;";
	//global.story_pace[2, 0] = "Meet Moosh";
	//global.story_pace[3, 0] = "Moosh Again";
	//global.story_pace[4, 0] = "Moosh Finale";
	//global.story_pace[5, 0] = "Meet Bookworm";
	//global.story_pace[6, 0] = "Bookworm Again";
	//global.story_pace[7, 0] = "Meet Clawdine before invest";
	//global.story_pace[8, 0] = "Investigate CupOJoe";
	//global.story_pace[9, 0] = "Clues In Closet";
	//global.story_pace[10, 0] = "CloudPuff Found";
	//global.story_pace[11, 0] = "BlueHat Found";
	//global.story_pace[12, 0] = "MusicSheet Found";
	//global.story_pace[13, 0] = "Found All Clues";
	//global.story_pace[14, 0] = "Charlie Dash Ahead";
	//global.story_pace[15, 0] = "Where Going?";
	//global.story_pace[16, 0] = "Where Going?2";
	//global.story_pace[17, 0] = "Meet Bean Bandits";
	//global.story_pace[18, 0] = "LoveLetter Found";
	//global.story_pace[19, 0] = "Open Up Bandits";
	//global.story_pace[20, 0] = "Open LoveLetter";
	//global.story_pace[21, 0] = "Meet Clawdine";
	//global.story_pace[22, 0] = "Hammer Found";
	//global.story_pace[23, 0] = "My Deer Love";
	//global.story_pace[24, 0] = "Bandits in Sniffles House";
	//global.story_pace[25, 0] = "Why Charlie Ignored?";
	//global.story_pace[26, 0] = "SecretKnock Found";
	//global.story_pace[27, 0] = "Puffy Cornered";
	//global.story_pace[28, 0] = "PuffyEgg Found";
	//global.story_pace[29, 0] = "Eyes Peeled For Hat";
#endregion

load_game(Odirector);