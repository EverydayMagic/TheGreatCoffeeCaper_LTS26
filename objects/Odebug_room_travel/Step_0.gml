keyBack = keyboard_check_pressed(vk_escape);
keyEnter = keyboard_check_pressed(vk_enter);

if (keyBack)
{
	room_goto(Rdebug_menu);	
}


if (keyboard_string != "" && room_error){ room_error = false; }


if (keyEnter)
{
	var _rm = asset_get_index(keyboard_string);
	if (room_exists(_rm)){ room_goto(_rm); } else { room_error = true; }
	keyboard_string = "";
}
















