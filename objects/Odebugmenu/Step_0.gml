keyDown = keyboard_check_pressed(vk_down);
keyUp = keyboard_check_pressed(vk_up);
keySelect = keyboard_check_pressed(ord("Z"));

if (keyDown && index < array_length(menu_options))
{
	play_sfx(snd_nav);
	index++;	
} else if (keyDown && index >= array_length(menu_options)) {
	play_sfx(snd_nav);
	index = 1;	
}

if (keyUp && index > 1)
{
	play_sfx(snd_nav);
	index--;	
} else if (keyUp && index <= 1) {
	play_sfx(snd_nav);
	index = array_length(menu_options);
}

if (keySelect)
{
	play_sfx(snd_select);
	switch (index)
	{
		case 1: //room travel
			room_goto(Rdebug_room_travel);
		break;
		case 2: //save file select
			
		break;
		case 3: //text
			room_goto(Rdebug_text);
		break;
		case 4: //minigame
		
		break;
		case 5: //battle
			room_goto(Rdebug_battle);
		break;
		case 6:	//main menu
			room_goto(Rtitle);
		break;
	}
}