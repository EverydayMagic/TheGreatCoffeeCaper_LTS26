
function cut_open(){
	global.story_beat = STORY_PACE.OPENING_CUTSCENE;
	get_scene_cast(global.story_beat);
	var joe = Ojoeturtle;
	var jitters = Ojitters;
	var sniffles = Osniffles;
	var _spd = 0.5;
	
			//TO THE MIDDLE TABLE
		global.moveOrder = [
			function(){
				//starting pos
				Ojitters.x = 104;
				Ojitters.y = 88;
				Osniffles.x = 24;
				Osniffles.y = 105;
				Ojoeturtle.x = 120;
				Ojoeturtle.y = 110;
				add_move_order();
			},
			//0
			[ costume_change, [jitters, jitters.idle_coffee_sip_spr] ],
			[ costume_change, [joe, joe.coffee_walk_l_spr] ],
			[ goTo, [joe, 120, 110, 72, 110, _spd] ],
			//1
			[ costume_change, [jitters, jitters.idle_coffee_spr, 2] ],
			[ costume_change, [joe, joe.coffee_walk_b_spr] ],
			[ goTo, [joe, 72, 110, 72, 93, _spd] ],
			//2
			[ costume_change, [jitters, jitters.idle_annoyed_spr] ],
			[ costume_change, [joe, joe.coffee_walk_l_spr] ],
			[ goTo, [joe, 72, 93, 40, 93, _spd] ],
			//move 3
		//Jitter's first line
			[ costume_change, [jitters, jitters.idle_annoyed_talk_spr] ],
			[ costume_change, [joe, joe.idle_coffee_spr, 2] ],
			[ create_textbox, ["yo joe", joe, false] ],
		//To the top table
		//move 7
			[ costume_change, [joe, joe.idle_spr, 3, false] ],
			[ tile_replace, ["Dec", 133, 2, 2, 6] ],
		//move 8
			[ hold, [joe, 3, "frm"] ],
			[ costume_change, [sniffles, sniffles.idle_talk_spr] ],
			[ create_textbox, ["thanks joe", sniffles, false] ],
		//move 9
			function(){
				if (!instance_exists(Otextbox))
				{
					//multi goto because regular goto didn't work too well (2)
					if (!instance_exists(Omulti_goto))
					{
						//set sprites
						Osniffles.sprite_index = Osniffles.sneeze_spr;
						Osniffles.image_index = 5;
						Osniffles.image_speed = 0;
					
						//tile replace
						tile_replace("Dec", 136, 2, 2, 6, true);
						tile_replace("Dec", 137, 3, 3, 6, true);
					
						with (instance_create_depth(0, 0, 0, Omulti_goto))
						{
							object = Osniffles;
							origin_x = 24;
							origin_y = 105;
							x_pos = [10];
							y_pos = [95];
							spd = 4;
						}
					} else {
						if (Osniffles.x = 10 && Osniffles.y = 95) 
						{
							while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
							Osniffles.visible = false;
							add_move_order();
						}
					}
				}
			},
		//move 11
			[ tile_replace, ["windowfloorforopen", 9, 0, 0, 5] ],
			function() {
				//sound effect
				play_sfx(snd_glassshattering);
				
				Oglassshard.visible = true;
				add_move_order();
			},
			function () {
				goTo(global.glass_id[0], 5, 88, 25, 92, 4, false);
				goTo(global.glass_id[1], 5, 88, 21, 83, 4, false);
				goTo(global.glass_id[2], 5, 88, 19, 100, 4);
			},
		//move 12
			[ hold, [joe, 0.25, "sec"] ],
		//move 13
			[ costume_change, [joe, joe.idle_side_talk_l_spr] ],
			[ create_textbox, ["see you tomorrow", joe, false] ],
			[ costume_change, [joe, joe.idle_spr, 2, false] ],
			[ hold, [joe, 0.25, "sec"] ],
		//move 14
			[ costume_change, [joe, joe.idle_talk_spr] ],
			[ create_textbox, ["now, i think everything", joe, false] ],
		//move 15
			[ costume_change, [jitters, jitters.idle_annoyed_talk_spr] ],
			[ costume_change, [joe, joe.idle_spr, 3, false] ],
			[ create_textbox, ["me you're forgetting me", jitters, false] ],
	//travelling to first coffee cup at the bar
		//move 17
			[ costume_change, [joe, joe.walk_r_spr] ],
			[ goTo, [joe, 40, 93, 88, 93, _spd] ],
		//move 18
			[ costume_change, [joe, joe.walk_b_spr] ],
			[ goTo, [joe, 88, 93, 88, 71, _spd] ],
		//move 19
			[ tile_replace, ["Dec", 121, 5, 5, 3] ],
			[ costume_change, [joe, joe.idle_coffee_spr, 1, false] ],
	//heading back to jitters
		//move 20
			[ hold, [joe, 0.125, "sec"] ],
		//move 21
			[ costume_change, [joe, joe.coffee_walk_r_spr] ],
			[ goTo, [joe, 88, 71, 121, 71, _spd] ],
		//move 22
			[ costume_change, [joe, joe.coffee_walk_f_spr] ],
			[ goTo, [joe, 121, 71, 121, 78, _spd] ],
		//move 31
			[ costume_change, [joe, joe.idle_spr, 3, false] ],
			[ costume_change, [jitters, jitters.idle_coffee_spr, 0] ],
			[ hold, [jitters, 2, "frm"] ],
		//move 32
			[ costume_change, [jitters, jitters.idle_coffee_talk_spr] ],
			[ create_textbox, ["now that's more", jitters, false] ],
			[ hold, [jitters, 0.5, "sec"] ],
		//move 34
			[ costume_change, [joe, joe.idle_talk_spr] ],
			[ create_textbox, ["if you don't mind", joe, 34, false] ],
		//move 35
			[ costume_change, [jitters, jitters.idle_crazy_coffee_spr] ],
			[ costume_change, [joe, joe.shocked_spr, 2, false] ],
			[ hold, [joe, 0.25, "sec"] ],
		//move 36
			[ costume_change, [joe, joe.shocked_talk_spr] ],
			[ create_textbox, ["golly jitters", joe, false] ],
			[ hold, [joe, 4, "frm"] ],
			[ costume_change, [joe, joe.shocked_spr, 2] ],
			[ hold, [joe, 4, "frm"] ],
		//move 39
			[ costume_change, [joe, joe.shocked_talk_spr] ],
			[ create_textbox, ["did you say", joe, false] ],
			function(){set_song_ingame("Prologue_Segment2.ogg", 60, 60, 0, true, noone, true); add_move_order();},
		//move 40
			[ costume_change, [joe, joe.shocked_spr, 2, false] ],
			[ costume_change, [jitters, jitters.idle_coffee_side_talk_spr] ],
			[ create_textbox, ["sure!", jitters, false] ],
		//move 45
			//[ costume_change, [jitters, jitters.walk_f_spr] ],
		//move 46
			function () { Ojoeturtle.coffeecup_ground = true; add_move_order(); },
		//move 47
			[ costume_change, [jitters, jitters.walk_f_spr] ],
			[ goTo, [jitters, 104, 88, 80, 136, 4] ],
			function () { Ojitters.visible = false; add_move_order(); },
		//move 48
			[ hold, [joe, 0.25, "sec"] ],
		//move 49
			[ costume_change, [joe, joe.idle_talk_spr] ],
			[ create_textbox, ["bye jitters", joe, false] ],
		//move 50
			[ costume_change, [joe, joe.walk_l_spr] ],
			[ goTo, [joe, 121, 78, 88, 78, _spd] ],
		//move 51
			[ costume_change, [joe, joe.walk_f_spr] ],
			[ goTo, [joe, 88, 78, 88, 84, _spd] ],
		//move 52
			function () { Ojoeturtle.coffeecup_ground = false; add_move_order(); },
			[ costume_change, [joe, joe.emp_coffee_walk_f_spr] ],
			[ goTo, [joe, 88, 84, 88, 98, _spd] ],
		//move 53
			[ costume_change, [joe, joe.emp_coffee_walk_l_spr] ],
			[ goTo, [joe, 88, 98, 80, 98, _spd] ],
		//move 54
			[ costume_change, [joe, joe.emp_coffee_walk_f_spr] ],
			[ goTo, [joe, 80, 98, 80, 134, _spd] ],
		//move 55
			[ costume_change, [joe, joe.idle_emp_coffee_spr, 3] ],
			function(){
				//door lock	sfx
				play_sfx(snd_doorlocking);
				add_move_order();
			},
			[ hold, [joe, 0.25, "sec"] ],
		//move 56
			[ costume_change, [joe, joe.emp_coffee_walk_b_spr] ],
			[ goTo, [joe, 80, 134, 80, 123, _spd] ],
		//move 57
			[ costume_change, [joe, joe.idle_emp_coffee_spr, 3, false] ],
			[ hold, [joe, 0.25, "sec"] ],
		//move 58
			[ costume_change, [joe, joe.idle_emp_coffee_talk_spr] ],
			[ create_textbox, ["check twice", joe, false] ],
		//move 59
			[ costume_change, [joe, joe.emp_coffee_walk_f_spr] ],
			[ goTo, [joe, 80, 123, 80, 134, _spd] ],
		//move 60
			[ costume_change, [joe, joe.idle_emp_coffee_spr, 3, false] ],
			function(){
				//door lock	sfx
				play_sfx(snd_doorlocking);
				add_move_order();
			},
			[ hold, [joe, 0.25, "sec"] ],
		//move 61
			[ costume_change, [joe, joe.emp_coffee_walk_b_spr] ],
			[ goTo, [joe, 80, 134, 80, 94, _spd] ],
		//move 62
			[ costume_change, [joe, joe.emp_coffee_walk_r_spr] ],
			[ goTo, [joe, 80, 94, 88, 94, _spd] ],
		//move 63
			[ costume_change, [joe, joe.emp_coffee_walk_b_spr] ],
			[ goTo, [joe, 88, 94, 88, 78, _spd] ],
		//move 64
			[ tile_replace, ["Dec", 124, 5, 5, 3] ],
			[ costume_change, [joe, joe.idle_spr, 3, false] ],
			[ hold, [joe, 0.125, "sec"] ],
		//move 65
			[ costume_change, [joe, joe.idle_talk_spr] ],
			[ create_textbox, ["scared hah", joe, false] ],
		
		//DARK MODE
		
		//move 66
			[ costume_change, [joe, joe.idle_spr, 3, false] ],
			[ hold, [joe, 0.125, "sec"] ],
		//move 67
			function(){ set_song_ingame("Prologue_Segment3.ogg"); add_move_order(); },
			function() {
				costume_change(Ojoeturtle, Ojoeturtle.darkshocked_spr, 0, false, "no");
				//dark mode
				layer_set_visible("DarkDec", true);
				layer_set_visible("DarkBase", true);
				layer_set_visible("OtherDarkDec", true);
				//turn light mode false
				layer_set_visible("Base", false);
				layer_set_visible("windowfloorforopen", false);
				layer_set_visible("Dec", false);
				layer_set_visible("OtherDec", false);
				
				Ojoeturtle.monster_ani = true;
				add_move_order();
			},
		//move 68
			[ hold, [joe, 0.125, "sec"] ],
		//move 70
			[ create_textbox, ["mother mocha", joe, false] ],
		//move 71
			[ costume_change, [joe, joe.shellin_spr] ],
			function() {
				if (Ojoeturtle.image_speed = 0 && Ojoeturtle.sprite_index = Ojoeturtle.shellin_spr)
				{
					with (Ocharshake)
					{
						shake = true;
						shake_time = "infin";
						shake_magnitude = 1;
						char = [Ojoeturtle];
						cut_dontadd = true;
						dir = "horz";
						delay = 2;
					}
					create_textbox("a monster", Ojoeturtle, false);
					Ojoeturtle.moveOrder = global.moveOrder_beat;
					Ojoeturtle.monster_ani_frm = 0;
					Ojoeturtle.monster_spr = Smonsterdooropen_anim;
				}
			},
			function(){
				if (!instance_exists(Otextbox))
				{
					play_sfx(snd_roar);
					add_move_order();
				}
			},
			[ hold, [joe, 23, "frm"] ],
		//move 72
			function(){ 
				Ojoeturtle.cuttoblack = true; 
				instance_create_depth(0, 0, -bbox_bottom, Ostart_title_lighting);
				add_move_order(); 
			},
		//move 73
			function() {
				if (Ostart_title_lighting.beat = 6){ set_song_ingame(noone, 120); }
				if (Ostart_title_lighting.beat >= 7)
				{
					with (instance_create_depth(0, 0, -bbox_bottom, Ofade))
					{
						trans_type = "iris";
						newRoom = Rhooters;
						waiting = true;
					}
					add_move_order();
				}
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
						
				if (global.debugActive)
				{
					with (Odirector)
					{
						sbeat_debug = false;
						sbeat_input = "";
						start_cutdebug = false;		
					}
				}
			}
			
		}
}