function cut_openupbanditsbeforeletter(){
	global.story_beat = STORY_PACE.OPEN_UP_BANDITS_BEFORE_LETTER;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;

	global.moveOrder = [
		function(){
			//hoots sprite change based on direction
			if (round(Ohoots_cutscene.direction/90) = 0)
			{
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				Ohoots_cutscene.image_index = 0;
				Ohoots_cutscene.image_speed = 0;	
			} else if (round(Ohoots_cutscene.direction/90) = 1) {
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				Ohoots_cutscene.image_index = 1;
				Ohoots_cutscene.image_speed = 0;	
			}
			Ocharliemouse_cutscene.sprite_index = Scmouse_doorbang;
			Ocharliemouse_cutscene.image_speed = 1;
			
			set_song_ingame("Crazy Theme.ogg", 0, 0, 0, true, noone, false, false, true);
			
			add_move_order();
		},
		function(){
			if (Ohoots_cutscene.x != 24 || Ohoots_cutscene.y != 65)
			{
				if (!instance_exists(Omulti_goto))
				{
					var _x = Ohoots_cutscene.x;
					var _y = Ohoots_cutscene.y;
					var _spr = Splayer_capwalk_d;
					if (Ohoots_cutscene.image_index != 1){ _spr = Splayer_capwalk_r; }
					with (instance_create_depth(0, 0, 0, Omulti_goto))
					{
						object = Ohoots_cutscene;
						origin_x = _x;
						origin_y = _y;
						x_pos = [24];
						y_pos = [65];
						spd = 1;
						spr_list = [_spr];
					}
				}
			} else {
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				Ohoots_cutscene.image_index = 1;
				Ohoots_cutscene.image_speed = 0;
				Ohoots_cutscene.direction = 90;
				while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
				add_move_order();
			}
		
		},
		[ create_textbox, ["openupbandits_beforeletter", charlie, true] ],
		[ costume_change, [charlie, Scmouse_doorbang] ],
		function(){
			if (!instance_exists(Otextbox))
			{
				set_song_ingame("Overworld Theme.ogg", 0, 0, 0, true, noone, false, false, false, true);	
			}
			add_move_order();
		},
	
	]
	
	if (global.moveOrder_beat < array_length(global.moveOrder))
	{
		var entry = global.moveOrder[global.moveOrder_beat];
		if (is_array(entry) == true)
			script_execute_ext(entry[0], entry[1]);      
		else
			entry();

	} else {
		/////////////////////////////////////////////
		//Uncomment this once cutscene is finished!//
		/////////////////////////////////////////////
			
			
		//erase the array for the next cutscene 
		//and tell the game we finished with this one
		if (!instance_exists(Otextbox))
		{
			array_delete(global.moveOrder, 0, global.moveOrder_beat - 1);
			global.moveOrder_beat = 0;
			global.cutsceneActive = false;
			
			global.saveslot_story[global.saveslot][global.story_beat] = 1;
		
			if (instance_exists(Ocharliemouse_cutscene))
			{
				instance_destroy(Ocharliemouse_cutscene);
				Ocmouse_openupbb_cutcheck.visible = true;
				Ocmouse_openupbb_cutcheck.alarm[0] = 1;
			}
		
			if (global.debugActive)
			{
				with (Odirector)
				{
					sbeat_debug = false;
					sbeat_input = "";
					start_cutdebug = false;		
				}
			}
			
			Ogame.alarm[1] = 5; //demo autosave
		}
			
	}
		
	//show_debug_message("array_length: " + string(array_length(global.moveOrder)));	
	//show_debug_message("move beat: " + string(global.moveOrder_beat));

}