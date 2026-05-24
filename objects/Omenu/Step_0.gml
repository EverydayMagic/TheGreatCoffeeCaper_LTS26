keyPause = InputPressed(INPUT_VERB.PAUSE);
keyUp = InputPressed(INPUT_VERB.UP);
keyDown = InputPressed(INPUT_VERB.DOWN);
keyLeft = InputPressed(INPUT_VERB.LEFT);
keyRight = InputPressed(INPUT_VERB.RIGHT);
keySelect = InputPressed(INPUT_VERB.SELECT);
keyBack = InputPressed(INPUT_VERB.BACK);

depth = -room_height - 100; //always above stuff except text boxes
//show_debug_message("menu depth: " + string(depth));

//show_debug_message("ARRAY: " + string(settingsmenu_objimgspd));
//start 'er up!
if (keyPause && room != Rdebug_menu && room != Rtitle && room != Rgame_start && room != Rsubtitle && room != Rdemo_credits && Oloveletter_letter.visible = false && !global.cutsceneActive && !Ocluehunt.trans_to_battle && !instance_exists(Otextbox) && room != Rbattle && !Ocluehunt.cluehunt_active && instance_exists(Oplayer) && (Oplayer.state = PlayerStateFree || global.gamePaused) && !instance_exists(Oitem_reveal) && !instance_exists(Ofade))
{
	global.gamePaused =! global.gamePaused;
	visible =! visible;
	
	//sound effects
	if (global.gamePaused)
	{
		play_sfx(snd_openingmenu);	
	} else {
		play_sfx(snd_back);	
	}
	
	menu_xscale = 0;
	menu_yscale = 0;
	
	sided = true;
	downtrack = 0;
	curs_x_track = 1;
	curs_y_track = 0;
	
	itembox_row_y[0] = y - 29;
	itembox_row_y[1] = y - 2;
	itembox_row_y[2] = y + 25;
	itembox_row_y[3] = y + 52;
	keeprowy = itembox_row_y[0];

	itembox_row_y_moving_d = false;
	itembox_row_y_moving_u = false;

	active_box = 0;
	
	
	setting_row_y[0] = y - 31;
	setting_row_y[1] = y - 12;
	setting_row_y[2] = y + 7;
	setting_row_y[3] = y + 26;

	setting_row_y_moving_d = false;
	setting_row_y_moving_u = false;

	setting_index = 0;
	setting_state = 0;
	volarrow_frm = 0;
	
	save_check = false;
	
	if (doonce){ vol_knob_x += global.settings.volume * vol_range; doonce = false;}
	
	//update fullscreen knob
	if (global.settings.fullscreen = true){ flsrc_xmod = 8; } else { flsrc_xmod = 0; }
	
	//update font setting text
	if (global.settings.font = global.font_classic)
	{
		font_text = "CLASSIC";
	} else {
		font_text = "CLEAN";
	}
	
	//update atk style text
	if (!global.settings.battle_control_hold)
	{
		atkstyle_text = "MASH";	
	} else {
		atkstyle_text = "HOLD";	
	}
		
}
if (visible)
{
	
	if (menu_xscale < 1)
	{
		menu_xscale += 0.1;
		menu_yscale += 0.1;
	} else {
		menu_xscale = 1;
		menu_yscale = 1;
	}
}

if (keyBack && global.gamePaused && menu_xscale = 1 && menu_yscale = 1 && sided)
{
	//sound effects
	play_sfx(snd_back);	
	
	global.gamePaused = false;
	visible = false;
}

//controlling cursor & scrolling
if (menu_xscale = 1)
{
	if (!sided)
	{
		var _spd = 3;
		
		switch (downtrack)
		{
			#region Clue Item Menu
				case 0:
					//item menu
					if (Oloveletter_letter.visible = false && !instance_exists(Otextbox))
					{
						//sound effects
						if (keyDown && active_box < 6)
						{
							play_sfx(snd_nav);
						}
				
						if (curs_y_track >= 0 && curs_y_track < 1)
						{

							//scrolling down
							if ((keyDown || itembox_row_y_moving_d = true) && itembox_row_y_moving_u = false && active_box < 4)
							{
						
								itembox_row_y_moving_d = true;
								for (var i = 0; i < array_length(itembox_row_y); i++)
								{
									if (keeprowy - 27 < itembox_row_y[0])
									{
										itembox_row_y[i] -= _spd;
									} else {
										keeprowy = itembox_row_y[0];
										itembox_row_y_moving_d = false;
										wait_a_frame = 1;
										active_box += 2;
										itembox_row_y[1] -= _spd;
									}
								}
					
							}
						}
			
						if ((curs_y_track > 0 || itembox_row_y[0] < y - 29) && curs_y_track <= 1)
						{
							//sound effects
							if (keyUp && active_box > 1)
							{
								play_sfx(snd_nav);	
							}
					
							//scrolling up
							if ((keyUp || itembox_row_y_moving_u = true) && itembox_row_y_moving_d = false && (active_box > 1 && active_box < 6))
							{
								itembox_row_y_moving_u = true;	
								for (var q = 0; q < array_length(itembox_row_y); q++)
								{
									if (keeprowy + 27 > itembox_row_y[0])
									{
										itembox_row_y[q] += _spd;
									} else {
										keeprowy = itembox_row_y[0];
										itembox_row_y_moving_u = false;
										wait_a_frame = 1;
										active_box -= 2;
										itembox_row_y[1] += _spd;
									}
						
								}
							}
						}
					}
				break;
			#endregion	
			
			#region Stash Item Menu
				case 1:
					if (Oloveletter_letter.visible = false && !instance_exists(Otextbox))
					{
						//sound effects
						if (keyDown && stash_active_box < 6)
						{
							play_sfx(snd_nav);
						}
				
						if (curs_y_track >= 0 && curs_y_track < 1)
						{

							//scrolling down
							if ((keyDown || stash_itembox_row_y_moving_d = true) && stash_itembox_row_y_moving_u = false && stash_active_box < (max_stash_item_boxes - 4))
							{
						
								stash_itembox_row_y_moving_d = true;
								for (var i = 0; i < array_length(stash_itembox_row_y); i++)
								{
									if (stash_keeprowy - 27 < stash_itembox_row_y[0])
									{
										stash_itembox_row_y[i] -= _spd;
									} else {
										stash_keeprowy = stash_itembox_row_y[0];
										stash_itembox_row_y_moving_d = false;
										wait_a_frame = 1;
										stash_active_box += 2;
										stash_itembox_row_y[1] -= _spd;
									}
								}
					
							}
						}
			
						if ((curs_y_track > 0 || stash_itembox_row_y[0] < y - 29) && curs_y_track <= 1)
						{
							//sound effects
							if (keyUp && active_box > 1)
							{
								play_sfx(snd_nav);	
							}
					
							//scrolling up
							if ((keyUp || stash_itembox_row_y_moving_u = true) && stash_itembox_row_y_moving_d = false && (stash_active_box > 1 && stash_active_box < (max_stash_item_boxes - 2)))
							{
								stash_itembox_row_y_moving_u = true;	
								for (var q = 0; q < array_length(stash_itembox_row_y); q++)
								{
									if (stash_keeprowy + 27 > stash_itembox_row_y[0])
									{
										stash_itembox_row_y[q] += _spd;
									} else {
										stash_keeprowy = stash_itembox_row_y[0];
										stash_itembox_row_y_moving_u = false;
										wait_a_frame = 1;
										stash_active_box -= 2;
										stash_itembox_row_y[1] += _spd;
									}
						
								}
							}
						}
					}
				break;
			#endregion	
			
			#region Settings Menu
				case 2:
					//settings menu
					if (curs_y_track >= 0 && curs_y_track < 3)
					{
						//sound effects
						if (keyDown && setting_index < 3)
						{
							play_sfx(snd_nav);	
						}
						
						//scrolling down
						if ((keyDown || setting_row_y_moving_d = true) && setting_row_y_moving_u = false && setting_state != 1 && setting_index < 3)
						{
							setting_row_y_moving_d = true;
							for (var i = 0; i < array_length(setting_row_y); i++)
							{
								var _gap = 30;
								if (setting_index = 2){ _gap = 36; }
								
								if (setting_keeprowy - _gap < setting_row_y[0])
								{
									setting_row_y[i] -= _spd;
								} else {
									if (setting_index = 2 && (setting_keeprowy - _gap <= setting_row_y[0]))
									{
										setting_row_y[i] -= 2;
									} else {
										setting_keeprowy = setting_row_y[0];
										setting_row_y_moving_d = false;
										wait_a_frame = 1;
										setting_index++;
										setting_row_y[1] -= _spd;
									}
								}
							}
					
						}
					}
			
					if ((curs_y_track > 0 || setting_row_y[0] < y - 31) && curs_y_track <= 3)
					{
						//sound effects
						if (keyUp && setting_index > 0)
						{
							play_sfx(snd_nav);	
						}
						
						//scrolling up
						if ((keyUp || setting_row_y_moving_u = true) && setting_row_y_moving_d = false && setting_index > 0)
						{
							setting_row_y_moving_u = true;	
							for (var q = 0; q < array_length(itembox_row_y); q++)
							{
								var _gap = 30;
								if (setting_index = 3){ _gap = 36; }
								
								if (setting_keeprowy + _gap > setting_row_y[0])
								{
									setting_row_y[q] += _spd;
								} else {
									if (setting_index = 3 && (setting_keeprowy + _gap >= setting_row_y[0]))
									{
										setting_row_y[q] += 2;
									} else {
										setting_keeprowy = setting_row_y[0];
										setting_row_y_moving_u = false;
										wait_a_frame = 1;
										setting_index--;
										setting_row_y[1] += _spd;
									}
								}
						
							}
						}
					}
					show_debug_message("keeprow: " + string(setting_keeprowy) + " settingrowy0: " + string(setting_row_y[0]));
					//show_debug_message("keeprow: " + string(setting_keeprowy) + " itemrowy0: " + string(setting_row_y[1])); 
					//show_debug_message("keeprow: " + string(setting_keeprowy) + " itemrowy0: " + string(setting_row_y[2])); 
				break;
			#endregion
		}
		
	}
}	
//show_debug_message("VOL X: " + string(vol_knob_x));

//functionality
if (menu_xscale = 1)
{
	if (window_get_fullscreen() = true){ flsrc_xmod = 8; } else { flsrc_xmod = 0; }
	
	if (sided = false)
	{
		switch (downtrack)
		{
			#region Clue Item Menu
				case 0:
					//item menu
					if (Oloveletter_letter.visible = false)
					{
						//show item desc
						if (!instance_exists(Otextbox))
						{
							if (keySelect && !sided && !itembox_row_y_moving_u && !itembox_row_y_moving_d)
							{
								if (Oitem_manager.inv[active_box].name != "Unknown")
								{
									//sound effects
									play_sfx(snd_select);
							
									if (Oitem_manager.equipped != -1)
									{
										if (Oitem_manager.equipped.display_name != Oitem_manager.inv[active_box].display_name)
											create_textbox(Oitem_manager.inv[active_box].display_name, true);
										else
											create_textbox("currentlyequipped", true);
									} else {
										create_textbox(Oitem_manager.inv[active_box].display_name, true);
									}
								}
							}
						}	
					}
				break;
			#endregion
			
			#region Stash Item Menu
				case 1:
					//item menu
					if (Oloveletter_letter.visible = false)
					{
						//show item desc
						if (!instance_exists(Otextbox))
						{
							if (keySelect && !sided && !stash_itembox_row_y_moving_u && !stash_itembox_row_y_moving_d)
							{
								if (Oitem_manager.inv_stash[active_box].name != "Unknown")
								{
									//sound effects
									play_sfx(snd_select);
							
									if (Oitem_manager.equipped != -1)
									{
										if (Oitem_manager.equipped.display_name != Oitem_manager.inv_stash[stash_active_box].display_name)
											create_textbox(Oitem_manager.inv_stash[stash_active_box].display_name, true);
										else
											create_textbox("currentlyequipped", true);
									} else {
										create_textbox(Oitem_manager.inv_stash[stash_active_box].display_name, true);
									}
								}
							}
						}	
					}
				break;
			#endregion
			
			#region Settings Menu
				case 2:
					//settings menu
					if (!setting_row_y_moving_d && !setting_row_y_moving_u)
					{
						switch (setting_index)
						{
							#region Volume
								case 0:
									//Volume
									if (setting_index = 0)
									{
										if (keySelect)
										{
											if (setting_state != 1)
											{
												//sound effects
												play_sfx(snd_select);
									
												setting_state = 1;
											}
										}
										if (keyBack)
										{
											if (setting_state = 0)
											{
												//sound effects
												play_sfx(snd_back);
									
												sided = true;
												save_settings();
											}
								
											if (setting_state = 1)
											{
												//sound effects
												play_sfx(snd_back);
									
												setting_state = 0;
												save_settings();
											}					
										}
										if (setting_state = 1)
										{
											if (keyboard_check(vk_right) && vol_knob_x < (sprite_get_width(Svolume_meter) - 2))
											{
												//sound effects
												play_sfx(snd_nav, 1, 2);
									
												global.settings.volume += 1/vol_range;
												vol_knob_x++;
											} else if (vol_knob_x >= (sprite_get_width(Svolume_meter) - 2)) {
												global.settings.volume = 1;	
											}
											if (keyboard_check(vk_left) && vol_knob_x >= ((x + 64 - (sprite_get_width(Spausemenu)/2) + 3) - 33))
											{	
												//sound effects
												play_sfx(snd_nav, 1, 2);
									
												global.settings.volume -= 1/vol_range;
												vol_knob_x--;
											} else if (vol_knob_x < ((x + 64 - (sprite_get_width(Spausemenu)/2) + 3) - 33)) {
												global.settings.volume = 0;	
											}
											volarrow_frm += 5/FRAME_RATE;
										}
									} else volarrow_frm = 0;
								break;
							#endregion
						
							#region Fullscreen
								case 1:
									//Fullscreen
									if (setting_index = 1)
									{
										if (keySelect)
										{
											//sound effects
											play_sfx(snd_select);
								
											global.settings.fullscreen =! global.settings.fullscreen;
											reset_window();
											
											save_settings();
										}
										
										if (keyBack)
										{
											//sound effects
											play_sfx(snd_back);
								
											sided = true;
										}
									}
								break;
							#endregion
							
							#region Font
								case 2:
									font_col = orange_col;
									if (keyboard_check_pressed(ord("Z")))
									{
										//sound effects
										play_sfx(snd_select);
										
										if (global.settings.font = global.font_classic)
										{
											global.settings.font = global.font_ffl;	
											font_text = "CLEAN";
										} else {
											global.settings.font = global.font_classic;	
											font_text = "CLASSIC";
										}
										
										save_settings();
									}
									
									if (keyBack)
									{
										//sound effects
										play_sfx(snd_back);
								
										sided = true;
									}
								break;
							#endregion
							
							#region Attack Style
								case 3:
									atkstyle_col = orange_col;
									if (keyboard_check_pressed(ord("Z")))
									{
										//sound effects
										play_sfx(snd_select);
										
										if (!global.settings.battle_control_hold)
										{
											global.settings.battle_control_hold = true;
											atkstyle_text = "HOLD";	
										} else {
											global.settings.battle_control_hold = false;
											atkstyle_text = "MASH";	
										}
										
										save_settings();
									}
									
									if (keyBack)
									{
										//sound effects
										play_sfx(snd_back);
								
										sided = true;
									}
								break;
							#endregion
						}
					}
				break;
			#endregion
			
			#region Save & Quit Menu
				case 3:
					//save & quit menu
					if (keySelect && visible = true)
					{
						//sound effects
						play_sfx(snd_select);	
					}
				
					if ((keySelect && visible = true) || save_check = true)
					{
						switch (curs_y_track)
						{
							#region Save
								case 0:
									if (!save_check)
									{
										save_game();
										save_check = true;
									}
								break;
							#endregion
							
							#region Title
								case 1:
									visible = false;
									
									save_check = true;
									
									with (Oplayer)
									{
										if (global.playerIdle = Splayer_idle && sprite_index != Splayer_nocapsit_sleep)
										{
											Ogame.player_spr_inuse = sprite_index;
											Ogame.player_imgindex_inuse = image_index;
											sprite_index = Splayer_nocapsit_sleep;
											image_index = 0;
											image_speed = 1;
										} else {
											if (global.playerIdle = Splayer_capidle && sprite_index != Splayer_capsit_sleep)
											{
												Ogame.player_spr_inuse = sprite_index;
												Ogame.player_imgindex_inuse = image_index;
												sprite_index = Splayer_capsit_sleep;
												image_index = 0;
												image_speed = 1;
											}	
										}
							
									}
									if (wait_a_frame_tres <= 0)
									{
										with(instance_create_depth(0, 0, -bbox_bottom, Ofade))
										{
											trans_type = "iris";
											newRoom = Rtitle;
										}	
										save_check = false;
										wait_a_frame_tres = 30;
									} else wait_a_frame_tres--;
								break;
							#endregion
						}
					}
				break;
			#endregion
		}	
	}
}

//show_debug_message("itembox_row_y: " + string(itembox_row_y));
//show_debug_message("keeprowy: " + string(keeprowy));
//show_debug_message("itembox_moving_d: " + string(itembox_row_y_moving_d));
//show_debug_message("itembox_moving_u: " + string(itembox_row_y_moving_u));
show_debug_message("ACTIVE BOX: " + string(stash_active_box));
//show_debug_message("itembox_index: " + string(itembox_index));
//show_debug_message("curs_x_track: " + string(curs_x_track));
//show_debug_message("curs_y_track: " + string(curs_y_track));