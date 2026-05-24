if (!global.debugActive){ exit; }

if (keyboard_check_pressed(vk_f9))
{ 
	debug_controls_on =! debug_controls_on; 
	
	if (!debug_controls_on){ show_debug_message("DEBUG_CONTROLS OFF") }
	if (debug_controls_on){ show_debug_message("DEBUG CONTROLS ON"); }
}

if (debug_controls_on)
{
	
	if (keyboard_check_pressed(ord("R"))){ room_restart(); }
	if (keyboard_check(vk_lshift) && keyboard_check_pressed(ord("R"))){ game_restart(); }
	if (keyboard_check(vk_lshift) && keyboard_check_pressed(vk_enter)){ room_goto_previous(); }
	if (keyboard_check(vk_rshift) && keyboard_check_pressed(vk_enter)){ room_goto_next(); }
	if (keyboard_check_pressed(vk_space)){ debug_ovr =! debug_ovr; show_debug_overlay(debug_ovr); }
	if (keyboard_check_pressed(ord("0")))
	{
		if (fps_index < 2){ fps_index++; } else { fps_index = 0; }
		switch(fps_index){
			case 0:
				game_set_speed(30, gamespeed_fps); 		
			break;
			case 1:
				game_set_speed(10, gamespeed_fps);
			break;
			case 2:
				game_set_speed(60, gamespeed_fps);
			break;
		}
	}
	if (keyboard_check_pressed(ord("1"))){ ibox =! ibox; }
	if (keyboard_check_pressed(ord("2"))){ fast_player =! fast_player; }
	//3 hasn't been decided yet
	if (keyboard_check_pressed(ord("4"))){ no_damage =! no_damage; }
	//5 through 8 can't be done till battles are done yet
	if (keyboard_check_pressed(ord("9")))
	{ 
		col_seen =! col_seen;
		if (layer_exists("Col")) layer_set_visible("Col", col_seen);
		if (layer_exists("Col_Broken")) layer_set_visible("Col_Broken", col_seen);
	}
	if (keyboard_check_pressed(vk_escape)){ room_goto(Rdebug_menu); }
	

}
//if (keyboard_check_pressed(ord("0")) && room != Rdebug_menu)
//{
//	vis =! vis;
//	visible = vis;
//}

//if (keyboard_check_pressed(ord("9")))
//{
//	col_seen =! col_seen
//	if (layer_exists("Col")) layer_set_visible("Col", col_seen);
//	if (layer_exists("Col_Broken")) layer_set_visible("Col_Broken", col_seen);
//}

//if (!instance_exists(Otextbox))
//	interacting_with[0] = noone;





