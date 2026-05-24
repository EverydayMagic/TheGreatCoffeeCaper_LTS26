function cut_foundallclues(){
	global.story_beat = STORY_PACE.FOUND_ALL_MAIN_CLUES;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	var joe = Ojoeturtle;
	
	global.moveOrder = [
		function(){
			if (!instance_exists(Omulti_goto))
			{
				Ohoots_cutscene.sprite_index = Splayer_capwalk_d;
				Ohoots_cutscene.image_index = 0;
				Ohoots_cutscene.image_speed = 1;
				var _x = Ohoots_cutscene.x;
				var _y = Ohoots_cutscene.y;
				
				with (instance_create_depth(0, 0, 0, Omulti_goto))
				{
					object = Ohoots_cutscene;
					origin_x = _x;
					origin_y = _y;
					x_pos = [88];
					y_pos = [123];
					spd = 1;
				}
			} else if (Ohoots_cutscene.x = 88 && Ohoots_cutscene.y = 123) {
				Ohoots_cutscene.sprite_index = Splayer_capidle;
				Ohoots_cutscene.image_index = 0;
				Ohoots_cutscene.image_speed = 0;
				add_move_order();
			}
		},
		function() {
			Ojoeturtle.visible = false;
			Ojoeturtle.x = 128;
			Ojoeturtle.y = 134;
			Ojoeturtle.sprite_index = Ojoeturtle.walk_b_spr;
			add_move_order();
		},
		[ costume_change, [charlie, charlie.walk_l_spr] ],
		[ goTo, [charlie, 136, 122, 108, 124, 1] ],
		[ costume_change, [charlie, charlie.idle_spr, 0] ],
		function() {
			Ojoeturtle.visible = true;
			add_move_order();	
		},
		[ goTo, [joe, 128, 134, 128, 124, 0.25] ],
		[ create_textbox, ["anyluckboys", joe, false] ],
		[ hold, [charlie, 1, "sec"] ],
		[ costume_change, [charlie, charlie.idle_embarrassed_red_side_spr, 1] ],
		[ create_textbox, ["meetyououtside", charlie, false] ],
		[ costume_change, [charlie, charlie.walk_r_spr] ],
		[ goTo, [charlie, 108, 124, 128, 124, 2] ],
		[ costume_change, [charlie, charlie.walk_d_spr] ],
		function(){
			goTo(Ojoeturtle, 128, 124, 136, 124, 2);
			goTo(Ocharliemouse_cutscene, 128, 124, 128, 132, 2, false);
		},
		function(){
			Ocharliemouse_cutscene.visible = false;	
			add_move_order();
		},
		[ costume_change, [joe, joe.idle_side_talk_l_spr] ],
		[ create_textbox, ["quickthing", joe, false] ],
		[ costume_change, [joe, joe.walk_l_spr] ],
		[ goTo, [joe, 136, 124, 128, 124, 0.25] ],
		[ costume_change, [joe, joe.walk_f_spr] ],
		[ goTo, [joe, 128, 124, 128, 134, 0.25] ],
		function() {
			Ojoeturtle.visible = false;
			add_move_order();
		}	
		
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
			
			//destroy special collision
			with (Ocol)
			{
				if (special || temp)
					instance_destroy();
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
			
			Ogame.alarm[1] = 5; //autosave
		}
			
	}
		
	//show_debug_message("array_length: " + string(array_length(global.moveOrder)));	
	//show_debug_message("move beat: " + string(global.moveOrder_beat));	
}