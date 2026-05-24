randomize();
surface_depth_disable(true);

global.playerIdle = Splayer_idle;
global.playerWalk = Splayer_walk;

//You only need these when saving and loading to quit game or to title
player_spr_inuse = 0;
player_imgindex_inuse = 0;

global.font_classic = font_main;
global.font_name = font_dpcomic;
global.font_tiny = font_6px;
global.font_ffl = font_add_sprite(Sfont_ffl, 32, true, 1);  
global.font_arcade = font_karmaticarcade;

global.txtbox = Stxtbox;
global.textActive = false;

//room groups
global.insiderooms[0] = Rinit;
global.insiderooms[1] = Rhooters;
global.insiderooms[2] = Rcoffeecloset;
global.insiderooms[3] = Rcoffeeshop;
global.insiderooms[4] = Rhooterscloset;
global.insiderooms[5] = Rbattle;
global.insiderooms[6] = Rtitle;
global.insiderooms[7] = Rdebug_menu;
global.insiderooms[8] = Rsubtitle;
global.insiderooms[9] = Rgame_start;
global.insiderooms[10] = Rjitterhouse;
global.insiderooms[11] = Rsnifflehouse;
global.insiderooms[12] = Rwoodshop;
global.insiderooms[13] = Rgame_startmenu;
global.insiderooms[14] = Rdemo_credits;

global.debugActive = true;

global.gamePaused = false;
global.cutsceneActive = false;
global.battleActive = false;
global.battleTutorial = array_create(6, true);
global.bigsparkboss_intro = array_create(2, true);
global.itemAdding = false;
global.transitioning = false;

global.player_deaths = 0;
global.player_died_to = [];


global.moveOrder_beat = 0;
global.moveOrder[global.moveOrder_beat] = 0;


menu_char = [1, 2, 4];

global.settings = {
	volume: 0.75, //default volume level
	fullscreen: false,
	font: global.font_classic, //default font
	battle_control_hold: false, //hold button for atk is off for default
	menu_char: menu_char, //the characters on each save slot
}

load_settings();


global.saved_settings = [
	//nothing in it so we can fill it with other stuff
];

global.saving = false;
global.saveslot = 0;
global.saveload_array = [
	//nothing in it so we can fill it with other stuff
];
global.base_item_data_array = [
	//nothing in it so we can fill it with other stuff
];
global.now_loading = false;

if (file_exists("tgcc0.edm") || file_exists("tgcc1.edm") || file_exists("tgcc2.edm"))
{
	room_goto(Rtitle);
} else {
	room_goto(Rgame_startmenu);
}

if (global.debugActive)
{
	room_goto(Rdebug_menu);	
}


global.scene_cast[0] = 0;

global.char_face[0] = Shoots_faces;
global.char_face[1] = Shoots_nocap_faces;
global.char_face[2] = Scmouse_faces; 
global.char_face[3] = Sjoeturtle_faces;
global.char_face[4] = Sjitters_faces;
global.char_face[5] = Ssniffles_faces;
global.char_face[6] = Sclawdine_faces;
global.char_face[7] = Spuffy_faces;
global.char_face[8] = Sstump_faces;

global.char_in_room = [];
global.char_list[0] = Obookworm;
global.char_list[1] = Ocharliemouse;
global.char_list[2] = Ojitters;
global.char_list[3] = Ojoeturtle;
global.char_list[4] = Omooshmushroom;
global.char_list[5] = Osniffles;
global.char_list[6] = Oclawdine;
global.char_list[7] = Oleaf;
global.char_list[8] = Ocharliemouse_cutscene;
global.char_list[9] = Olog_scratch;
global.char_list[10] = Ocmouse_openupbb_cutcheck;
global.char_list[11] = Ofox;
global.char_list[12] = Ohedgehog;
global.char_list[13] = Omotherduck;
global.char_list[14] = Obabyduck;
global.char_list[15] = Obusinessfish;
global.char_list[16] = Obusinessfish_briefcase;
global.char_list[17] = Oharmony;
alarm[0] = 1;

//For all Charlies except Cutscene Charlie
global.charlie_list[0] = Ocharliemouse;
global.charlie_list[1] = Ocmouse_openupbb_cutcheck;

//for cluehunt
////they are empty so we can fill them
global.scripted_print_data = [];
	

//for battle
global.hp = 100;
global.total_hp = global.hp + 25;
global.damage_mod = 2;
global.battle_lock = false; //for when lose and win battle
global.battle_result = -1; //1 = win, 0 = loss by timer, 2 = loss by health


global.glass_id[0] = 0;

global.lamps_on = false;

global.multi_goto_done = 0;

global.sprinting_unlocked = true;



grid = false;
gamemaker_debug_ov = false;

quitting_game = false;
quit_game_text = "QUIT GAME";

load_game(Ogame);
