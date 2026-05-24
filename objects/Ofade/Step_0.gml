
if (inout != true)
{	
	//Map to Place on Top of Old Room
	switch (newRoom)
	{
		//Woods not included (except for entrance) because they use fade trans//
		
		case Rwoodsentrance:
			vert = 0;
			horz = -1;
			mapIndex = 3;
		break;
		
		case Rbridge:
			switch (oldRoom)
			{
				case Rwoodsentrance:
					vert = 0;
					horz = 1;
					mapIndex = 2;
				break;
				
				case Routboardedhouse:
					vert = 0;
					horz = -1;
					mapIndex = 4;
				break;
			}
		break;
		
		case Routboardedhouse:
			switch (oldRoom)
			{
				case Rbridge:
					vert = 0;
					horz = 1;
					mapIndex = 3;
				break;
				
				case Rladder:
					vert = -1;
					horz = 0;
					mapIndex = 9;
				break;
			}
		break;
		
		case Routcoffeehouse:
			vert = 0;
			horz = -1;
			mapIndex = 9;
		break;
		
		case Rladder:
			switch (oldRoom)
			{
				case Routcoffeehouse:
					vert = 0;
					horz = 1;
					mapIndex = 8;
				break;
				
				case Routboardedhouse:
					vert = 1;
					horz = 0;
					mapIndex = 4;
				break;
				
				case Routchophouse:
					vert = -1;
					horz = 0;
					mapIndex = 14;
				break;
			}
		break;
		
		case Routsidehooters:
			vert = 0;
			horz = -1;
			mapIndex = 11;
		break;
		
		case Rroadtohoots:
			switch (oldRoom)
			{
				case Routsidehooters:
					vert = 0;
					horz = 1;
					mapIndex = 10;
				break;
				
				case Rpathtopond:
					vert = -1;
					horz = 0;
					mapIndex = 16;
				break;
			}
		break;
		
		case Rstage:
			vert = -1;
			horz = 0;
			mapIndex = 17;
		break;
		
		case Routbighouse:
			switch (oldRoom)
			{
				case Rbeforeneighborhood:
					vert = -1;
					horz = 0;
					mapIndex = 18;
				break;
				
				case Routchophouse:
					vert = 0;
					horz = -1;
					mapIndex = 14;
				break;
			}
		break;
		
		case Routchophouse:
			switch (oldRoom)
			{
				case Routbighouse:
					vert = 0;
					horz = 1;
					mapIndex = 13;
				break;
				
				case Rladder:
					vert = 1;
					horz = 0;
					mapIndex = 9;
				break;
			}
		break;
		
		case Rfroggyhouse:
			//Do this after minigame setup//
		break;
		
		case Rpathtopond:
			switch (oldRoom)
			{
				case Rroadtohoots:
					vert = 1;
					horz = 0;
					mapIndex = 11;
				break;
				
				case Rinbetween:
					vert = 0;
					horz = -1;
					mapIndex = 17;
				break;
			}
		break;
		
		case Rinbetween:
			switch (oldRoom)
			{
				case Rpathtopond:
					vert = 0;
					horz = 1;
					mapIndex = 16;
				break;
				
				case Rstage:
					vert = 1;
					horz = 0;
					mapIndex = 12;
				break;
				
				case Rbeforeneighborhood:
					vert = 0;
					horz = -1;
					mapIndex = 18;
				break;
			}
		break;
		
		case Rbeforeneighborhood:
			switch (oldRoom)
			{
				case Rinbetween:
					vert = 0;
					horz = 1;
					mapIndex = 17;
				break;
				
				case Routbighouse:
					vert = 1;
					horz = 0;
					mapIndex = 13;
				break;
				
				case Rneighborhood:
					vert = 0;
					horz = -1;
					mapIndex = 19;
				break;
			}
		break;
		
		case Rneighborhood:
			vert = 0;
			horz = 1;
			mapIndex = 18;
		break;
	}
	
	//Map to Place on Top of New Room
	switch (newRoom)
	{
		case Routbearhouse: newMapIndex = 0; break;
		
		case Rlostwoods: newMapIndex = 1; break;
		
		case Rwoodsentrance: newMapIndex = 2; break;
		
		case Rbridge: newMapIndex = 3; break;
		
		case Routboardedhouse: newMapIndex = 4; break;
		
		case Rwoodscanyon: newMapIndex = 5; break;
		
		case Rwoodsslope: newMapIndex = 6; break;
		
		case Rwoodsaftergate: newMapIndex = 7; break;
		
		case Routcoffeehouse: newMapIndex = 8; break;
		
		case Rladder: newMapIndex = 9; break;
		
		case Routsidehooters: newMapIndex = 10; break;
		
		case Rroadtohoots: newMapIndex = 11; break;
		
		case Rstage: newMapIndex = 12; break;
		
		case Routbighouse: newMapIndex = 13; break;
		
		case Routchophouse: newMapIndex = 14; break;
		
		case Rfroggyhouse: 
			//do this after minigame set up//
		break;
		
		case Rpathtopond: newMapIndex = 16; break;
		
		case Rinbetween: newMapIndex = 17; break;
		
		case Rbeforeneighborhood: newMapIndex = 18; break;
		
		case Rneighborhood: newMapIndex = 19; break;
	}
}
//show_debug_message("trans type: " + string(trans_type));
switch (trans_type)
{
	#region fade
	
		case "fade":
			//Fade Transisiton
			sprite_index = Spixel;
			if (room != newRoom)
			{
				if (instance_exists(Oplayer))
					Oplayer.state = PlayerStateLocked;
				fadeLevel += fadeSpd;
				if (fadeLevel >= 1)
				{
					if (instance_exists(Oplayer))
					{
						Oplayer.x = newX;
						Oplayer.y = newY;
					}

				}
			} else fadeLevel -= fadeSpd;

			if (fadeLevel <= 0)
			{ 
				if (instance_exists(Oplayer))
					Oplayer.state = PlayerStateFree; 
				global.transitioning = false;
				instance_destroy();
			}

		break;
	
	#endregion
	
	#region map
	
		case "map":
			sprite_index = noone;

			//Map Transistion
				if (room != newRoom)
				{	
					if (instance_exists(Oplayer)){ Oplayer.state = PlayerStateLocked; }
					//gather data from characters in oldRoom
					if (oldChars != undefined)
					{
						for (var i = 0; i < array_length(oldChars); i++)
						{
							if (instance_exists(oldChars[i]))
							{
								var _oldChars_data = {
									obj: oldChars[i].object_index,
									x: oldChars[i].x,
									y: oldChars[i].y,
									spr_index: oldChars[i].sprite_index,
									img_index: oldChars[i].image_index,
									depth: oldChars[i].depth,
								}
								array_push(oldChars_data_array, _oldChars_data);
							}
						}
					}
					if (instance_exists(Oplayer))
					{
						var _playerChar_data = {
							obj: Oplayer.object_index,
							x: newX,
							y: newY,
							spr_index: Oplayer.sprite_index,
							img_index: Oplayer.image_index,
						}
						array_push(oldChars_data_array, _playerChar_data);
					}
					if (instance_exists(Otrojandeer))
					{
						var _trojandeerChar_data = {
							obj: Otrojandeer.object_index,
							x: newX,
							y: newY,
							spr_index: Otrojandeer.sprite_index,
							img_index: Otrojandeer.image_index,
						}
						array_push(oldChars_data_array, _trojandeerChar_data);
					}
				
				} else if (map_placed){
					//see which of the new chars in room have lowest depth
					if (array_length(global.char_in_room) > 0)
					{
						//gather data
						for (var c = 0; c < array_length(global.char_in_room); c++)
						{
							array_push(newChars_depth_array, global.char_in_room[c].depth);
						}
					
						//sort data
						array_sort(newChars_depth_array, false);
						//set map depth behind that character
						depth = newChars_depth_array[0] + 1;
					}
				
				
					//figure out where the camera should start
					if (camera_get_view_x(VIEW) = 0 && camera_get_view_y(VIEW) = 0 && !arrived)
					{
						var _cam_x = 0 + (160 * -horz);
						var _cam_y = 0 + (144 * -vert);
						camera_set_view_pos(VIEW, _cam_x, _cam_y);
					}
				
					//move the camera
					var _cam_x = camera_get_view_x(VIEW);
					var _cam_y = camera_get_view_y(VIEW);
				
					if (_cam_x != 0)
						_cam_x += (horz * spd);
					
					if (_cam_y != 0)
						_cam_y += (vert * spd);
					
					camera_set_view_pos(VIEW, _cam_x, _cam_y);
					camera_set_view_size(VIEW, 160, 144);
				
					arrived = (_cam_x = 0) && (_cam_y = 0);
				
					//show_debug_message("CAM X: " + string(_cam_x));
				}
		break;
	
	#endregion
	
	#region iris
	
		case "iris":
			//Iris AKA Circle Transition
			
				if ((room != newRoom || loading) && load_out = false)
				{
					//sound effects
					if (!audio_is_playing(snd_iris_exiting)){ play_sfx(snd_iris_exiting); }
				
					if (radius > 0)
					{
						if (instance_exists(Oplayer))
							Oplayer.state = PlayerStateLocked;
						if (radius - iris_speed >= 0)
						{
							iris_speed = ispd_const;
							radius -= iris_speed;
						} else {
							radius = 0;
							iris_speed = 0;
						}
					} else {
						radius = 0;
						if (newRoom = Rtitle && instance_exists(Oplayer)) global.gamePaused = false;
						if (loading)
							load_out = true;
					}
				
				
				}
				if (room = newRoom || load_out)
				{
					//sound effects
					if (!audio_is_playing(snd_iris_entering) && !iris_enter_sfx_played){ play_sfx(snd_iris_entering); iris_enter_sfx_played = true;}
				
					if (newRoom = Rtitle)
					{
						if (instance_exists(Oplayer))
						{
							Oplayer.sprite_index = Ogame.player_spr_inuse;
							Oplayer.image_index = Ogame.player_imgindex_inuse;
							instance_destroy(Oplayer);
						}
						if (instance_exists(Ocharliemouse)){ instance_destroy(Ocharliemouse); }
						if (exiting_game) game_end();

						Otitle_menu.beat = 4;
						layer_set_visible("BG", true);
						if (instance_exists(Otitle_circle))
							Otitle_circle.radius = 281;
					} 
					if (!exiting_game)
					{
						var _max_rad = 220;
						for (var i = 0; i < array_length(global.insiderooms); i++)
							if (room = global.insiderooms[i] && room != Rsubtitle)
								_max_rad = 310;
					
						if (radius < _max_rad && wait_a_frame_iris = 0)
						{
							iris_speed = ispd_const;
							//if (keyboard_check(vk_space))
								radius += iris_speed;
						} else {
							if (wait_a_frame_iris != 0)
							{
								wait_a_frame_iris--;
								exit;
							} else {
								global.transitioning = false;
								instance_destroy();
							}
						}
					}
				
				}
				//show_debug_message("radius: " + string(radius));
			
		break;
	
	#endregion
	
	#region iris fade
	//only used at end of demo at the moment
	
		case "iris fade":
			if ((room != newRoom || loading) && load_out = false)
			{
			
				if (radius > 0)
				{
					//sound effects
					if (!audio_is_playing(snd_iris_exiting)){ play_sfx(snd_iris_exiting); }
				
					if (instance_exists(Oplayer))
						Oplayer.state = PlayerStateLocked;
					if (radius - iris_speed >= 0)
					{
						iris_speed = ispd_const;
						radius -= iris_speed;
					} else {
						radius = 0;
						iris_speed = 0;
					}
				} else {
					radius = 0;
				
					if (iris_fade_start_fade)
					{
						fadeLevel += fadeSpd;
					} else {
						if (alarm[0] = -1)
							alarm[0] = start_iris_timer;
					}
				
					if (newRoom = Rtitle && instance_exists(Oplayer)) global.gamePaused = false;
					if (loading)
						load_out = true;
				}
				
				
			}
		
			if (room = newRoom || load_out)
			{
				fadeLevel -= fadeSpd;

				if (fadeLevel <= 0)
				{ 
					if (instance_exists(Oplayer))
						Oplayer.state = PlayerStateFree; 
					global.transitioning = false;
					instance_destroy();
				}	
			}
		break;
	
	#endregion

}
