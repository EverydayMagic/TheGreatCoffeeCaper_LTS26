if (instance_exists(Oplayer))
{
	depth = Oplayer.depth;
	player_x = Oplayer.x;
	player_y = Oplayer.y;
}

if (Oitem_manager.inv[1].display_name = "Spark Glass" && room != Rbattle && !beating && instance_exists(Oplayer))
{
	if (keyboard_check_pressed(ord("C")) && !instance_exists(Otextbox) && !global.cutsceneActive && !trans_to_battle && Omenu.visible = false && !global.transitioning && Oplayer.state = PlayerStateFree && !instance_exists(Ofade) && activate_cluehunt)	
	{
		if (!place_meeting(Oplayer.x, Oplayer.y, Ocol))
			cluehunt_active =! cluehunt_active;
			
		if (!cluehunt_active)
		{
			//go back to old music
			set_song_ingame(Oaudio_manager.oldSongAssetString_justsong, 0, 0, 0, true, noone, false, false, false, true);	
		}
		
	}
	
	//give hootsworth his sprites back
	if (!cluehunt_active)
	{	
		
		if (Oitem_manager.inv[0].name = "Hoots Hat")
		{
			global.playerIdle = Splayer_capidle;
			global.playerWalk = Splayer_capwalk;
		} else {
			global.playerIdle = Splayer_idle;
			global.playerWalk = Splayer_walk;
		}
	}
	
}

#region Pull Out/Put Away MGlass

//show_debug_message("SPR INDEX: " + string(spr_index));

if (cluehunt_active)
{
	Odirector.no_cut_mustwait = true;
	
	//Normal pull out
	if (!firsttimemenonosnotmyfirsttime)
	{
		//fade out all characters to allow the player room to walk (if needed)
		//if (array_length(global.char_in_room) > 0)
		//{
		//	for (var i = 0; i < array_length(global.char_in_room); i++)
		//	{
		//		with (global.char_in_room[i])
		//		{
		//			if (image_alpha > 0)
		//				image_alpha -= 0.1;	
		//		}
				
		//		with (Oleaf)
		//		{
		//			if (image_alpha > 0)
		//				image_alpha -= 0.1;	
		//		}
		//	}
		//}
		
		//change hootsworth sprites
		if (global.playerIdle != Splayer_mglass_idle && global.playerIdle != Splayer_nocap_mglass_idle && !trans_to_battle)
		{
			beating = true;
			switch (beat)
			{
				case 0:
					//sound effects
					play_sfx(snd_pullingoutmglass);
					
					//change music
						var _inside = false;
						for (var r = 0; r < array_length(global.house_rooms); r++)
						{
							if (room = global.house_rooms[r])
							{
								_inside = true;
								break;
							}
						}
						if (!_inside)
						{
							for (var r = 0; r < array_length(global.special_house_rooms); r++)
							{
								if (room = global.special_house_rooms[r])
								{
									_inside = true;
									break;
								}
							}	
						}
						if (_inside)
						{
							set_song_ingame("Hunting Clues (Indoors).ogg", 0, 0, 0, true, noone, false, false, true);
						} else {
							set_song_ingame("Hunting Clues (Overworld).ogg", 0, 0, 0, true, noone, false, false, true);
						}	
					
					spr_index = floor(Oplayer.image_index) mod 4;
					spr_index_base = spr_index;
					beat++;
				break;
				case 1:
					if (spr_index < spr_index_base + 1)
					{
						spr_index += 15/FRAME_RATE;
					} else {
						if (spr_index > (sprite_get_number(Splayer_capspin)))
							spr_index = 0;
						
						beat++
					}
				break;
				case 2:
				var _spr_base = spr_index_base - 1;
				if (_spr_base < 0){ _spr_base = sprite_get_number(Splayer_capspin); }
					if (spr_index != _spr_base)
					{
						if (spr_index > (sprite_get_number(Splayer_capspin)))
							spr_index = 0;
						else
							spr_index += 15/FRAME_RATE;
					} else beat++;
				break;
				case 3:
					instance_activate_object(Oplayer);
					if (global.playerIdle = Splayer_capidle)
					{
						global.playerIdle = Splayer_mglass_idle;
						global.playerWalk = Splayer_mglass_walk;
					} else {
						global.playerIdle = Splayer_nocap_mglass_idle;
						global.playerWalk = Splayer_nocap_mglass_walk;
					}
					Oplayer.image_index = spr_index;
					Oplayer.direction = 90 * spr_index_base;
					Oplayer.visible = true;
					beat = 0;
					spr_index = 0;
					spr_index_base = 0;
					beating = false;
				break;
			}
		}
	}
	
	//if this is the first time we pull out mglass, play this sequence (not GM sequence)
	if (firsttimemenonosnotmyfirsttime = true && !trans_to_battle)
	{
		if (!beating)
		{
			//sound effects
			play_sfx(snd_pullingoutmglass);	
		}
		
		beating = true;
		switch (beat)
		{
			case 0:
				if (spr_index < sprite_get_number(Splayer_caphoist) - 1)
				{
					spr_index += 10/FRAME_RATE;
				} else {
					beat++;
				}
			break;
			case 1:
				if (mglass_y_mod <= -30)
				{
					beat_time_length = 1;
					if (!time_source_exists(beat_time))
					{
						beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
							beat++;
							time_source_destroy(beat_time);
						});
					}

					if (time_source_get_state(beat_time) != time_source_state_active)
							time_source_reset(beat_time);
					time_source_start(beat_time);	
				}
			break;
			case 2:
				if (mglass_y_mod >= 0)
					beat++;
			break;
			case 3:
				if (round(spr_index) mod 3 = 1)
					beat++;
			break;
			case 4:
				beat_time_length = 0.25;
				if (!time_source_exists(beat_time))
				{
					beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
						beat++;
						time_source_destroy(beat_time);
					});
				}

				if (time_source_get_state(beat_time) != time_source_state_active)
						time_source_reset(beat_time);
				time_source_start(beat_time);	
			break;
			case 5:
				beat_time_length = 0.5;
				if (!time_source_exists(beat_time))
				{
					beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
						beat++;
						time_source_destroy(beat_time);
					});
				}

				if (time_source_get_state(beat_time) != time_source_state_active)
						time_source_reset(beat_time);
				time_source_start(beat_time);	
			break;
			case 6:
			
				if (array_length(global.char_in_room) > 0)
				{
					//for (var i = 0; i < array_length(global.char_in_room); i++)
					//{
					//	with (global.char_in_room[i])
					//	{
					//		if (image_alpha > 0)
					//			image_alpha -= 0.1;
					//	}
					//}
				
					//if (global.char_in_room[0].image_alpha <= 0)
						beat++;
						
				} else { 
					beat++;
				}
			break;
			
			case 7:
				instance_activate_object(Oplayer);
				
					//change music
						var _inside = false;
						for (var r = 0; r < array_length(global.house_rooms); r++)
						{
							if (room = global.house_rooms[r])
							{
								_inside = true;
								break;
							}
						}
						if (!_inside)
						{
							for (var r = 0; r < array_length(global.special_house_rooms); r++)
							{
								if (room = global.special_house_rooms[r])
								{
									_inside = true;
									break;
								}
							}	
						}
						if (_inside)
						{
							set_song_ingame("Hunting Clues (Indoors).ogg", 0, 0, 0, true, noone, false, false, true);
						} else {
							set_song_ingame("Hunting Clues (Overworld).ogg", 0, 0, 0, true, noone, false, false, true);
						}
				
				if (global.playerIdle = Splayer_capidle)
				{
					global.playerIdle = Splayer_mglass_idle;
					global.playerWalk = Splayer_mglass_walk;
				} else {
					global.playerIdle = Splayer_nocap_mglass_idle;
					global.playerWalk = Splayer_nocap_mglass_walk;
				}
				Oplayer.direction = 0;
				Oplayer.x = player_x;
				Oplayer.y = player_y;
				if (wait_a_frame <= 0)
				{
					Oplayer.visible = true;
					beat = 0;
					spr_index = 0;
					beating = false;
					firsttimemenonosnotmyfirsttime = false;
				} else wait_a_frame--;
			break;
		}
	}
	
} else {
	//fade in the characters we faded out
	//if (array_length(global.char_in_room) > 0)
	//{
	//	for (var q = 0; q < array_length(global.char_in_room); q++)
	//	{
	//		with (global.char_in_room[q])
	//		{
	//			if (image_alpha < 1)
	//				image_alpha += 0.1;	
	//		}
	//	}
		
	//}
	
}
//show_debug_message("justsong: " + string(Oaudio_manager.oldSongAssetString_justsong));

#endregion

#region Transition to Battle


//show_debug_message("BEATBEATBEATBEAST: " + string(beat));

if (trans_to_battle)
{
	var _countdown_wait = 0.10;
	
	//what index of mglass to use
	if (mglass_index = -1)
	{
		for (var i = 0; i < array_length(global.insiderooms); i++)
		{
			if (room != global.insiderooms[i])
			{
				mglass_index = 1;
			} else {
				mglass_index = 2;
				break;
			}
		}
	}
	beating = true;
	
	var _cluetimer = Ocluebattle_timer;
	switch (beat)
	{
		case 0:
			if (instance_exists(Oplayer)){ depth = Oplayer.depth - 1; }
		
			if (!global.battle_lock)
			{
				//sound effects
				play_sfx(snd_exclamationpoint);	
				
				//play beginning beat
				if (!audio_is_playing(snd_battletimercountdown))
				{
					set_song_ingame(noone);
					
					var _bossbattle = [
						global.item_list.hammer,
					]
					var _bossbattle_active = false;
					for (var i = 0; i < array_length(_bossbattle); i++)
					{
						if (type_to_transfer = _bossbattle[i])
							_bossbattle_active = true;
					}
					
					if (!_bossbattle_active)
						play_sfx(snd_battletimercountdown, 1, 1, true);	
				}
			}
			
			global.battle_lock = true;
			beat_time_length = 1.25;
			if (!time_source_exists(beat_time))
			{
				beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
					if (!mglasstrans_sfx){ play_sfx(snd_mglass_trans); mglasstrans_sfx = true;}
					beat++;
					time_source_destroy(beat_time);
				});
			}

			if (time_source_get_state(beat_time) != time_source_state_active)
					time_source_reset(beat_time);
			time_source_start(beat_time);	
		break;
		
		case 1:
			depth = -bbox_bottom - 500;
			if (mglass_xscale < 6)
			{
				mglass_xscale += 0.5;
				mglass_yscale += 0.5;
				mglass_rot += (360/22);
				
			} else beat++;
		break;
		
		case 2:
			//clue battle manager stuff
				Ocluebattle_manager.create_battle_insts = true;
			if (mglass_xscale > 2)
			{
				mglass_xscale -= 0.5;
				mglass_yscale -= 0.5;
				mglass_rot += (360/22);
				
			} else beat++;
		break;
		
		case 3:
			depth = Omglass.depth + 1;
			Omglass.visible = true;
			beat++;
		break;
		
		case 4:
			if (type_to_transfer = global.item_list.hammer)
			{
				bigsparkboss_intro = true;
				beat = 18;
			} else {
				beat++;
			}
		break;
		
		case 5:
			Ocluebattle_timer.depth = Omglass.depth - 1;
			beat++;
		break;
		
		case 6:
			if (!path_exists(timer_path))
			{
				timer_path = path_add();
				path_set_closed(timer_path, false);
				path_add_point(timer_path, _cluetimer.x, _cluetimer.y, 100);
				path_add_point(timer_path, room_width/2, room_height/2, 100);
				with (_cluetimer)
					path_start(Ocluehunt.timer_path, 10, path_action_stop, true);
			}
			
			if (_cluetimer.path_position = 1)
			{
				path_delete(timer_path);
				_cluetimer.image_xscale = 4;
				_cluetimer.image_yscale = 4;
				beat++;
			} else {
				_cluetimer.image_xscale += 2/(path_get_length(timer_path)/_cluetimer.path_speed);
				_cluetimer.image_yscale += 2/(path_get_length(timer_path)/_cluetimer.path_speed);
			}
		break;
		
		case 7:
			if (abs(_cluetimer.handle_rot) < 359)
			{
				_cluetimer.handle_rot -= 360/10;	
			} else {
				_cluetimer.handle_rot = -360;
				
				if (global.battleTutorial[1] = true){ create_textbox("donthaveallday_battletutorial", true); }
				
				timer_scale = _cluetimer.image_xscale;
				
				if (global.battleTutorial[1] = false && !instance_exists(Otextbox))
				{
					global.battle_lock = true;
				
					#region time source
				
					beat_time_length = 0.3;
					if (!time_source_exists(beat_time))
					{
						beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
							beat++;
							time_source_destroy(beat_time);
						});
					}

					if (time_source_get_state(beat_time) != time_source_state_active)
							time_source_reset(beat_time);
					time_source_start(beat_time);	
				
					#endregion
				
				}
				
			}
		break;
		
		case 8:
			//increase handle rot in thirds
			if (abs(_cluetimer.handle_rot) > ((359/3) * 2))
			{
				_cluetimer.handle_rot += (360/3)/(10);	

			} else {
				if (countdown_texted = 0)
				{
					with (instance_create_depth(0, 0, -bbox_bottom, Ocluebattle_countdown))
					{
						text = "3";
					}
					countdown_texted++;
				}
				
				//pump it
				if (_cluetimer.image_xscale < 5)
				{
					_cluetimer.image_xscale += 1/3;
					_cluetimer.image_yscale += 1/3;	
				} else { 
					beat++; 
					with (_cluetimer)
					{
						shake = true;
						oldx = x;
						oldy = y;
					}
				}
				
			}
		break;
		
		case 9:
			if (_cluetimer.image_xscale > timer_scale)
			{
				_cluetimer.image_xscale -= 1/8;	
				_cluetimer.image_yscale -= 1/8;
			} else {
				_cluetimer.image_xscale = 4;
				_cluetimer.image_yscale = 4;
				beat++;
			}
		break;
		
		case 10:
			
			#region time source
			
			if (!time_source_exists(beat_time))
			{
				beat_time_length = _countdown_wait;
				beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
					beat++;
					time_source_destroy(beat_time);
				});
							
				if (time_source_get_state(beat_time) != time_source_state_active)
						time_source_reset(beat_time);
				time_source_start(beat_time);
				
			}
			
			#endregion
		break;
		
		case 11:
			//increase handle rot in thirds
			if (abs(_cluetimer.handle_rot) > (359/3))
			{
				_cluetimer.handle_rot += (360/3)/(10);
				
			} else {	
				if (countdown_texted = 1)
				{
					with (instance_create_depth(0, 0, -bbox_bottom, Ocluebattle_countdown))
					{
						text = "2";
					}
					countdown_texted++;
				}
				
				//pump it
				if (_cluetimer.image_xscale < 5)
				{
					_cluetimer.image_xscale += 1/3;
					_cluetimer.image_yscale += 1/3;	
				} else { 
					beat++; 
					with (_cluetimer)
					{
						shake = true;
						oldx = x;
						oldy = y;
					}
				}

			}
		break;
		
		case 12:
			if (_cluetimer.image_xscale > timer_scale)
			{
				_cluetimer.image_xscale -= 1/8;	
				_cluetimer.image_yscale -= 1/8;
			} else {
				_cluetimer.image_xscale = 4;
				_cluetimer.image_yscale = 4;
				beat++;
			}
		break;
		
		case 13:
			#region time source
				
			if (!time_source_exists(beat_time))
			{
				beat_time_length = _countdown_wait;
				beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
					beat++;
					time_source_destroy(beat_time);
				});
							
				if (time_source_get_state(beat_time) != time_source_state_active)
						time_source_reset(beat_time);
				time_source_start(beat_time);
				
			}
				
			#endregion
		break;
		
		case 14:
			//increase handle rot in thirds
			if (abs(_cluetimer.handle_rot) > 1)
			{
				_cluetimer.handle_rot += (360/3)/(10);	
				
			} else {
				if (countdown_texted = 2)
				{
					with (instance_create_depth(0, 0, -bbox_bottom, Ocluebattle_countdown))
					{
						text = "1";
					}
					countdown_texted++;
				}
				
				//pump it
				if (_cluetimer.image_xscale < 5)
				{
					_cluetimer.image_xscale += 1/3;
					_cluetimer.image_yscale += 1/3;	
				} else { 
					beat++; 
					with (_cluetimer)
					{
						shake = true;
						oldx = x;
						oldy = y;
					}
				}
				
			}
		break;
		
		case 15:
			if (_cluetimer.image_xscale > timer_scale)
			{
				_cluetimer.image_xscale -= 1/8;	
				_cluetimer.image_yscale -= 1/8;
			} else { 
				_cluetimer.image_xscale = 4;
				_cluetimer.image_yscale = 4;
				beat++; 
			}
		break;
		
		case 16:
			#region time source
			if (!time_source_exists(beat_time))
			{
				beat_time_length = 0.05;
				beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
					beat++;
					time_source_destroy(beat_time);
				});
							
				if (time_source_get_state(beat_time) != time_source_state_active)
						time_source_reset(beat_time);
				time_source_start(beat_time);
				
			}
				
			#endregion
		break;
		
		case 17:
			if (!path_exists(timer_path))
			{
				timer_path = path_add();
				path_set_closed(timer_path, false);
				path_add_point(timer_path, _cluetimer.x, _cluetimer.y, 100);
				path_add_point(timer_path, 32, 264, 100);
				with (_cluetimer)
					path_start(Ocluehunt.timer_path, 30, path_action_stop, true);
			}
			if (_cluetimer.path_position = 1)
			{
				_cluetimer.image_xscale = 2;
				_cluetimer.image_yscale = 2;
				beat++;
				path_delete(timer_path);
			} else {
				if (_cluetimer.image_xscale > 1)
				{
					_cluetimer.image_xscale -= 2/(path_get_length(timer_path)/_cluetimer.path_speed);
					_cluetimer.image_yscale -= 2/(path_get_length(timer_path)/_cluetimer.path_speed);
				}
			}
		break;
		
		case 18:
			if (type_to_transfer != global.item_list.hammer)
			{
				with (instance_create_depth(0, 0, -bbox_bottom, Ocluebattle_countdown))
				{
					text = "GO!";
				}
			}
			global.battle_lock = false;
			depth = Omenu.depth + 1;
			
			_cluetimer.oldx = 48;
			_cluetimer.oldy = 264;
			
			countdown_texted = 0;
			
			//cluehunt stuff
				trans_to_battle = false;
				cluehunt_active = false;
			//mglass stuff
				mglass_xscale = 0;
				mglass_yscale = 0;
				mglass_rot = 0;
			//beat stuff
				beating = false;
				beat = 0;
			Ocluebattle_timer.alarm[0] = 1;
			Ocluebattle_timer.depth = Ocluebattle_timer.old_depth;
		break;

	}
}

#endregion

#region Get Out of Battle

//get out of battle
if (global.battle_lock)
{
	switch (global.battle_result)
	{
		#region We won hooray! (case 1)
		
		case 1:
			if (instance_exists(Ocluebattle_cluereward))
			{
				if (Ocluebattle_cluereward.beat > 4)
				{
					if (!instance_exists(Ofade))
					{
						item_add(type_to_transfer, false, true);
						with (instance_create_depth(0, 0, 0, Ofade))
						{
							trans_type = "iris";
							newRoom = Ocluehunt.old_room;
							newX = Ocluehunt.old_x;
							newY = Ocluehunt.old_y;
						}
					}
				}
			} else {
				if (!instance_exists(Ofade))
				{
					global.battle_lock = false;
					global.battle_result = -1;
					global.enemies = [];
					global.obstacles = [];
					global.coolspots = [];
					global.runawayspots = [];
					global.decoration = [];
					global.battleActive = false;
					mglasstrans_sfx = false;
					beat = 0;
					beat_time_length = 1;
					beat_time = -1;
					beating = false;
					mglass_index = -1;
					
					//give hootsworth his sprites back
					if (global.playerIdle = Splayer_mglass_idle)
					{
						global.playerIdle = Splayer_capidle;
						global.playerWalk = Splayer_capwalk;
					} else {
						global.playerIdle = Splayer_idle;
						global.playerWalk = Splayer_walk;
					}
					
					with (instance_create_depth(x, y, depth, Ocluehunt_itemeffects))
					{
						item = Ocluehunt.type_to_transfer;
					}
					type_to_transfer.effect();
				}
			}
		break;
		
		#endregion
		
		#region Lost by Timer (case 0)
		
		case 0:
			if (instance_exists(Ocluebattle_timer))
			{
				if (Ocluebattle_timer.exit_battle = true)
				{
					if (!instance_exists(Ofade))
					{
						#region death stats
						
							//increase death count
							global.player_deaths++;
							//tell game what we died to
							array_push(global.player_died_to, type_to_transfer);
						
							//if death was to Big Spark Boss, skip intro next time
							if (type_to_transfer = global.item_list.hammer){ bigsparkboss_intro_skip = true; }
						
						#endregion
						
						with (instance_create_depth(0, 0, 0, Ofade))
						{
							trans_type = "iris";
							newRoom = Ocluehunt.old_room;
							newX = Ocluehunt.old_x;
							newY = Ocluehunt.old_y;
						}
					}
				}
			} else {
				if (!instance_exists(Ofade))
				{
					global.battle_lock = false;
					global.battle_result = -1;
					global.enemies = [];
					global.obstacles = [];
					global.coolspots = [];
					global.runawayspots = [];
					global.decoration = [];
					global.battleActive = false;
					mglasstrans_sfx = false;
					beat = 0;
					beat_time_length = 1;
					beat_time = -1;
					beating = false;
					mglass_index = -1;
						
					//give hootsworth his sprites back
					if (global.playerIdle = Splayer_mglass_idle)
					{
						global.playerIdle = Splayer_capidle;
						global.playerWalk = Splayer_capwalk;
					} else {
						global.playerIdle = Splayer_idle;
						global.playerWalk = Splayer_walk;
					}
				}
			}
		break;
		
		#endregion
		
		#region Lost by Health (case 2)
		
		case 2:
			if (instance_exists(Ocluebattle_healthbar))
			{
				if (Ocluebattle_healthbar.beat = 9)
				{
					if (!instance_exists(Ofade))
					{
						#region death stats
						
							//increase death count
							global.player_deaths++;
							//tell game what we died to
							array_push(global.player_died_to, type_to_transfer);
						
							//if death was to Big Spark Boss, skip intro next time
							if (type_to_transfer = global.item_list.hammer){ bigsparkboss_intro_skip = true; }
						
						#endregion
						
						with (instance_create_depth(0, 0, 0, Ofade))
						{
							trans_type = "iris";
							newRoom = Ocluehunt.old_room;
							newX = Ocluehunt.old_x;
							newY = Ocluehunt.old_y;
						}
					}
				}
			} else {
				if (!instance_exists(Ofade))
				{
					global.battle_lock = false;
					global.battle_result = -1;
					global.enemies = [];
					global.obstacles = [];
					global.coolspots = [];
					global.runawayspots = [];
					global.decoration = [];
					global.battleActive = false;
					mglasstrans_sfx = false;
					beat = 0;
					beat_time_length = 1;
					beat_time = -1;
					beating = false;
					mglass_index = -1;
						
					//give hootsworth his sprites back
					if (global.playerIdle = Splayer_mglass_idle)
					{
						global.playerIdle = Splayer_capidle;
						global.playerWalk = Splayer_capwalk;
					} else {
						global.playerIdle = Splayer_idle;
						global.playerWalk = Splayer_walk;
					}	
				}
			}
		break;
		
		#endregion
	}
}

#endregion

#region Bug Transition
	
	if (bug_trans)
	{
		switch (beat)
		{
			case 0:
				if (instance_exists(Oplayer)){ depth = Oplayer.depth - 1; }
			
				beating = true;
				//surprise "!"
				
				set_song_ingame(noone);
				//sound effects
				if (!audio_is_playing(snd_exclamationpoint))
					play_sfx(snd_exclamationpoint);	
				beat++;
			break;
			case 1:
				if (instance_exists(Oplayer)){ depth = Oplayer.depth - 1; }
				
				//beat time
				beat_time_length = 1.25;
				if (!time_source_exists(beat_time))
				{
					beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
						beat++;
						time_source_destroy(beat_time);
					});
				}

				if (time_source_get_state(beat_time) != time_source_state_active)
						time_source_reset(beat_time);
				time_source_start(beat_time);
			break;
			case 2:
				var _bugx = 0;
				var _bugy = 0;
				
				with (Ocluesteps)
				{
					if (class = "spark")
					{
						//get pos for bug
						_bugx = bug_x;
						_bugy = bug_y;
						
						//fade out spark
						if (image_alpha > 0){ image_alpha -= 1/15; }
					}
				}
				
				//create and fade in bug
				if (!instance_exists(type_to_transfer)){ instance_create_layer(_bugx, _bugy, "Instances", type_to_transfer); }
				if (instance_exists(type_to_transfer))
				{
					if (type_to_transfer.image_alpha < 1)
					{
						type_to_transfer.image_alpha += 1/30;
					} else beat++;
				}
			break;
			case 3:
				//reset variables
				type_to_transfer.start_act = true;
				bug_trans = false;
				cluehunt_active = false;
				//beat stuff
				beating = false;
				beat = 0;
			break;
		}
	}
	
#endregion

//show_debug_message("SPOTLIGHTED: " + string(spotlighted));
//show_debug_message("beat: " + string(beat));

if (instance_exists(Otextbox))
	depth = Otextbox.depth + 1;