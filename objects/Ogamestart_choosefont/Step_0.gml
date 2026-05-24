if (instance_exists(Ogamestartmenu)){ exit; }

//navigation
keyRight = keyboard_check_pressed(vk_right);
keyLeft = keyboard_check_pressed(vk_left);
keySelect = keyboard_check_pressed(ord("Z"));


if (keyRight && nav < 1 && beat = 0)
{
	nav = 1;
	
	if (instance_exists(Otextbox)){ instance_destroy(Otextbox); }
	global.settings.font = global.font_ffl;
	create_textbox("selectfont_gamestart");
}

if (keyLeft && nav > 0 && beat = 0)
{
	nav = 0;
	
	if (instance_exists(Otextbox)){ instance_destroy(Otextbox); }
	global.settings.font = global.font_classic;
	create_textbox("selectfont_gamestart");
}


if (keySelect || beat > 0)
{
	switch(beat)
	{
		case 0:
			//lock nav
			instance_destroy(Otextbox);
			beat++;
		break;
		
		case 1:
			if (black_alph < 1)
			{
				black_alph += 0.035
			} else {
				beat++;
			}
		break;
		
		case 2:
			room_goto(Rgame_start);
		break;
	}
}


//show_debug_message("beat: " + string(beat));












