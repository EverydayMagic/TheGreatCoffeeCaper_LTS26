
switch (trans_type)
{
	case "fade":
		if (room != newRoom)
		{
			if (fadeLevel >= 1)
				room_goto(newRoom);	
		}
	
		draw_set_color(fadeColor);
		draw_set_alpha(fadeLevel);
		draw_rectangle(0, 0, room_width, room_height, false);
		draw_set_alpha(1);
		draw_set_color(c_white);
	break;
	
	case "map":
		if (wait_a_frame_map > 0)
		{
			wait_a_frame_map--;
			exit;
		}
	
		//draw map bg
		if (room != newRoom)
		{
			draw_sprite_ext(Smap, mapIndex, 0 + (160 * -horz), 0 + (144 * -vert), 1, 1, 0, c_white, 1);
			room_goto(newRoom);
			
			map_placed = true;
			
			//draw the characters on top of the map
			//for (var i = 0; i < array_length(oldChars_data_array) - 1; i++)
			//{
				
			//	if (oldChars_data_array[i].obj != Oplayer)
			//		draw_sprite(oldChars_data_array[i].spr_index, oldChars_data_array[i].img_index, oldChars_data_array[i].x + (160 * -horz), oldChars_data_array[i].y + (144 * -vert));
			//	else
			//		draw_sprite(oldChars_data_array[i].spr_index, oldChars_data_array[i].img_index, oldChars_data_array[i].x, oldChars_data_array[i].y);
			//}
		} else {
			//old room bg
			draw_sprite_ext(Smap, mapIndex, 0 + (160 * -horz), 0 + (144 * -vert), 1, 1, 0, c_white, 1);
			camera_set_view_size(VIEW, 160, 144);
			//new room bg
			draw_sprite(Smap, newMapIndex, 0, 0);
			
			//draw the characters on top of the map
			for (var i = 0; i < array_length(oldChars_data_array); i++)
			{
				if (oldChars_data_array[i].obj != Oplayer && oldChars_data_array[i].obj != Otrojandeer)
				{
					var _place = true;
					for (var p = 0; p < array_length(global.player_party); p++)
					{
						if (oldChars_data_array[i].obj = global.player_party[p])
						{
							_place = false;
							break;
						}
					}
					if (_place){ draw_sprite(oldChars_data_array[i].spr_index, oldChars_data_array[i].img_index, oldChars_data_array[i].x  + (160 * -horz), oldChars_data_array[i].y + (144 * -vert)); }
				} else if (instance_exists(Oplayer) || instance_exists(Otrojandeer)) {
					draw_sprite(oldChars_data_array[i].spr_index, oldChars_data_array[i].img_index, oldChars_data_array[i].x, oldChars_data_array[i].y);	
				}
			}
			
			if (instance_exists(Oplayer))
			{
				Oplayer.x = newX;
				Oplayer.y = newY;
			}
			
			if (instance_exists(Otrojandeer))
			{
				Otrojandeer.x = newX;
				Otrojandeer.y = newY;
			}
			
			if (instance_exists(Ocharliemouse)){ Ocharliemouse.room_vis_check = true; }
		}
	
		if (arrived)
		{
			
			if (arrive_timer != 0)
			{
				arrive_timer--;
				exit;
			} else {
				if (instance_exists(Oplayer))
				{
					Oplayer.state = PlayerStateFree;
					Oplayer.visible = true;
				}
				if (instance_exists(Oclouds)){ Oclouds.alarm[0] = 1; }
				global.transitioning = false;
				instance_destroy();
			}
			
		}
	break;
	
	case "iris fade":
		if (radius <= 0 && room != newRoom && fadeLevel < 1)
		{
			draw_set_color(darkbrown_col);
			draw_rectangle(0, 0, room_width, room_height, false);
		}
		
		if (room != newRoom && fadeLevel >= 1)
		{
			room_goto(newRoom);	
		}
		if (radius <= 0 && iris_fade_start_fade)
		{
			draw_set_color(fadeColor);
			draw_set_alpha(fadeLevel);
			draw_rectangle(0, 0, room_width, room_height, false);
		}
		reset_draw_funcs();
	break;

}




