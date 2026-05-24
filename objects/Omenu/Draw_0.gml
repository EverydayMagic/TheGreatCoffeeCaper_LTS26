if (visible)
{
	draw_set_font(global.font_name);
	draw_set_color(c_white);
	
	var _menu_x = x + 64;
	var _menu_y = y + 40;
	var _sidebox_x = _menu_x - (sprite_get_width(Spausemenu)/2) + 3;
	var _sidebox_y = y;
	
	//draw the side boxes
		if (menu_xscale = 1)
		{
			//clue item
				draw_sprite(Sclueitemenu_tabicon, side_itembox_index, sidebox_x[0], _sidebox_y);
			//stash item
				draw_sprite(Sstashitemmenu_tabicon_lvl1, side_stashitembox_index, sidebox_x[1], _sidebox_y + sprite_get_height(Spausemenu_selectboxes));
			//settings
				draw_sprite(Ssettingsmenu_tabicon, side_gearbox_index, sidebox_x[2], _sidebox_y + sprite_get_height(Spausemenu_selectboxes) * 2);
			//exit game
				draw_sprite(Ssavequitmenu_tabicon, side_exitbox_index, sidebox_x[3], _sidebox_y + sprite_get_height(Spausemenu_selectboxes) * 3);
		}
		
		switch (downtrack)
		{
			//clue items
			case 0:
				side_itembox_index = 1;
				side_stashitembox_index = 0;
				side_gearbox_index = 0;
				side_exitbox_index = 0;
			break;
			//stash items
			case 1:
				side_itembox_index = 0;
				side_stashitembox_index = 1;
				side_gearbox_index = 0;
				side_exitbox_index = 0;
			break;
			//settings
			case 2:
				side_itembox_index = 0;
				side_stashitembox_index = 0;
				side_gearbox_index = 1;
				side_exitbox_index = 0;
			break;
			//save and quit
			case 3:
				side_itembox_index = 0;
				side_stashitembox_index = 0;
				side_gearbox_index = 0;
				side_exitbox_index = 1;
			break;
		}
		for (var i = 0; i < array_length(sidebox_x); i++)
		{
			//slide out
			if (i = downtrack)
			{
				if (sidebox_x[i] > 37)
					sidebox_x[i] -= 0.75;
			} else {
				//others go in
				if (sidebox_x[i] < 40)
					sidebox_x[i] += 0.75;
			}
		}
		
	//draw the background box
		draw_sprite_ext(Spausemenu, menu_frame, _menu_x, _menu_y, menu_xscale, menu_yscale, 0, c_white, 1);
	
	#region Normal Behavior
	
	//drawing things inside each menu option
		if (menu_xscale = 1)
		{
			//draw clue item title
				if (downtrack = 0)
				{
					draw_set_font(global.font_name);
					draw_set_color(white_col);
					draw_set_halign(fa_center);
					draw_text(_menu_x - 3, _menu_y - (sprite_get_height(Spausemenu)/2) + 12, "CLUES");
					reset_draw_funcs();
				}
			//draw stash item title
				if (downtrack = 1)
				{
					draw_set_font(global.font_name);
					draw_set_color(white_col);
					draw_set_halign(fa_center);
					draw_text(_menu_x - 3, _menu_y - (sprite_get_height(Spausemenu)/2) + 12, "STASH");
					reset_draw_funcs();
				}
			//draw setting title
				if (downtrack = 2)
				{
					draw_set_font(global.font_name);
					draw_set_color(white_col);
					draw_set_halign(fa_center);
					draw_text(_menu_x - 3, _menu_y - (sprite_get_height(Spausemenu)/2) + 12, "SETTINGS");
					reset_draw_funcs();
				}
			//draw save & quit title
				if (downtrack = 3)
				{
					draw_set_font(global.font_name);
					draw_set_color(white_col);
					draw_set_halign(fa_center);
					draw_text_ext(_menu_x - 3, _menu_y - (sprite_get_height(Spausemenu)/2) + 12, "SAVE & QUIT", 12, 50);
					reset_draw_funcs();	
				}
				
				//creating new surfaces so menu items can be scrollable and drawing guts
					if (menu_xscale = 1)
					{
					
						//clue item menu
							if (downtrack = 0)
							{
								//reset setting "boxes"
									setting_row_y[0] = y - 31;
									setting_row_y[1] = y - 12;
									setting_row_y[2] = y + 7;
									setting_row_y[3] = y + 26;
									setting_keeprowy = setting_row_y[0];
									setting_row_y_moving_d = false;
									setting_row_y_moving_u = false;
									setting_index = 0;
									setting_state = 0;
								//reset stash item boxes
									stash_itembox_row_y[0] = y - 29;
									stash_itembox_row_y[1] = y - 2;
									stash_itembox_row_y[2] = y + 25;
									stash_itembox_row_y[3] = y + 52;
									stash_keeprowy = stash_itembox_row_y[0];
									stash_itembox_row_y_moving_d = false;
									stash_itembox_row_y_moving_u = false;
									stash_active_box = 0;
									stash_itembox_index = 0;
								
								if (!surface_exists(item_surface)) {
									item_surface = surface_create(sprite_get_width(Spausemenu) - 19, sprite_get_height(Spausemenu) - 39);
								}	
						
								surface_set_target(item_surface); {
									draw_clear(darkbrown_col);
									//the drawing of menu guts
										//item boxes
											for (var i = 0; i < array_length(menu[0]); i++)
											{
												if (active_box = i && !sided && !itembox_row_y_moving_u && !itembox_row_y_moving_d)
													itembox_index = 1;
												else
													itembox_index = 0;
											
												//row 1
													if (i < 2)
														draw_sprite_ext(Sitembox, itembox_index, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * i)) + 1, round(itembox_row_y[0]), 1, 1, 0, c_white, 1);
												//row 2
													if (i < 4 && i >= 2)
														draw_sprite_ext(Sitembox, itembox_index, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 2))) + 1, round(itembox_row_y[1]), 1, 1, 0, c_white, 1);
												//row 3
													if (i < 6 && i >= 4)
														draw_sprite_ext(Sitembox, itembox_index, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 4))) + 1, round(itembox_row_y[2]), 1, 1, 0, c_white, 1);
												//row 4
													if (i < max_item_boxes && i >= 6)
														draw_sprite_ext(Sitembox, itembox_index, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 6))) + 1, round(itembox_row_y[3]), 1, 1, 0, c_white, 1);
											}
											
										//actual items
											for (var i = 0; i < array_length(Oitem_manager.inv); i++)
											{
												if (active_box = i && !sided && !itembox_row_y_moving_u && !itembox_row_y_moving_d)
													var _spr_ind = 1;
												else
													var _spr_ind = 0;	
			
												//row 1
													if (i < 2)
														draw_sprite(Oitem_manager.inv[i].sprite_icon, _spr_ind, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * i) + 2) + (sprite_get_width(Sitembox)/2) - 1, round(itembox_row_y[0]) + (sprite_get_height(Sitembox)/2));
												//row 2
													if (i < 4 && i >= 2)
														draw_sprite(Oitem_manager.inv[i].sprite_icon, _spr_ind, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 2)) + 2) + (sprite_get_width(Sitembox)/2) - 1, round(itembox_row_y[1]) + (sprite_get_height(Sitembox)/2));
												//row 3
													if (i < 6 && i >= 4)
														draw_sprite(Oitem_manager.inv[i].sprite_icon, _spr_ind, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 4)) + 2) + (sprite_get_width(Sitembox)/2) - 1, round(itembox_row_y[2]) + (sprite_get_height(Sitembox)/2));
												//row 4
													if (i < max_item_boxes && i >= 6)
														draw_sprite(Oitem_manager.inv[i].sprite_icon, _spr_ind, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 6)) + 2) + (sprite_get_width(Sitembox)/2) - 1, round(itembox_row_y[3]) + (sprite_get_height(Sitembox)/2));
												
											}
										
									
										surface_reset_target();
							
								}
							
								draw_surface(item_surface, _menu_x - round((sprite_get_width(Spausemenu)/2)) + 7, _menu_y - round((sprite_get_height(Spausemenu)/2)) + 26);
							
							}
						
						//stash item menu
							if (downtrack = 1)
							{
								//reset clue item boxes
									itembox_row_y[0] = y - 29;
									itembox_row_y[1] = y - 2;
									itembox_row_y[2] = y + 25;
									itembox_row_y[3] = y + 52;
									keeprowy = itembox_row_y[0];
									itembox_row_y_moving_d = false;
									itembox_row_y_moving_u = false;
									active_box = 0;
									itembox_index = 0;
								//reset setting "boxes"
									setting_row_y[0] = y - 31;
									setting_row_y[1] = y - 12;
									setting_row_y[2] = y + 7;
									setting_row_y[3] = y + 26;
									setting_keeprowy = setting_row_y[0];
									setting_row_y_moving_d = false;
									setting_row_y_moving_u = false;
									setting_index = 0;
									setting_state = 0;
								
								if (!surface_exists(stash_item_surface)) {
									stash_item_surface = surface_create(sprite_get_width(Spausemenu) - 19, sprite_get_height(Spausemenu) - 39);
								}	
						
								surface_set_target(stash_item_surface); {
									draw_clear(#390C14);
									//the drawing of menu guts
										
										//actual items
											for (var i = 0; i < array_length(Oitem_manager.inv_stash); i++)
											{
												if (stash_active_box = i && !sided && !stash_itembox_row_y_moving_u && !stash_itembox_row_y_moving_d)
													var _spr_ind = 1;
												else
													var _spr_ind = 0;	
			
												//row 1
													if (i < 2)
														draw_sprite(Oitem_manager.inv_stash[i].sprite_icon, _spr_ind, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * i) + 2) + (sprite_get_width(Sitembox)/2) - 1, round(stash_itembox_row_y[0]) + (sprite_get_height(Sitembox)/2));
												//row 2
													if (i < 4 && i >= 2)
														draw_sprite(Oitem_manager.inv_stash[i].sprite_icon, _spr_ind, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 2)) + 2) + (sprite_get_width(Sitembox)/2) - 1, round(stash_itembox_row_y[1]) + (sprite_get_height(Sitembox)/2));
												//row 3
													if (i < 6 && i >= 4)
														draw_sprite(Oitem_manager.inv_stash[i].sprite_icon, _spr_ind, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 4)) + 2) + (sprite_get_width(Sitembox)/2) - 1, round(stash_itembox_row_y[2]) + (sprite_get_height(Sitembox)/2));
												//row 4
													if (i < max_stash_item_boxes && i >= 6)
														draw_sprite(Oitem_manager.inv_stash[i].sprite_icon, _spr_ind, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 6)) + 2) + (sprite_get_width(Sitembox)/2) - 1, round(stash_itembox_row_y[3]) + (sprite_get_height(Sitembox)/2));
											}
										
										//item boxes
											for (var i = 0; i < max_stash_item_boxes; i++)
											{
												if (stash_active_box = i && !sided && !stash_itembox_row_y_moving_u && !stash_itembox_row_y_moving_d)
													stash_itembox_index = 1;
												else
													stash_itembox_index = 0;
											
												//row 1
													if (i < 2)
														draw_sprite_ext(Sitembox, stash_itembox_index, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * i)) + 1, round(stash_itembox_row_y[0]), 1, 1, 0, c_white, 1);
												//row 2
													if (i < 4 && i >= 2)
														draw_sprite_ext(Sitembox, stash_itembox_index, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 2))) + 1, round(stash_itembox_row_y[1]), 1, 1, 0, c_white, 1);
												//row 3
													if (i < 6 && i >= 4)
														draw_sprite_ext(Sitembox, stash_itembox_index, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 4))) + 1, round(stash_itembox_row_y[2]), 1, 1, 0, c_white, 1);
												//row 4
													if (i < max_stash_item_boxes && i >= 6)
														draw_sprite_ext(Sitembox, stash_itembox_index, round((x + 64) - (sprite_get_width(Spausemenu)/2) - 34 + (32 * (i - 6))) + 1, round(stash_itembox_row_y[3]), 1, 1, 0, c_white, 1);
											}
											
										//quantity of items
											for (var i = 0; i < max_stash_item_boxes; i++)
											{
												if (Oitem_manager.inv_stash[i].quantity > 1)
												{
													draw_set_font(global.font_tiny);
													draw_set_halign(fa_center);
													var _xmod = 90;
													var _ymod = 17;
													//dark brown outline
													draw_set_color(darkbrown_col);
													//left
														draw_text((round((x + _xmod) - (sprite_get_width(Spausemenu)/2) - 36 + (32 * (i mod 2)))) - 1, round(stash_itembox_row_y[(floor(i/2))] + _ymod), string(Oitem_manager.inv_stash[i].quantity));
													//right
														draw_text((round((x + _xmod) - (sprite_get_width(Spausemenu)/2) - 36 + (32 * (i mod 2)))) + 1, round(stash_itembox_row_y[(floor(i/2))] + _ymod), string(Oitem_manager.inv_stash[i].quantity));
													//up
														draw_text(round((x + _xmod) - (sprite_get_width(Spausemenu)/2) - 36 + (32 * (i mod 2))), (round(stash_itembox_row_y[(floor(i/2))] + _ymod)) - 1, string(Oitem_manager.inv_stash[i].quantity));
													//down
														draw_text(round((x + _xmod) - (sprite_get_width(Spausemenu)/2) - 36 + (32 * (i mod 2))), (round(stash_itembox_row_y[(floor(i/2))] + _ymod)) + 1, string(Oitem_manager.inv_stash[i].quantity));
													//the actual text
													draw_set_color(white_col);
													draw_text(round((x + _xmod) - (sprite_get_width(Spausemenu)/2) - 36 + (32 * (i mod 2))), round(stash_itembox_row_y[(floor(i/2))] + _ymod), string(Oitem_manager.inv_stash[i].quantity));
													reset_draw_funcs();
												}
											}
										
									
										surface_reset_target();
							
								}
								
								draw_surface(stash_item_surface, _menu_x - round((sprite_get_width(Spausemenu)/2)) + 7, _menu_y - round((sprite_get_height(Spausemenu)/2)) + 26);
							}
						
						//setting menu
							if (downtrack = 2)
							{
								//reset clue item boxes
									itembox_row_y[0] = y - 29;
									itembox_row_y[1] = y - 2;
									itembox_row_y[2] = y + 25;
									itembox_row_y[3] = y + 52;
									keeprowy = itembox_row_y[0];
									itembox_row_y_moving_d = false;
									itembox_row_y_moving_u = false;
									active_box = 0;
									itembox_index = 0;
								//reset stash item boxes
									stash_itembox_row_y[0] = y - 29;
									stash_itembox_row_y[1] = y - 2;
									stash_itembox_row_y[2] = y + 25;
									stash_itembox_row_y[3] = y + 52;
									stash_keeprowy = stash_itembox_row_y[0];
									stash_itembox_row_y_moving_d = false;
									stash_itembox_row_y_moving_u = false;
									stash_active_box = 0;
									stash_itembox_index = 0;
								
								if (!surface_exists(setting_surface)) {
									setting_surface = surface_create(sprite_get_width(Spausemenu) - 19, sprite_get_height(Spausemenu) - 39);
								}	
						
								surface_set_target(setting_surface); {
									draw_clear(darkbrown_col);
									
									//Volume
										//title
											var _title_x = 4;
											var _vol_title_y = 1;
											
											draw_set_font(global.settings.font);
											draw_set_color(white_col);
											draw_text(_title_x, _vol_title_y + round(setting_row_y[0]), "Volume");
											reset_draw_funcs();
										//orange rectangle
											draw_set_font(global.font_classic); //to calculate the y based on the string height of Volume with the classic font not clean font
											
											draw_set_color(orange_col);
											draw_rectangle(_title_x + 3, ((_vol_title_y + string_height("Volume") + 4) + round(setting_row_y[0])), vol_knob_x, ((_vol_title_y + string_height("Volume") + 1) + round(setting_row_y[0])) + 8, false);
											reset_draw_funcs();
										//meter
											var _vol_frm = (setting_index = 0 && !sided);
											
											draw_set_font(global.font_classic);
											
											draw_sprite(Svolume_meter, _vol_frm, _title_x + 3, ((_vol_title_y + string_height("Volume") + 3) + round(setting_row_y[0])));
										//knob
											_vol_frm = (setting_state = 1);
											
											draw_set_font(global.font_classic);
											
											draw_sprite(Ssetting_knob, _vol_frm, vol_knob_x, vol_knob_y + round(setting_row_y[0]));
										//arrows
											if (setting_state = 1 && setting_index = 0)
											{
												draw_set_font(global.font_classic);
												
												//left arrow
													draw_sprite(Svolume_arrowl, volarrow_frm, _title_x + 2, (_vol_title_y + string_height("Volume") + 6));
												//right arrow
													draw_sprite(Svolume_arrowr, volarrow_frm, (_title_x + sprite_get_width(Svolume_meter) + 4), (_vol_title_y + string_height("Volume") + 6));
											}
									
									//Fullscreen
										//title
											draw_set_font(global.font_classic);
											var _full_title_y = string_height("Volume") - 1;
											
											draw_set_font(global.settings.font);
											draw_set_color(white_col);
											draw_text(_title_x, _full_title_y + round(setting_row_y[1]), "Fullscreen");
											reset_draw_funcs();
										//orange rectangle
											draw_set_color(orange_col);
											draw_rectangle(_title_x + 1, (((_full_title_y + 8) + sprite_get_height(Ssettings_menubox)) + setting_row_y[1]), ((_title_x + 1) + flsrc_xmod), (((_full_title_y + 15) + sprite_get_height(Ssettings_menubox)) + setting_row_y[1]), false);
											reset_draw_funcs();
										//meter
											var _meter_frm = (setting_index = 1 && !sided);
										
											draw_sprite(Ssettings_menubox, _meter_frm, (_title_x + 1), (((_full_title_y + 8) + sprite_get_height(Ssettings_menubox)) + setting_row_y[1]));
										//knob
											if (global.settings.fullscreen){ flsrc_xmod = 8; } else { flsrc_xmod = 0; }
											
											draw_sprite(Ssetting_knob, _meter_frm, (_title_x + 1) + flsrc_xmod, (((_full_title_y + 7) + sprite_get_height(Ssettings_menubox)) + setting_row_y[1]));
									
									//Font Switch
										//title
											draw_set_font(global.font_classic);
											var _font_title_y = string_height("Fullscreen") + sprite_get_height(Ssettings_menubox) + 2;
											
											draw_set_font(global.settings.font);
											draw_set_color(white_col);
											draw_text(_title_x, _font_title_y + round(setting_row_y[2]), "Font");
											reset_draw_funcs();
										//box
											var _box_frm = (setting_index = 2);
											if (setting_index != 2 || sided){ font_col = white_col; _box_frm = 0; }
											
											draw_sprite_ext(Ssettings_menubox, _box_frm, (_title_x + 1), ((_font_title_y + 16) + setting_row_y[2]), 2, 2, 0, c_white, 1);
										//text
											draw_set_font(global.font_tiny);
											draw_set_color(font_col);
											draw_set_halign(fa_center);
											draw_set_valign(fa_middle);
											draw_text(((_title_x + 1) + (sprite_get_width(Ssettings_menubox))), ((_font_title_y + 24) + setting_row_y[2]), font_text);
											reset_draw_funcs();
									
									//Attack Style Switch
										//title
											draw_set_font(global.font_classic);
											var _atkstyle_title_y = (string_height("Font") + (sprite_get_height(Ssettings_menubox) * 2) + 13);
											
											draw_set_font(global.settings.font);
											draw_set_color(white_col);
											draw_text(_title_x, (_atkstyle_title_y + round(setting_row_y[3])), "ATK Style");
											reset_draw_funcs();
										//box
											var _box_frm = (setting_index = 3);
											if (setting_index != 3 || sided){ atkstyle_col = white_col; _box_frm = 0; }
											
											draw_sprite_ext(Ssettings_menubox, _box_frm, (_title_x + 1), ((_atkstyle_title_y + 16) + setting_row_y[3]), 2, 2, 0, c_white, 1);
										//text
											draw_set_font(global.font_tiny);
											draw_set_color(atkstyle_col);
											draw_set_halign(fa_center);
											draw_set_valign(fa_middle);
											draw_text(((_title_x + 1) + (sprite_get_width(Ssettings_menubox))), ((_atkstyle_title_y + 24) + setting_row_y[3]), atkstyle_text);
											reset_draw_funcs();
											
									//the drawing of menu guts
									/*
											
										//Attack Style Switch
											draw_set_font(global.settings.font);
											draw_set_color(white_col);
											draw_text(_sidebox_x - 35, (y + 9) + round(setting_row_y[3]), "ATK Style");
											reset_draw_funcs();
											var _box_frm = 0;
											if (setting_index = 3){ _box_frm = 1; }
											if (setting_index != 3 || sided){ atkstyle_col = white_col; _box_frm = 0; }
											//box
											draw_sprite_ext(Ssettings_menubox, _box_frm, _sidebox_x - 34, (y + 25) + round(setting_row_y[3]), 2, 2, 0, c_white, 1); 
											//text
											draw_set_font(global.font_tiny);
											draw_set_color(atkstyle_col);
											draw_set_halign(fa_center);
											draw_set_valign(fa_middle);
											draw_text((_sidebox_x - 34) + (sprite_get_width(Ssettings_menubox)), ((y + 25) + round(setting_row_y[3])) + (sprite_get_height(Ssettings_menubox)), atkstyle_text);
											reset_draw_funcs();
											*/
										surface_reset_target();
								}
							
								draw_surface(setting_surface, _menu_x - round((sprite_get_width(Spausemenu)/2)) + 7, _menu_y - round((sprite_get_height(Spausemenu)/2)) + 26);
								
							}
						
						//save & quit menu
							if (downtrack = 3)
							{
								//reset setting "boxes"
								setting_row_y[0] = y - 31;
								setting_row_y[1] = y - 12;
								setting_row_y[2] = y + 7;
								setting_row_y[3] = y + 26;
								setting_keeprowy = setting_row_y[0];
								setting_row_y_moving_d = false;
								setting_row_y_moving_u = false;
								setting_index = 0;
								setting_state = 0;
								
								if (!surface_exists(sandq_surface)) {
									sandq_surface = surface_create(sprite_get_width(Spausemenu) - 19, sprite_get_height(Spausemenu) - 52);
								}	
						
								surface_set_target(sandq_surface); {
									draw_clear(#390C14);
									
									if (!sided)
									{
										sq_col[curs_y_track] = orange_col;
										box_imgindex[curs_y_track] = 1;
										if (curs_y_track = 1){ sq_col[0] = white_col; box_imgindex[0] = 0;} else { sq_col[1] = white_col; box_imgindex[1] = 0;}
									} else {
										sq_col[0] = white_col;	
										sq_col[1] = white_col;
										box_imgindex[0] = 0;
										box_imgindex[1] = 0;
									}
									
									//the drawing of menu guts
										draw_sprite_ext(Sitembox, box_imgindex[0], x - 7, y - 29, 46/sprite_get_width(Sitembox), 21/sprite_get_height(Sitembox), 0, c_white, 1); //save & quit to title
										draw_sprite_ext(Sitembox, box_imgindex[1], x - 7, y - 1, 46/sprite_get_width(Sitembox), 21/sprite_get_height(Sitembox), 0, c_white, 1); //save & quit game
										
										draw_set_font(global.font_tiny);
										draw_set_halign(fa_center);
										var _save_text = "SAVE\nGAME";
										var _text_ymod = -27;
										if (save_check){ _save_text = "SAVED!"; _text_ymod = -23; }
										draw_text_color((sprite_get_width(Spausemenu) - 19)/2, y + _text_ymod, _save_text, sq_col[0], sq_col[0], sq_col[0], sq_col[0], 1);
										draw_text_color((sprite_get_width(Spausemenu) - 19)/2, y + 1, "QUIT TO\nTITLE", sq_col[1], sq_col[1], sq_col[1], sq_col[1], 1);
										reset_draw_funcs();
										
										
										surface_reset_target();
								}
							
								draw_surface(sandq_surface, _menu_x - round((sprite_get_width(Spausemenu)/2)) + 7, _menu_y - round((sprite_get_height(Spausemenu)/2)) + 39);
							}
							
					}
		}
		
		//cursor
		if (menu_xscale = 1)
		{
			var curs_x = 0;
			var curs_y = 0;
			
			if (sided)
			{
				if (doonce){ vol_knob_x += round(global.settings.volume * vol_range); doonce = false;}
				curs_x = _sidebox_x - (sprite_get_width(Spausemenu_selectboxes) * 2 ) + 5;
				if (downtrack = 0){ curs_y = _sidebox_y; } else { curs_y = _sidebox_y + sprite_get_height(Spausemenu_selectboxes) * downtrack; }
				if (keyDown && downtrack < 3)
				{
					//sound effects
					play_sfx(snd_nav);
					
					downtrack++;
				}
				if (keyUp && downtrack > 0)
				{
					//sound effects
					play_sfx(snd_nav);
					
					downtrack--;
				}
				//if we want to go into the menu
					if (keyRight || keySelect)
					{
						//sound effects
						play_sfx(snd_select);
						
						sided = false;
					}
				
				curs_x_track = 1;
				curs_y_track = 0;
				if (active_box mod 2 != 0)
				{
					if (active_box >= (max_item_boxes - 1))
					{
						active_box -= 3;
					} else {
						active_box--;	
					}
				} else  if (active_box = (max_item_boxes - 2)) {
					active_box -= 2;	
				}
				if (stash_active_box mod 2 != 0)
				{
					if (stash_active_box >= (max_stash_item_boxes - 1))
					{
						stash_active_box -= 3;
					} else {
						stash_active_box--; 
					}
				} else if (stash_active_box = (max_stash_item_boxes - 2)) {
					stash_active_box -= 2;
				}
			} else {
				
				switch(downtrack)
				{
					//clue item menu
						case 0:
							//getting x values
								if (itembox_row_y_moving_d = false && itembox_row_y_moving_u = false && wait_a_frame = 0 && !instance_exists(Otextbox) && !Oloveletter_letter.visible)
								{
									if (keyRight && curs_x_track < 2)
									{
										//sound effects
										play_sfx(snd_nav);
										
										curs_x_track++;
										active_box++;
									}
									if (keyLeft && curs_x_track = 2)
									{
										//sound effects
										play_sfx(snd_nav);
										
										curs_x_track--;
										active_box--;
									} else if (keyLeft && curs_x_track = 1) {
										//sound effects
										play_sfx(snd_nav);
										
										sided = true;
									}
									if (keyBack && (curs_x_track = 1 || curs_x_track = 2))
									{
										//sound effects
										play_sfx(snd_back);
										
										sided = true;
									}
								//getting y values
									if (keyDown && active_box < 6)
									{
										curs_y_track++;
										active_box += 2;
									}
									if (keyUp && active_box > 1)
									{	
										curs_y_track--;
										active_box -= 2;
									}
								} else if (wait_a_frame > 0){ wait_a_frame--; }
									
								curs_x = round((x + 66) - (sprite_get_width(Spausemenu)/2) - 32 + (32 * curs_x_track));
								curs_y = round(y + 10 + (25 * curs_y_track));
						break;
						
					//stash item menu
						case 1:
							//getting x values
								if (stash_itembox_row_y_moving_d = false && stash_itembox_row_y_moving_u = false && wait_a_frame = 0 && !instance_exists(Otextbox) && !Oloveletter_letter.visible)
								{
									if (keyRight && curs_x_track < 2)
									{
										//sound effects
										play_sfx(snd_nav);
										
										curs_x_track++;
										stash_active_box++;
									}
									if (keyLeft && curs_x_track = 2)
									{
										//sound effects
										play_sfx(snd_nav);
										
										curs_x_track--;
										stash_active_box--;
									} else if (keyLeft && curs_x_track = 1) {
										//sound effects
										play_sfx(snd_nav);
										
										sided = true;
									}
									if (keyBack && (curs_x_track = 1 || curs_x_track = 2))
									{
										//sound effects
										play_sfx(snd_back);
										
										sided = true;
									}
								//getting y values
									if (keyDown && stash_active_box < (max_stash_item_boxes - 2))
									{
										curs_y_track++;
										stash_active_box += 2;
									}
									if (keyUp && stash_active_box > 1)
									{	
										curs_y_track--;
										stash_active_box -= 2;
									}
								} else if (wait_a_frame > 0){ wait_a_frame--; }
									
								curs_x = round((x + 66) - (sprite_get_width(Spausemenu)/2) - 32 + (32 * curs_x_track));
								curs_y = round(y + 10 + (25 * curs_y_track));
						break;
					
					//settings menu
						case 2:
							
								//get y values
								if (setting_row_y_moving_d = false && setting_row_y_moving_u = false && wait_a_frame = 0 && !instance_exists(Otextbox))
								{
									if (keyUp && setting_index - 1 >= 0 && setting_state != 1)
									{
										curs_y_track--;
										setting_index--;
									}
									if (keyDown && setting_index + 1 <= 3 && setting_state != 1)
									{
										curs_y_track++;
										setting_index++;
									}
									if (keyLeft && setting_state = 0)
									{
										//sound effects
										play_sfx(snd_nav);
										
										sided = true;
										save_settings();
									}
									
								} else if (wait_a_frame > 0){ wait_a_frame --; }
								
								var _volknobx_mod = 0;
								if (setting_index = 0 && setting_state = 1){ _volknobx_mod = vol_knob_x - 8; }
								curs_x = round((x + 66) - (sprite_get_width(Spausemenu)/2) + _volknobx_mod);
								curs_y = round(y + 28 + (25 * curs_y_track));
								//show_debug_message("CURS X: " + string(curs_x));
						break;
						
					//save & quit menu
						case 3:
							if (keyDown && curs_y_track < 1)
							{
								//sound effects
								play_sfx(snd_nav);
								
								curs_y_track++;
								
								save_check = false;
							}
							if (keyUp && curs_y_track > 0)
							{
								//sound effects
								play_sfx(snd_nav);
								
								curs_y_track--;
							}
							if (keyLeft)
							{
								//sound effects
								play_sfx(snd_nav);
								
								sided = true;
								
								save_check = false;
							}
							if (keyBack)
							{
								//sound effects
								play_sfx(snd_back);
								
								sided = true;
								
								save_check = false;
							}
								
							curs_x = round((x + 70) - (sprite_get_width(Spausemenu)/2));
							curs_y = round(y + 21 + (28 * curs_y_track));
						break;
				}
				
			}

			draw_sprite(Smglass_cursor, 0, round(curs_x), round(curs_y));
		}
	
	#endregion
	

}




