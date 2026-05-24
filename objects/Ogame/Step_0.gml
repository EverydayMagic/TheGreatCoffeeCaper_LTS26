depth = -bbox_bottom;

//controls globals
global.control_up = keyboard_check(vk_up);
global.control_down = keyboard_check(vk_down);
global.control_left = keyboard_check(vk_left);
global.control_right = keyboard_check(vk_right);
global.movement_controls = [global.control_up, global.control_down, global.control_left, global.control_right];

//if (keyboard_check(vk_enter))
//{
//	if (keyboard_check_pressed(vk_rshift))
//		room_goto_next();
//	if (keyboard_check_pressed(vk_lshift))
//		room_goto_previous();
//}

show_debug_message("HP: " + string(global.hp));

if (keyboard_check(vk_escape) && display_get_gui_width() = (Ocamera.view_width * Ocamera.app_scale))
{
	quitting_game = true;
	if (alarm[2] = -1)
	{
		alarm[2] = 15;	
	}
} else {
	if (alarm[2] != -1){ alarm[2] = -1; quit_game_text = "QUIT GAME";}	
	quitting_game = false;
}
//if (global.now_loading != true)
//{
//	menu_char[0] = menu_char_forsave[0];
//	menu_char[1] = menu_char_forsave[1];
//	menu_char[2] = menu_char_forsave[2];
//} else {
//	if (menu_char[0] > menu_char_forsave[0])
//	{
//		menu_char_forsave[0] = menu_char[0];
//		menu_char_forsave[1] = menu_char[1];
//		menu_char_forsave[2] = menu_char[2];
//	} else {
//		if (menu_char[0] < menu_char_forsave[0])
//		{
//			menu_char[0] = menu_char_forsave[0];
//			menu_char[1] = menu_char_forsave[1];
//			menu_char[2] = menu_char_forsave[2];	
//		}
//	}
//}


//show_debug_message("menuchar[0]: " + string(Ogame.menu_char[0]));
//show_debug_message("menuchar[1]: " + string(Ogame.menu_char[1]));
//show_debug_message("menuchar[2]: " + string(Ogame.menu_char[2]));

