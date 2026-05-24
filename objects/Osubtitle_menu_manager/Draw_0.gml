switch (menu)
{
	//SAVE MENU
		case 1:
			//draw the menu highlight
				if (check_rot = rot)
				{
					draw_sprite(Ssavemenu_highlight_box, 0, menu_x, menu_y + 5);
				}
		break;
	//SAVE TO SETTINGS MENU
		case 67:
			//Still want to draw save menu during transition
				if (menu = 67) {
					//Set vars
						var pr = ds_priority_create();
						var i = 0;

					//add menus global.saveslot to the priority que
						repeat (_boxes) {
							ds_priority_add(pr, i, lengthdir_y(1, (rot - 90) + i * (360/_boxes)));
							i += 1;
						}

					//draw the menu
						repeat (_boxes) {
							i = ds_priority_delete_min(pr); 
							draw_sprite_ext(sprite_index,
								i,round(menu_x+lengthdir_x(menu_width/2,(rot-90)+i*(360/_boxes))),
								round(menu_y+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes))),
								round(1+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes))/(menu_height*2)),
								round(1+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes))/(menu_height*2)),
								0,c_white,1);
						}

					//remove ds priority
						ds_priority_destroy(pr);
		
					//Save Titles
						if (check_rot = rot)
						{
							draw_set_font(global.settings.font);
							draw_set_color(white_col);
							draw_set_halign(fa_center);
							draw_text_ext_transformed(
								round(menu_x+lengthdir_x(menu_width/2,(rot-90)+i*(360/_boxes))),
								round(menu_y+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes)) - 34),
								"SAVE " + string(global.saveslot + 1),
								10, 500,
								round(1+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes))/(menu_height*2)),
								round(1+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes))/(menu_height*2)),
								0
							);
							draw_set_halign(fa_left);
							draw_set_color(c_white);
						}
				}
			
		break;
	//SETTINGS TO SAVE MENU
		case 68:
			//Still want to draw save menu during transition
				if (menu = 68) {
					//Set vars
						var pr = ds_priority_create();
						var i = 0;

					//add menus global.saveslot to the priority que
						repeat (_boxes) {
							ds_priority_add(pr, i, lengthdir_y(1, (rot - 90) + i * (360/_boxes)));
							i += 1;
						}

					//draw the menu
						repeat (_boxes) {
							i = ds_priority_delete_min(pr); 
							draw_sprite_ext(sprite_index,
								i,round(menu_x+lengthdir_x(menu_width/2,(rot-90)+i*(360/_boxes))),
								round(menu_y+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes))),
								round(1+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes))/(menu_height*2)),
								round(1+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes))/(menu_height*2)),
								0,c_white,1);
						}

					//remove ds priority
						ds_priority_destroy(pr);
		
					//Save Titles
						if (check_rot = rot)
						{
							draw_set_font(global.settings.font);
							draw_set_color(white_col);
							draw_set_halign(fa_center);
							draw_text_ext_transformed(
								round(menu_x+lengthdir_x(menu_width/2,(rot-90)+i*(360/_boxes))),
								round(menu_y+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes)) - 34),
								"SAVE " + string(global.saveslot + 1),
								10, 500,
								round(1+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes))/(menu_height*2)),
								round(1+lengthdir_y(menu_height/2,(rot-90)+i*(360/_boxes))/(menu_height*2)),
								0
							);
							draw_set_halign(fa_left);
							draw_set_color(c_white);
						}
				}
		break;
}

//navigator box
	draw_sprite_ext(sprite_index, 0, 80, 16, 100/sprite_width, 28/sprite_height, 0, c_white, 1);
//navigator text
	draw_set_font(global.font_name);
	draw_set_color(white_col);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(80, 17, nav_text);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
//navigator arrows
	//draw_sprite(Ssavemenu_navarrow, navarrow_index[0], 10, 8);
	//draw_sprite_ext(Ssavemenu_navarrow, navarrow_index[0], 150, 8 + sprite_get_height(Ssavemenu_navarrow), 1, 1, 180, c_white, 1);


//mglass cursor
	draw_sprite_ext(Smglass_cursor, 0, mglass_x, mglass_y, 1, 1, 0, c_white, 1);









