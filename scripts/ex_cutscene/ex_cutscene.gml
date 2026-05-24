
function ex_cutscene(_cut_id){
	
	if (Ocluehunt.cluehunt_active)
	{
		//go back to old music
		set_song_ingame(Oaudio_manager.oldSongAssetString_justsong, 0, 0, 0, true, noone, false, false, false, true);	
	}
	
	global.cutsceneActive = true;
	Ocluehunt.cluehunt_active = false;
	
	switch(_cut_id){
	
		case ("opening_cutscene"): 
			cut_open();
		break;
		case ("Act 1; Chapter 1; Scene 1;"):
			cut_act1chap1_scene1();
		break;
		case "Mole Guide":
			cut_moleguide();
		break;
		case ("Equip Hat"):
			cut_equiphootshat();
		break;
		case ("Meet Moosh"): 
			cut_meetmoosh();
		break;
		case "Moosh Wait Till Dance":
			cut_mooshwaittilldance();
		break;
		case ("Moosh Again"):
			cut_mooshagain();
		break;
		case ("Meet Bookworm"):
			cut_meetbookworm();
		break;
		case "Bookworm Again":
			cut_bookworm_again();
		break;
		case "Meet Clawdine before invest":
			cut_meetclawdinebeforeinvest();
		break;
		case "Investigate CupOJoe":
			cut_investcupojoe();
		break;
		case "Clues In Closet":
			cut_cluesincloset();
		break;
		case "CloudPuff Found":
			cut_cloudpufffound();
		break;
		case "BlueHat Found":
			cut_bluehatfound();
		break;
		case "MusicSheet Found":
			cut_musicsheetfound();
		break;
		case "Found All Clues":
			cut_foundallclues();
		break;
		case "Charlie Dash Ahead":
			cut_charliedashahead();
		break;
		case "Where Going?":
			cut_wheregoing();
		break;
		case "Where Going?2":
			cut_wheregoing2();
		break;
		case "Meet Bean Bandits":
			cut_meetbeanbandits();
		break;
		case "LoveLetter Found":
			cut_loveletterfound();
		break;
		case "Open Up Bandits":
			cut_openupbandits();
		break;
		case "Open Up Bandits BeforeLetter":
			cut_openupbanditsbeforeletter();
		break;
		case "Meet Clawdine":
			cut_meetclawdine();
		break;
		case "Hammer Found":
			cut_hammerfound();
		break;
		case "Time To Flirt Deer":
			cut_timetoflirtdeer();
		break;
		case "Trojan Deer Confront":
			cut_trojandeerconfront();
		break;


		default:
			global.cutsceneActive = false;
			create_textbox("cutsceneerror");
		break;
	
	}
	
}