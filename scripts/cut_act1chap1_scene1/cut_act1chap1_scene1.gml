
function cut_act1chap1_scene1(){
	global.story_beat = STORY_PACE.ACT1_CHAP1_SCENE1;
	get_scene_cast(global.story_beat);
	var hoots = Ohoots_cutscene;
	var charlie = Ocharliemouse_cutscene;
	var hoots_spd = 1;

	
			//READING STORY BOOK
		global.moveOrder = [
			//Starting Postitions and sprites
				//0
				function(){ 
					set_song_ingame(noone);
					Ohoots_cutscene.x = 120;
					Ohoots_cutscene.y = 72;
					Ocharliemouse_cutscene.visible = false;
					add_move_order();
				},
				//1
				[ costume_change, [hoots, hoots.idle_lookdown_nocap_spr, 0] ],
				function(){ 
					if (!instance_exists(Ofade))
						add_move_order();
				},
				//2
				[ create_textbox, ["to be continued", hoots, true] ],
				[ hold, [hoots, 10, "frm"] ],
			//look up
				//3
				[ costume_change, [hoots, hoots.idle_lookdown_nocap_spr, 1] ],
				//4
				[ create_textbox, ["hate cliff hangers", hoots, true] ],
			//hold & let the clock ring
				function(){
					if (instance_exists(Ograndclock) && !instance_exists(Otextbox))
					{
						play_sfx(snd_shortbellring);
						Ograndclock.ring = true;
						add_move_order();
					}
				},	
				//5
				[ hold, [hoots, 5, "sec"] ],
			//hootsworth sees the time
				//6
				[ costume_change, [hoots, hoots.idle_lookdown_nocap_spr, 2] ],
				//7
				[ create_textbox, ["sunrise already", hoots, true] ],
				function(){
					if (instance_exists(Ograndclock) && !instance_exists(Otextbox))
					{
						Ograndclock.ring = false;
						add_move_order();
					}
				},
			//sets the book down and faces the bed
				//8
				[ costume_change, [hoots, hoots.idle_nocap_spr, 3] ],
				//9
				function() {
					with (Oitem_ingame)
						if (item_id = global.item_list.book)
							visible = true;
					add_move_order();
				},
				//10
				[ hold, [hoots, 10, "frm"] ],
				//11
				[ costume_change, [hoots, hoots.idle_nocap_spr, 2] ],
			//goes to bed
				//12
				[ hold, [hoots, 10, "frm"] ],
				//13
				[ costume_change, [hoots, hoots.walk_l_spr] ],
				//14
				[ goTo, [hoots, 120, 72, 105, 76, hoots_spd] ],
				//15
				[ goTo, [hoots, 105, 76, 72, 76, hoots_spd] ],
				//16
				[ costume_change, [hoots, hoots.walk_u_spr] ], 
				//17
				[ goTo, [hoots, 72, 76, 72, 40, hoots_spd] ], 
				//18
				[ costume_change, [hoots, hoots.walk_l_spr] ],
				//19
				[ goTo, [hoots, 72, 40, 40, 40, hoots_spd] ],
				//20
				[ costume_change, [hoots, hoots.idle_nocap_spr, 2] ],
			//hops in bed
				//21 ~ top of bed
				[ tile_replace, ["Dec", 123, 1, 1, 1] ],
				//22 ~ bottom of bed
				[ tile_replace, ["Dec", 135, 1, 1, 2] ],
				//23
				[ hold, [hoots, 10, "frm"] ],
				//24
				[ goTo, [hoots, 40, 40, 24, 30, hoots_spd] ],
				//25
				[ tile_replace, ["Dec", 24, 1, 1, 2] ],
				//26
				[ costume_change, [hoots, hoots.bed_awake_spr] ],
				//27
				[ tile_replace, ["Dec", 0, 1, 1, 1] ],
				//28
				[ create_textbox, ["sock drawer", hoots, true] ],
			//falls asleep
				//29
				[ hold, [hoots, 10, "frm"] ],
				//30
				[ costume_change, [hoots, hoots.bed_asleep_spr] ],
				//31
				function(){
					play_sfx(snd_shortsnore);
					add_move_order();
				},
				//32
				function(){
					with (Oscreenshake)
					{
						if (shake = false)
						{
							shake = true;
							shake_time = 10;
							shake_magnitude = 0.25;
							dontadd = false;
						} 
					}
				},
				//33
				[ hold, [hoots, 6, "sec"] ],
				function(){
					if (audio_is_playing(snd_shortsnore))
					{
						audio_stop_sound(snd_shortsnore);
					}
					play_sfx(snd_doorknock);
					add_move_order();
				},
				[ hold, [hoots, 1, "sec"] ],
				//34
				[ costume_change, [hoots, hoots.bed_awake_spr] ],
				//35
				[ create_textbox, ["must be the wind", hoots, true] ],
				//36
				[ hold, [hoots, 10, "frm"] ],
				function(){
					//sound effect
					play_sfx(snd_shortsnore);
					add_move_order();
				},
				//37
				[ costume_change, [hoots, hoots.bed_asleep_spr] ],
				//38
				[ hold, [hoots, 1, "sec"] ],
				function(){
					if (audio_is_playing(snd_shortsnore))
					{
						audio_stop_sound(snd_shortsnore);
					}
					play_sfx(snd_doorknock);
					add_move_order();
				},
				[ hold, [hoots, 1, "sec"] ],
				//39
				[ costume_change, [hoots, hoots.bed_awake_spr] ],
				//40
				[ create_textbox, ["hoo goes there", hoots, true] ],
				//41
				[ hold, [hoots, 10, "frm"] ],
			//Getting out of bed
				//42
				[ tile_replace, ["Dec", 123, 1, 1, 1] ],
				//43
				[ costume_change, [hoots, hoots.idle_nocap_spr, 3] ],
				//44
				[ tile_replace, ["Dec", 135, 1, 1, 2] ],
				//45
				[ hold, [hoots, 10, "frm"] ],
				//46
				[ costume_change, [hoots, hoots.idle_nocap_spr, 0] ],
				//47
				[ goTo, [hoots, 24, 30, 40, 40, hoots_spd] ],
				function(){
					play_sfx(snd_doorknock);
					add_move_order();
				},
			//Walking to door	
				//48
				[ costume_change, [hoots, hoots.walk_r_spr] ],
				//49
				[ goTo, [hoots, 40, 40, 72, 40, hoots_spd] ],
				function(){
					play_sfx(snd_doorknock);
					add_move_order();
				},
				//50
				[ costume_change, [hoots, hoots.walk_d_spr] ],
				//51
				[ goTo, [hoots, 72, 40, 72, 64, hoots_spd] ],
				//52
				[ costume_change, [hoots, hoots.walk_r_spr] ],
				//53
				[ goTo, [hoots, 72, 64, 80, 64, hoots_spd] ],
				//54
				[ costume_change, [hoots, hoots.walk_d_spr] ],
				//55
				[ goTo, [hoots, 80, 64, 80, 120, hoots_spd] ],
				//56
				[ costume_change, [hoots, hoots.idle_nocap_spr, 3] ],
				function(){
					play_sfx(snd_doorknock);
					add_move_order();
				},
				//57
				[ create_textbox, ["confound it", hoots, false] ],
				//58
				[ hold, [hoots, 10, "frm"] ],
			//Charlie busts down the door
				//59
				[ costume_change, [charlie, charlie.walk_u_spr] ],
				//60
				function(){
					//sound effect
					play_sfx(snd_landing, 1, 0.5);
					add_move_order();
				},
				function(){
					with (Oscreenshake)
					{
						if (shake = false)
						{
							shake = true;
							shake_time = 10;
							shake_magnitude = 0.25;
							dontadd = false;
						} 
					}
				},
				//61
				function() { 
					Ocharliemouse_cutscene.x = 80;
					Ocharliemouse_cutscene.y = 136;
					Ocharliemouse_cutscene.visible = true; 
					Ocharliemouse_cutscene.depth = -y;
					set_song_ingame("Crazy Theme.ogg");
					add_move_order();
				},
				//62
				[ goTo, [charlie, 80, 136, 80, 121, 2] ],
				//63
				[ costume_change, [charlie, charlie.idle_spr, 1] ],
				//64
				[ costume_change, [hoots, hoots.idle_knockout_spr, 0] ],
				//65
				function() { 
					with (Ostarry_head)
					{
						visible = true;
						image_speed = 1;
					}
					with (Oscreenshake)
					{
						if (shake = false)
						{
							shake = true;
							shake_time = 10;
							shake_magnitude = 0.25;
							dontadd = true;
						} 
					}
					
					//sound effect
					play_sfx(snd_landing, 1, 0.5);
					
					add_move_order();
				},
				[ goTo, [hoots, 80, 120, 80, 96, hoots_spd * 3] ],
				//66
				[ costume_change, [charlie, charlie.idle_distressed_back_spr] ],
				[ create_textbox, ["no coffee", charlie, false] ],
				function(){
					if (!instance_exists(Otextbox))
					{
						audio_pause_sound(Oaudio_manager.songInstance);
						add_move_order();
					}
				},
				[ create_textbox, ["umhoots", charlie, false] ],
				function(){
					if (!instance_exists(Otextbox))
					{
						audio_resume_sound(Oaudio_manager.songInstance);
						add_move_order();
					}
				},
				[ create_textbox, ["starsswirlinghead", hoots, false] ],
			//Charlie helps Hootsworth up
				//73
				[ costume_change, [charlie, charlie.walk_u_spr] ],
				//74
				[ goTo, [charlie, 80, 120, 80, 99, 1] ],
				//75
				[ costume_change, [charlie, Scmouse_idle, 1] ],
				//76
				function() {
					with (Ostarry_head)
					{
						visible = false;
						image_speed = 0;
					}
					add_move_order();
				},
				[ costume_change, [hoots, hoots.idle_nocap_spr, 3] ],
				//77
				[ hold, [charlie, 10, "frm"] ],
				//78
				[ costume_change, [charlie, charlie.walk_u_spr] ],
				//79
				[ goTo, [charlie, 80, 99, 80, 120, 1] ],
				//80
				[ costume_change, [charlie, charlie.idle_distressed_back_spr] ],
				
				//81
				[ create_textbox, ["no rest", charlie, false] ],
			//Charlie dashes out the door
				//84
				[ costume_change, [charlie, charlie.walk_d_spr] ],
				//85
				[ goTo, [charlie, 80, 120, 80, 136, 2] ],
				//86
				function(){ 
					set_song_ingame(noone, 3 * FRAME_RATE);	
					instance_destroy(Ocharliemouse_cutscene); 
					add_move_order();
				},
				//87
				[ hold, [hoots, 10, "frm"] ],
				//88
				[ create_textbox, ["get a new partner", hoots, false] ],
				
				function(){ 
					if (!instance_exists(Otextbox))
					{
						set_song_ingame("Indoor Theme.ogg"); 
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
				
				Ograndclock.ring = false;
				
				global.playerIdle = Splayer_idle;
				global.playerWalk = Splayer_walk;
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
