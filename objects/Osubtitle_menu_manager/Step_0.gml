//Change the selection based on the left and right arrow keys
keyLeft = keyboard_check_pressed(vk_left);
keyRight = keyboard_check_pressed(vk_right);
keyUp = keyboard_check_pressed(vk_up);
keyDown = keyboard_check_pressed(vk_down);
keySelect = keyboard_check_pressed(ord("Z"));
keyBack = keyboard_check_pressed(ord("X"));

switch (menu)
{
	//SAVE MENU
		case 1:
			navarrow_optional[0] = false;
			navarrow_optional[1] = true;
			nav_text = "FILE SELECT";
			switch (menu_level)
			{
				//NAVIGATION
					case 0:
						mglass_x = room_width - sprite_get_width(Smglass_cursor);
						mglass_y = 10;
						
						loadcol = white_col;
						erasecol = white_col;
						
						if (keyDown && !instance_exists(Ofade))
						{
							//sound effects
							play_sfx(snd_nav);
							
							menu_level = 1;
						}
						//if (keySelect)
						//	menu = 67;
						if (keyBack && !instance_exists(Ofade))
						{
							//sound effects
							play_sfx(snd_back);
							
							with (instance_create_depth(x, y, -bbox_bottom, Ofade))
							{
								newRoom = Rtitle;
								trans_type = "iris";
							}
						}						
					break;
				//SWITCHING SAVES
					case 1:
						mglass_x = 44;
						mglass_y = 40;
						
						loadcol = white_col;
						erasecol = white_col;
						
						if (keyRight && !instance_exists(Ofade) && check_rot = rot)
						{
							//sound effects
							play_sfx(snd_nav);
							
							left = false;
							//right = true;
							selected -= 1;
						}
						if (keyLeft && !instance_exists(Ofade) && check_rot = rot)
						{
							//sound effects
							play_sfx(snd_nav);
							
							left = true;
							//right = false;
							selected += 1;
						}
						//if (keyUp)
						//{
						//	//sound effects
						//	play_sfx(snd_nav);
							
						//	menu_level = 0;
						//}
						if ((keySelect || keyDown) && check_rot = rot && !instance_exists(Ofade))
						{
							//sound effects
							play_sfx(snd_select);
							
							if (file_exists("tgcc" + string(global.saveslot) + ".edm"))
							{
								menu_level = 2;
								mglass_x = 50;
								mglass_y = 98;
							} else {
								with(instance_create_depth(0, 0, -bbox_bottom, Ofade))
								{
									trans_type = "fade";
									newRoom = Rgame_start;
								}
							}
						}
						//if (keyBack)
						//{
						//	//sound effects
						//	play_sfx(snd_back);
							
						//	menu_level = 0;
						//}
						if (keyBack && !instance_exists(Ofade))
						{
							//sound effects
							play_sfx(snd_back);
							
							with (instance_create_depth(x, y, -bbox_bottom, Ofade))
							{
								newRoom = Rtitle;
								trans_type = "iris";
							}
						}
						
						

						//Rotate towards the selection
							check_rot = rot;
							if (left)
							{
								rot -= floor(angleDifference(rot, selected * (360/instance_number(Osubtitle_menu_box)))/rot_spd);
							} else {
								rot -= ceil(angleDifference(rot, selected * (360/instance_number(Osubtitle_menu_box)))/rot_spd);
							}
				
						//Setting the global.saveslot variabe to image_index
							global.saveslot = -selected mod instance_number(Osubtitle_menu_box);
							if (global.saveslot < 0)
								global.saveslot += instance_number(Osubtitle_menu_box);
							
						//set menu positions
							var _boxes = instance_number(Osubtitle_menu_box);
							
							for (var mb = 0; mb < 3; mb++)
							{
								//i = ds_priority_delete_min(pr); 
					
								var _m = id;
					
								with (menu_box[mb])
								{
									x = round(_m.menu_x+lengthdir_x(_m.menu_width/2,(_m.rot-90)+mb*(360/_boxes)));
									y = round(_m.menu_y+lengthdir_y(_m.menu_height/2,(_m.rot-90)+mb*(360/_boxes)));
									image_xscale = round(1+lengthdir_y(_m.menu_height/2,(_m.rot-90)+mb*(360/_boxes))/(_m.menu_height*2));
									image_yscale = round(1+lengthdir_y(_m.menu_height/2,(_m.rot-90)+mb*(360/_boxes))/(_m.menu_height*2));
								}
							}
							
					break;
				//USING SAVE (if save file exists)
					case 2:
					
						if (keyBack && !instance_exists(Ofade))
						{
							//sound effects
							play_sfx(snd_back);
							
							loadcol = white_col;
							erasecol = white_col;
							menu_level = 1;
							
							save_settings();
						}
						
						//Coords for character swap:
						////mglass_x = 58;
						////mglass_y = 84;
						//Coords for Load Game:
						////mglass_x = 50;
						////mglass_y = 98;
						//Coords for Erase Game:
						////mglass_x = 58;
						////mglass_y = 84;
						
						switch (mglass_x)
						{
							//Character Swap
								case 58:
									loadcol = white_col;
									erasecol = white_col;
									
									if (keyDown && !instance_exists(Ofade))
									{
										//sound effects
										play_sfx(snd_nav);
										
										mglass_x = 50;
										mglass_y = 98;
										
										save_settings();
									}
									if (keySelect && !instance_exists(Ofade))
									{
										//sound effects
										play_sfx(snd_select);
										
										global.settings.menu_char[global.saveslot]++;
									}
									
									if (keyUp && !instance_exists(Ofade))
									{
										//sound effects
										play_sfx(snd_back);
							
										loadcol = white_col;
										erasecol = white_col;
										menu_level = 1;
							
										save_settings();		
									}
								break;
							//Load and Erase Game Options
								case 50:
									switch (mglass_y)
									{	
										//Load Game Option
											case 98:
												loadcol = orange_col;
												erasecol = white_col;
												
												if (keyDown && !instance_exists(Ofade))
												{
													//sound effects
													play_sfx(snd_nav);
													
													mglass_y = 102;
												}
												if (keyUp && !instance_exists(Ofade))
												{
													//sound effects
													play_sfx(snd_nav);
													
													mglass_x = 58;
													mglass_y = 84;
												}
												if (keyBack && !instance_exists(Ofade))
												{
													//sound effects
													play_sfx(snd_back);
													
													menu_level = 1;
												}
												if (keySelect && !instance_exists(Ofade))
												{
													with(instance_create_depth(0, 0, -bbox_bottom, Ofade))
													{
														//sound effects
														play_sfx(snd_select);
														
														trans_type = "iris";
														loading = true;
														waiting = true;
													}
												}
											break;
										//Erase Game Option
											case 102:
												loadcol = white_col;
												erasecol = orange_col;
													
												if (keyUp && !instance_exists(Ofade))
												{
													//sound effects
													play_sfx(snd_nav);
													
													mglass_y = 98;
												}
												
												if (keySelect && !instance_exists(Ofade))
												{
													//sound effects
													play_sfx(snd_select);
													
													if (file_exists("tgcc" + string(global.saveslot) + ".edm") && erase_option = false)
													{
														erase_option = true;
														yescol = orange_col;
														nocol = white_col;
														mglass_x = 35;
													}
												}
												if (keyBack && !instance_exists(Ofade))
												{
													//sound effects
													play_sfx(snd_back);
													
													menu_level = 1;
												}
											break;
									
									}
								break;
							//Erasing and Erasing Game
								case 35:
									if (keyBack && !instance_exists(Ofade))
									{
										//sound effects
										play_sfx(snd_back);
										
										erase_option = false;
										mglass_x = 50;
									}
									if (keySelect && !instance_exists(Ofade))
									{
										//sound effects
										play_sfx(snd_select);
										
										if (file_exists("tgcc" + string(global.saveslot) + ".edm") && yescol = orange_col)
										{
											file_delete("tgcc" + string(global.saveslot) + ".edm");
											//reset the cutscenes completed
											for (var h = 0; h < STORY_PACE.ENUM_LENGTH; h++)
												global.saveslot_story[global.saveslot][h] = 0;
												
											erase_option = false;
											menu_level = 1;
										} else {
											if (nocol = orange_col)
											{
												erase_option = false;
												mglass_x = 50;
											}
										}
									}
									if (keyLeft && !instance_exists(Ofade))
									{
										//sound effects
										play_sfx(snd_nav);
										
										yescol = orange_col;
										nocol = white_col;
									}
									if (keyRight && !instance_exists(Ofade))
									{
										//sound effects
										play_sfx(snd_nav);
										
										yescol = white_col;
										nocol = orange_col;
									}
									
								break;
						}
					break;
			}
		break;
	//SETTINGS MENU
		case 2:
			navarrow_optional[0] = true;
			navarrow_optional[1] = true;
			nav_text = "SETTINGS";
			switch (menu_level)
			{
				//NAVIGATION
					case 0:
						if (keyLeft && mglass_x != 0 && !instance_exists(Ofade))
						{
							mglass_x = 0;
							mglass_y = 10;
						}
						if (keyRight && mglass_x = 0 && !instance_exists(Ofade))
						{
							mglass_x = room_width - sprite_get_width(Smglass_cursor);
							mglass_y = 10;	
						}
						if (keySelect && !instance_exists(Ofade))
						{	
							//On the left arrow
								if (mglass_x = 0)
									menu = 68;
							//On the right arrow
								if (mglass_x != 0)
									menu = 69;
						}
						if (keyBack && !instance_exists(Ofade))
						{
							with (instance_create_depth(x, y, -bbox_bottom, Ofade))
							{
								newRoom = Rtitle;
								trans_type = "iris";
							}
						}	
					break;
			}
		break;
	
	
	///////////////	
	//TRANSITIONS//	
	///////////////
	
	
		//SAVE TO SETTINGS MENU
			case 67:
				navarrow_optional[0] = false;
				navarrow_optional[1] = true;
				nav_text = "";
			
				if (menu_x > -180)
					menu_x -= 15;
				else
					menu = 2;
			break;
		//SETTINGS TO SAVE MENU
			case 68:
				navarrow_optional[0] = true;
				navarrow_optional[1] = true;
				nav_text = "";
			
				if (menu_x < room_width/2)
					menu_x += 15;
				else
					menu = 1;
			break;

}

if (mglass_x = 0 && mglass_y = 10 && navarrow_optional[0] = true)
{
	navarrow_index[0] = 1;
} else {
	if (navarrow_optional[0] = true)
		navarrow_index[0] = 0;
	else
		navarrow_index[0] = 2;
}

if (mglass_x = (room_width - sprite_get_width(Smglass_cursor)) && mglass_y = 10 && navarrow_optional[1] = true)
{
	navarrow_index[1] = 1;
} else {
	if (navarrow_optional[1] = true)
		navarrow_index[1] = 0;
	else
		navarrow_index[1] = 2;
}


//show_debug_message("save: " + string(global.saveslot));