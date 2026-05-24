menu = 1;
menu_level = 1;

depth = -room_height;

//navigation
nav_text = "FILE SELECT";
navarrow_index[0] = 2;
navarrow_index[1] = 0;
navarrow_optional[0] = false;
navarrow_optional[1] = true;
navarrow_prev = 0;

mglass_x = 44;
mglass_y = 40;

//SAVE MENU
	left = false;
	//Set vars
	selected = 0;
	rot = 0;
	check_rot = 0;
	//with rot_spd, lower number is faster
		rot_spd = 5;
	global.saveslot = 0;

	//Set the position of the menu
	menu_x = room_width/2;
	menu_y = room_height/2 + 8;

	//Set the size of the menu
	menu_width = room_width + 32;
	//menu_width = room_width - 32;
	menu_height = 10;
	//menu_height = 32;
	
	loadcol = white_col;
	erasecol = white_col;
	yescol = white_col;
	nocol = white_col;
	
	charswap_spr = Stitle_charswap;
	
	erase_option = false;

//create boxes
menu_box = [];
for (var i = 0; i < 3; i++)
{
	with (instance_create_depth(0, 0, 0, Osubtitle_menu_box))
	{
		sprite_index = Ssavemenu_box;
		box_id = i;
		if (box_id > 2){ box_id = 0; }
		array_push(Osubtitle_menu_manager.menu_box, self.id);
		
		switch(global.saveslot)
		{
			case 0:
				switch (box_id)
				{
					case 0:
						ss = 0;
					break;
					case 1: 
						ss = 1;
					break;
					case 2:
						ss = 2;
					break;
				}
			break;
			case 1:
				switch (box_id)
				{
					case 0:
						ss = 1;
					break;
					case 1: 
						ss = 2;
					break;
					case 2:
						ss = 0;
					break;
				}
			break;
			case 2:
				switch (box_id)
				{
					case 0:
						ss = 2;
					break;
					case 1: 
						ss = 0;
					break;
					case 2:
						ss = 1;
					break;
				}
			break;
		}
	}
}


//load_game(Osubtitle_menu);