keyBack = keyboard_check_pressed(vk_escape);
keyEnter = keyboard_check_pressed(vk_enter);
keyMode = keyboard_check_pressed(vk_left);


if (keyBack)
{
	if (state = 0)
	{
		room_goto(Rdebug_menu);	
	} else {
		state--;	
	}
}

if (keyMode)
{
	if (mode = "ID"){ mode = "Direct"; } else { mode = "ID"; }
	keyboard_string = "";
	state = 0;
	text_input = "";
	face_input = "";
}

switch (mode)
{
	case "ID":
		input_instruct = "Type Text ID";
		
		if (keyEnter)
		{
			create_textbox(keyboard_string);
			keyboard_string = "";
		}
	break;
	
	case "Direct":
		if (state = 0)
		{
			input_instruct = "Type Text to Display";	
		} else {
			input_instruct = "Type Character Portrait ID to Use (Type nothing to use no portrait)";	
		}
		
		if (keyEnter)
		{
			if (state = 0)
			{
				text_input = keyboard_string;
				keyboard_string = "";
				state++;
			} else {
				face_input = keyboard_string;
				keyboard_string = "";
				debug_create_textbox(text_input, face_input);
				state = 0;
				text_input = "";
				face_input = "";
			}
		}
	break;
}

show_debug_message("state: " + string(state));
if (keyboard_string != "" && text_error){ text_error = false; }


if (instance_exists(Otextbox)){ keyboard_string = ""; }


















