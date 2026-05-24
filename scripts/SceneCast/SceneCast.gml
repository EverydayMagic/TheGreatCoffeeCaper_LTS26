
function get_scene_cast(_scene_num){
	var joe = Ojoeturtle;
	var jitters = Ojitters;
	var sniffles = Osniffles;
	var hootsworth = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	var bookworm = Obookworm;
	var moosh = Omooshmushroom;
	var clawdine = Oclawdine;
	var puffy = Opuffy;
	var stump = Ostump;
	var mole = Omole;
	
	global.scene_cast = [];
	
	switch (_scene_num)
	{
		case STORY_PACE.OPENING_CUTSCENE:
			global.scene_cast[0] = joe;
			global.scene_cast[1] = jitters;
			global.scene_cast[2] = sniffles;
		break;
		
		case STORY_PACE.ACT1_CHAP1_SCENE1:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
		break;
		
		case STORY_PACE.MOLE_MGLASS_TUTORIAL:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = mole;
		break;
		
		case STORY_PACE.EQUIP_HOOTSHAT:
			global.scene_cast[0] = hootsworth;
		break;
		
		case STORY_PACE.MEET_MOOSH:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = moosh;
			if (instance_exists(Ocharliemouse))
			{
				global.scene_cast[2] = charlie;	
			}
		break;
		
		case STORY_PACE.MOOSH_WAIT_TILL_DANCE:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = moosh;
			if (instance_exists(Ocharliemouse))
			{
				global.scene_cast[2] = charlie;	
			}
		break;
		
		case STORY_PACE.MOOSH_AGAIN:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = moosh;
			if (instance_exists(Ocharliemouse))
			{
				global.scene_cast[2] = charlie;	
			}
		break;
		
		case STORY_PACE.MEET_BOOKWORM:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = bookworm;
			if (instance_exists(Ocharliemouse))
			{
				global.scene_cast[2] = charlie;	
			}
		break;
		
		case STORY_PACE.BOOKWORM_AGAIN:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = bookworm;
			if (instance_exists(Ocharliemouse))
			{
				global.scene_cast[2] = charlie;	
			}
		break;
		
		case STORY_PACE.MEET_CLAWDINE_BEFORE_INVEST:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = clawdine;
			if (instance_exists(Ocharliemouse))
			{
				global.scene_cast[2] = charlie;	
			}
		break;
		
		case STORY_PACE.INVESTIGATE_CUPOJOE:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = joe;
			global.scene_cast[2] = charlie;
		break;
		
		case STORY_PACE.CLUES_IN_CLOSET:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
		break;
		
		case STORY_PACE.CLOUDPUFF_FOUND:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
		break;
		
		case STORY_PACE.BLUEHAT_FOUND:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
		break;
		
		case STORY_PACE.MUSICSHEET_FOUND:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
		break;
		
		case STORY_PACE.FOUND_ALL_MAIN_CLUES:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
			global.scene_cast[1] = joe;
		break;
		
		case STORY_PACE.CHARLIE_DASH_AHEAD:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
		break;
		
		case STORY_PACE.WHERE_GOING:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
		break;
		
		//case 16: FORMERLY, WHERE_GOING_2
		//	global.scene_cast[0] = hootsworth;
		//	global.scene_cast[1] = charlie;
		//break;
		
		case STORY_PACE.MEET_BEAN_BANDITS:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
			global.scene_cast[2] = puffy;
			global.scene_cast[3] = stump;
			global.scene_cast[4] = sniffles;
			global.scene_cast[5] = Oegg_stroller;
		break;
		
		case STORY_PACE.LOVELETTER_FOUND:
			global.scene_cast[0] = hootsworth;
		break;
		
		case STORY_PACE.OPEN_UP_BANDITS:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
		break;
		
		case STORY_PACE.OPEN_UP_BANDITS_BEFORE_LETTER:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
		break;
		
		case STORY_PACE.MEET_CLAWDINE:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
			global.scene_cast[2] = clawdine;
		break;
		
		case STORY_PACE.HAMMER_FOUND:
			global.scene_cast[0] = hootsworth;
			global.scene_cast[1] = charlie;
			global.scene_cast[2] = clawdine;
		break;
		
		case STORY_PACE.TROJAN_DEER_CONFRONT:
			global.scene_cast[0] = charlie;
			global.scene_cast[1] = stump;
		break;
		
		
		default: show_error("CUTSCENE NUMBER DOES NOT EXIST", true);
	}
	
	//create instances if they dont exist already 
	///(their x's and y's will be set at the beginning of the cutscene)
	for (var i = 0; i < array_length(global.scene_cast); i++)
	{
		if (!instance_exists(global.scene_cast[i]))
		{
			if (global.scene_cast[i] != hootsworth)
			{
				var _charlie_check = false;
				for (var c = 0; c < array_length(global.charlie_list); c++)
				{
					if (global.scene_cast[i] = charlie && instance_exists(global.charlie_list[c]))
					{
						instance_create_depth(global.charlie_list[c].x, global.charlie_list[c].y, global.charlie_list[c].depth, charlie);
						_charlie_check = true;
					}
				}
				if (!_charlie_check){ instance_create_layer(0, 0, "Instances", global.scene_cast[i]); }
				
			} else {
				if (_scene_num = 1 && !instance_exists(Oplayer))
					instance_create_layer(120, 72, "Instances", Oplayer);
				with (instance_create_depth(Oplayer.x, Oplayer.y, Oplayer.depth, hootsworth))
				{
					//var _p = Oplayer;
					//if (instance_exists(_p))
					//{
					//	pos_x_togive = _p.pos_x;
					//	pos_y_togive = _p.pos_y; 
	
					//	toRecordSprite_togive = _p.toRecordSprite;
					//	toRecordImageIndex_togive = _p.toRecordImageIndex;
					//	toRecordImageSpeed_togive = _p.toRecordImageSpeed;	
					//}
				}
			}
		}
	}
}