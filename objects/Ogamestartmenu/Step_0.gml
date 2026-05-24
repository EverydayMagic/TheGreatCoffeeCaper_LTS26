
switch (beat)
{
	case 0:
		if (alarm[1] = -1){ alarm[1] = 30; }
	break;
	
	case 1:
		//fade in
		if (black_alph > 0)
			black_alph -= 0.035;
		else
			beat++
	break;
	
	case 2:
		if (keyboard_check_pressed(ord("Z")))
		{
			beat++;
			txt_alph = 1;
		}
	break;
	
	case 3:
		if (black_alph < 1)
		{
			black_alph += 0.035
		} else {
			instance_create_layer(0, 0, "Instances", Ogamestart_choosefont);
			beat++;
		}
	break;
	
	case 4:
		//fade in
		if (black_alph > 0)
			black_alph -= 0.035;
		else
			beat++
	break;
	
	case 5:
		create_textbox("selectfont_gamestart");
		instance_destroy();
	break;
}
