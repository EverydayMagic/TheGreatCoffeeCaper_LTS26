GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();


switch (beat)
{
	case 0:
		if (!global.itemAdding)
		{			
			//sound effects
			play_sfx(snd_fanfareshort);	
		}
		
		if (instance_exists(Oplayer))
			depth = Oplayer.depth - 1;
		global.itemAdding = true;
		//make player spin
		if (Oplayer.sprite_index != Splayer_capspin && Oplayer.sprite_index != Splayer_nocapspin)
		{
			if (global.playerIdle = Splayer_capidle){ Oplayer.sprite_index = Splayer_capspin; } else { Oplayer.sprite_index = Splayer_nocapspin; }
			Oplayer.image_index = 0;
		}
		
		if (Oplayer.image_index < Oplayer.image_number - 1)
		{
			Oplayer.image_speed = 2;
		} else {
			Oplayer.image_index = Oplayer.image_number - 1;
			beat++;
		}
			
	break;
	case 1:
		//CAM MOVEMENT
			//move camera
			if (cam_x < cam_xdist)
				cam_x += cam_xdist/time;
			if (cam_y < cam_ydist)
				cam_y += cam_ydist/time;
			
			camera_set_view_pos(VIEW, cam_x, cam_y);

			//shorten camera
			if (cam_width > (160/2))
				cam_width -= cam_wdist/time;
			if (cam_height > (144/2))
				cam_height -= cam_hdist/time;
			
			camera_set_view_size(VIEW, cam_width, cam_height);
		//OTHER
			//change hoots sprite
			if (global.playerIdle = Splayer_capidle){ Oplayer.sprite_index = Splayer_capitemhoist; } else { Oplayer.sprite_index = Splayer_nocapitemhoist; }
			
			//change star pos
			if (y > star_ydist)
				y -= star_ydist/time;
			
			//shrink iris
			if (radius > 100)
				radius -= radius_dist/time;
			else
				beat++;
				
			//update text variables
			bigtext_x = cam_width;
			bigtext_y = -5;
			bigtext_y_dist = abs(bigtext_y);
			bigtext_xscale = 0;
			bigtext_yscale = 0;
			item_desc = item_revealing.description;
	break;
	case 2:
		//YOU FOUND title
		if (bigtext_y < bigtext_y_dist)
		{
			bigtext_y += bigtext_y_dist/(time/4);
		} else {
			if (bigtext_xscale < 1)
				bigtext_xscale += 1/(time/2);
				
			if (bigtext_yscale < 1)
				bigtext_yscale += 1/(time/2);
			else
				beat++;
		}
		
	break;
	case 3:
		//item description typing
		if (type_timer <= 0)
		{
			if (string_length(item_desc_type) < string_length(item_desc))
			{
				var _letter = string_char_at(item_desc, char + 1);
				item_desc_type += _letter;
				
				//typing noise
				play_sfx(default_voice);
			}
			type_timer = type_speed;
			char++;
			
		} else {
			type_timer--;	
		}
		
		//skipping text typing
		if (keyboard_check_pressed(ord("X")) && (string_length(item_desc_type) < string_length(item_desc)))
			item_desc_type = item_desc;
			
		//after done typing
		if (string_length(item_desc_type) >= string_length(item_desc))
		{
			//arrow animating
			arrow_index+= (6/30);
			
			//moving on
			if (keyboard_check_pressed(ord("Z")))
				beat++;
		}
	break;
	case 4:
		if (instance_exists(Oplayer))
			depth = Oplayer.depth + 1;
		//move star and item back down
		if (y < Oplayer.y)
			y += (y + 24)/time;
		
		//reposition camera
		if (cam_x > 0)
			cam_x += (-cam_xdist)/time;
		if (cam_y > 0)
			cam_y += (-cam_ydist)/time;
			
		camera_set_view_pos(VIEW, cam_x, cam_y);
		
		//zoom out camera
		if (cam_width < 160)
			cam_width += 80/time;
		if (cam_height < 144)
			cam_height += (144/2)/time;
		
		camera_set_view_size(VIEW, cam_width, cam_height);
		
		
		//grow iris
		if (radius < GUI_W/2)
		{
			radius += (radius_dist)/time;
		} else {
			beat++;
		}
	break;
	case 5:
		Oplayer.sprite_index = global.playerIdle;
		Oplayer.image_index = 3;
		Oplayer.image_speed = 0;
		beat++;
	break;
	case 6:
		if (effect_timer <= 0)
		{
			global.itemAdding = false;
			if (!instance_exists(Otextbox))
				item_revealing.effect();
			instance_destroy();
		} else {
			effect_timer--;
		}
	break;
}









