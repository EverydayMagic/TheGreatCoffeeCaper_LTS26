var _player = Oplayer;
if (!instance_exists(Oplayer) && instance_exists(Ohoots_cutscene)){ _player = Ohoots_cutscene; }
if (!instance_exists(Oplayer) && !instance_exists(Ohoots_cutscene) && instance_exists(Otrojandeer)){ _player = Otrojandeer; }
if (!global.cutsceneActive && instance_exists(_player))
{

	if (trans_type = "map")
	{
		if (check = x){ player_check = _player.x; } else { player_check = _player.y; }

		//checking if we are moving
		for (var i = 0; i < array_length(global.movement_controls); i++)
		{
			var _moving = false;
			if (global.movement_controls[i])
			{
				_moving = true;
				break;
			}
		}
		_moving = true;
		
		var _player_dir = (_player.direction  < (dir_needed + 90)) && (_player.direction > (dir_needed - 90))
		if (_player.direction = 315 && dir_needed = 0)//South East
		{
			_player_dir = (_player.direction < (360 + 90)) && (_player.direction > (270))
		}
		var _player_past = (_player.x > room_width || _player.x < 0) || (_player.y > room_height || _player.y < 0)
		var _touching = place_meeting(x, y, _player);	


		if (((check = player_check || _player_past) && _touching) && !instance_exists(Ofade) && _moving && _player_dir)
		{
			if (Ocluehunt.cluehunt_active)
			{
				//go back to old music
				set_song_ingame(Oaudio_manager.oldSongAssetString_justsong, 0, 0, 0, true, noone, false, false, false, true);
				
				Ocluehunt.cluehunt_active = false;
				global.transitioning = true;
				exit;
			}
			global.transitioning = true;
			
			warp = instance_create_depth(x, y, depth -999, Ofade);
	
			if (player_check = _player.x)
			{
				warp.newY = _player.y;
				warp.newX = _player.x + (160 * -image_xscale);
			} else {
				warp.newY = _player.y + (144 * -image_yscale);
				warp.newX = _player.x;
			}
			warp.newRoom = dest;
			warp.oldRoom = room;
			if (array_length(global.char_in_room) > 0){ warp.oldChars = global.char_in_room; }
			warp.inout = inout;
			warp.trans_type = trans_type;
			warp.party_dir = party_dir;
	
			if (room = Rwoodshop && roofblock)
				Oladder.onroof = true;
			if (room = Routchophouse)
				Oladder.onroof = false;
		}
	} else {
		if (place_meeting(x, y, _player) && !instance_exists(Ofade))
		{
			if (Ocluehunt.cluehunt_active)
			{
				//go back to old music
				set_song_ingame(Oaudio_manager.oldSongAssetString_justsong, 0, 0, 0, true, noone, false, false, false, true);
				
				Ocluehunt.cluehunt_active = false;
				global.transitioning = true;
				exit;
			}
			
			global.transitioning = true;
			
			warp = instance_create_depth(x, y, depth -999, Ofade);
		
			warp.newY = target_y;
			warp.newX = target_x;
			warp.newRoom = dest;
			warp.oldRoom = room;
			if (array_length(global.char_in_room) > 0){ warp.oldChars = global.char_in_room; }
			warp.inout = inout;
			warp.trans_type = trans_type;
			warp.party_dir = party_dir;
	
			if (room = Rwoodshop && roofblock)
				Oladder.onroof = true;
			if (room = Routchophouse)
				Oladder.onroof = false;
		}
	}


}



//show_debug_message("check: " + string(check));
//show_debug_message("dirneeded: " + string(dir_needed));