GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();

switch (beat)
{
	//ED Magic Logo fades in
	case 0:
		if (ed_alpha >= 0 && ed_alpha < 1)
		{
			ed_alpha += 0.04;
		} else {
			if (ed_alpha >= 1)
			{
				see_logo_length = 1;
				time_source_start(see_logo_time);
				if (keyboard_check_pressed(ord("Z")))
				{
					time_source_stop(see_logo_time);
					time_source_reset(see_logo_time);
					beat++;
				}
			}
		}
	break;
	
	//ED Magic Logo fades out
	case 1:
		if (ed_alpha > 0)
			ed_alpha -= 0.02;	
		else {
			beat = 2;
			display_set_gui_size(320, 288);
		}	
		//if (!blah)
		//{
		
		//}
	break;
	
	//1st Coffee Caper Logo
	case 2:
		see_logo_length = 2;
		if (time_source_get_state(see_logo_time) != time_source_state_active)
			time_source_reset(see_logo_time);
		time_source_start(see_logo_time);
	break;
	
	//Circle Appears
	case 3:
		see_logo_length = 1;
		if (time_source_get_state(see_logo_time) != time_source_state_active)
			time_source_reset(see_logo_time);
		time_source_start(see_logo_time);
	break;
	
	//Circle Grows and Start is Shown
	case 4:
		//circle_bg_frm = Otitle_circle.image_index;
		//if (Otitle_circle.stop_anim = true && wait_a_frame = 0)
		//{
		//	circle_scale += 0.025;
		//} else {
		//	circle_scale = 1;
		//	if (Otitle_circle.stop_anim)
		//		wait_a_frame--;
		//}
		
		//Start
		if (keyboard_check_pressed(ord("Z")))
		{
			zstart_img = 1;
			with (instance_create_depth(x, y, -bbox_bottom, Ofade))
			{
				newRoom = Rsubtitle;
				trans_type = "iris";
			}
		}
		display_set_gui_size(320, 288);
	break;
	case 5:
		//Start
		if (keyboard_check_pressed(ord("Z")) && !instance_exists(Ofade))
		{
			zstart_img = 1;
			with (instance_create_depth(x, y, -bbox_bottom, Ofade))
			{
				//sound effects
				play_sfx(snd_select);
				
				newRoom = Rsubtitle;
				trans_type = "iris";
			}
		}
	break;
}

if (keyboard_check_pressed(ord("Z")) && beat >= 2 && beat != 5)
{
	if (time_source_get_state(see_logo_time) = time_source_state_active)
		time_source_stop(see_logo_time);
	beat = 5;
	layer_set_visible("BG", true);
}

//show_debug_message("beat: " + string(beat));
//show_debug_message("GUI W: " + string(GUI_W) + " GUI_H: " + string(GUI_H));






