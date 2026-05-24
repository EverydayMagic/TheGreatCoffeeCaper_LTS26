/// @description [esc] quit game
if (quit_game_text != "QUIT GAME...")
{
	quit_game_text += ".";	
} else {
	game_end();	
}

if (keyboard_check(vk_escape))
	alarm_set(2, 15);
else
	quit_game_text = false;

















