draw_self();

var _center_x = ((sprite_width - 10)/2);
var _center_y = ((sprite_height - 10)/2);

if (!surface_exists(save_surface)) {
	save_surface = surface_create(sprite_width - 10, sprite_height - 10);
}

surface_set_target(save_surface); {
	draw_clear(darkbrown_col);
	
		//Save Title
			if (file_exists("tgcc" + string(ss) + ".edm"))
			{
				draw_set_font(global.settings.font);
				var _col = white_col;
				if (global.saveslot != ss){ _col = #83391D; }
				draw_set_color(_col);
				draw_set_halign(fa_center);
				//different position if using Clean font
					var _y = -1;
					if (global.settings.font = global.font_ffl){ _y = 1; }
				draw_text(_center_x, _y, "SAVE " + string(ss + 1));
				reset_draw_funcs();
			} else {
				//if a save file does not exist
					if (!file_exists("tgcc" + string(ss) + ".edm"))
					{
						//Create Game Text
							draw_set_font(global.settings.font)
							var _col = white_col;
							if (global.saveslot != ss){ _col = #83391D; }
							draw_set_color(_col);
							draw_set_halign(fa_center);
							//different position if using Clean font
								var _y = -1;
								if (global.settings.font = global.font_ffl){ _y = 1; }
							draw_text(_center_x, _y, "NEW \nGAME"); 
							draw_set_halign(fa_left);
							draw_set_color(c_white);
							reset_draw_funcs();		
						//Plus Icon
							var _col = c_white;
							if (global.saveslot != ss){ _col = #83391D; }
							draw_sprite_ext(Snewgameplus, 0, _center_x, _center_y, 1, 1, 0, _col, 1);
								
					}
					
			}
		
		//Save Percentage
			if (file_exists("tgcc" + string(ss) + ".edm"))
			{
				draw_set_font(global.font_name);
				var _col = white_col;
				if (global.saveslot != ss){ _col = #83391D; }
				draw_set_color(_col);
				draw_set_halign(fa_center);		
				draw_text(_center_x, 11, string(round(global.story_percent[ss])) + "%");
				reset_draw_funcs();
			}
			
		//Character Icon
			if (file_exists("tgcc" + string(ss) + ".edm"))
			{
				if (global.saveslot != ss){ shader_set(SHDsepia); }
				draw_set_halign(fa_center);
				draw_sprite(Stitle_charswap, global.settings.menu_char[ss], _center_x, _center_y + 14);
				shader_reset();
			}
		
		//Load and Delete
			if (file_exists("tgcc" + string(ss) + ".edm") && global.saveslot = ss)
			{
				if (Osubtitle_menu_manager.erase_option = false)
				{
					draw_set_font(global.font_tiny);
					draw_set_color(Osubtitle_menu_manager.loadcol);
					draw_set_halign(fa_center);
					draw_text(_center_x, _center_y + 17, "LOAD");
					draw_set_color(Osubtitle_menu_manager.erasecol);
					draw_text(_center_x, _center_y + 24, "ERASE");
					reset_draw_funcs();
					
				} else {
					//Really Erase
						draw_set_font(global.font_tiny);
						draw_set_color(white_col);
						draw_set_halign(fa_center);
						draw_text(_center_x, _center_y + 17, "ERASE GAME?");
						draw_set_color(Osubtitle_menu_manager.yescol);
						draw_text(_center_x - 8, _center_y + 24, "YES");
						draw_set_color(Osubtitle_menu_manager.nocol);
						draw_text(_center_x + 8, _center_y + 24, "NO");
						reset_draw_funcs();
					
				}
			}
		
	surface_reset_target();
}

draw_surface(save_surface, (x - (sprite_width/2)) + 5, (y - (sprite_height/2)) + 5);





















