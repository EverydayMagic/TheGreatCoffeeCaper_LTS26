if (cluehunt_active)
{
	//spin and pull out mglass
	if (!firsttimemenonosnotmyfirsttime)
	{
		if (global.playerIdle != Splayer_mglass_idle && global.playerIdle != Splayer_nocap_mglass_idle)
		{
			if (global.playerIdle = Splayer_capidle)
			{
				//if (instance_exists(Oplayer))
				//	depth = Oplayer.depth;
				switch (beat)
				{
					case 1:
						draw_sprite(Splayer_capspin, spr_index, player_x, player_y);
						if (instance_exists(Oplayer))
						{
							Oplayer.visible = false;
							instance_deactivate_object(Oplayer);
						}
					break;
					case 2:
						draw_sprite(Splayer_capspin, spr_index, player_x, player_y);
					break;
					case 3:
						draw_sprite(Splayer_mglass_idle, spr_index, player_x, player_y);
					break;
				}
			} else {
				switch (beat)
				{
					case 1:
						draw_sprite(Splayer_nocapspin, spr_index, player_x, player_y);
						if (instance_exists(Oplayer))
						{
							Oplayer.visible = false;
							instance_deactivate_object(Oplayer);
						}
					break;
					case 2:
						draw_sprite(Splayer_nocapspin, spr_index, player_x, player_y);
					break;
					case 3:
						draw_sprite(Splayer_nocap_mglass_idle, spr_index, player_x, player_y);
					break;
				}
			}
		}
	}
	
	//sailor moon it and pull out mglass
	if (firsttimemenonosnotmyfirsttime = true)
	{
		
		switch (beat)
		{
			case 0:
				if (global.playerIdle = Splayer_capidle){ draw_sprite(Splayer_caphoist, spr_index, player_x, player_y); } else { draw_sprite(Splayer_nocaphoist, spr_index, player_x, player_y); }
				if (instance_exists(Oplayer))
				{
					Oplayer.visible = false;
					instance_deactivate_object(Oplayer);
				}
			break;
			
			case 1:
			
				if (mglass_y_mod > -30)
				{
					mglass_y_mod -= (30/FRAME_RATE) * 4;
					spr_index = 0;
				} else spr_index += 5/FRAME_RATE;
				
				if (global.playerIdle = Splayer_capidle)
					draw_sprite(Splayer_caphoist, sprite_get_number(Splayer_caphoist) - 1, player_x, player_y);
				else
					draw_sprite(Splayer_nocaphoist, sprite_get_number(Splayer_nocaphoist) - 1, player_x, player_y);
					
				draw_sprite(Scluehunt_mglass_sparkle, spr_index, player_x, player_y + mglass_y_mod);
			break;
			
			case 2:
				spr_index += 5/FRAME_RATE;
				if (global.playerIdle = Splayer_capidle){ draw_sprite(Splayer_capspin, spr_index, player_x, player_y); } else { draw_sprite(Splayer_nocapspin, spr_index, player_x, player_y); } 
				
				if (mglass_y_mod < 0)
				{
					mglass_y_mod += (30/FRAME_RATE) * 1;
					draw_sprite(Scluehunt_mglass_sparkle, spr_index, player_x, player_y + mglass_y_mod);
				}
			break;
		
			case 3:
				if (round(spr_index) mod 3 != 1)
				{
					spr_index += 5/FRAME_RATE;	
					if (global.playerIdle = Splayer_capidle){ draw_sprite(Splayer_capspin, spr_index, player_x, player_y); } else { draw_sprite(Splayer_nocapspin, spr_index, player_x, player_y); } 
				} else {
					if (global.playerIdle = Splayer_capidle){ draw_sprite(Splayer_mglass_idle, 0, player_x, player_y); } else { draw_sprite(Splayer_nocap_mglass_idle, 0, player_x, player_y); }
				}
			break;
			
			case 4:
				if (global.playerIdle = Splayer_capidle){ draw_sprite(Splayer_mglass_idle, 0, player_x, player_y); } else { draw_sprite(Splayer_nocap_mglass_idle, 0, player_x, player_y); }
			break;
			
			case 5:
				if (global.playerIdle = Splayer_capidle){ draw_sprite(Splayer_mglass_idle, 0, player_x, player_y); } else { draw_sprite(Splayer_nocap_mglass_idle, 0, player_x, player_y); }
			break;
			
			case 6:
				if (global.playerIdle = Splayer_capidle){ draw_sprite(Splayer_mglass_idle, 0, player_x, player_y); } else { draw_sprite(Splayer_nocap_mglass_idle, 0, player_x, player_y); }
			break;
			
			case 7:
				if (global.playerIdle = Splayer_capidle || global.playerIdle = Splayer_mglass_idle)
					draw_sprite(Splayer_mglass_idle, 0, player_x, player_y);
				else
					draw_sprite(Splayer_nocap_mglass_idle, 0, player_x, player_y);
			break;
			
		}
	}
	
}

if (trans_to_battle)
{
	switch (beat)
	{
		case 0:
			var _hoots = Oplayer;
			if (!instance_exists(_hoots))
			{
				if (instance_exists(Ohoots_cutscene))
					_hoots = Ohoots_cutscene;
				else
					_hoots = noone;
			}
			//"!" bubble
			if (_hoots != noone)
				draw_sprite(Stxt_bubble, 5, _hoots.x, _hoots.y - 16);
		break;
		
		case 1:
			if (mglass_xscale >= 6)
				room_goto(Rcluebattle);
			//mglass transition
			draw_sprite_ext(Smglass_battle, mglass_index, camera_get_view_width(VIEW)/2, camera_get_view_height(VIEW)/2, mglass_xscale, mglass_yscale, mglass_rot, c_white, 1);
		break;
		
		case 2:
			//mglass transition
			draw_sprite_ext(Smglass_battle, mglass_index, camera_get_view_width(VIEW)/2, camera_get_view_height(VIEW)/2, mglass_xscale, mglass_yscale, mglass_rot, c_white, 1);
		break;
		
		case 3:
			//mglass transition
			draw_sprite_ext(Smglass_battle, mglass_index, camera_get_view_width(VIEW)/2, camera_get_view_height(VIEW)/2, mglass_xscale, mglass_yscale, mglass_rot, c_white, 1);
		break;
		
		case 4:
			//draw nothing
		break;
		
	}
}

if (bug_trans)
{
	switch (beat)
	{
		case 0:
			var _hoots = Oplayer;
			if (!instance_exists(_hoots))
			{
				if (instance_exists(Ohoots_cutscene))
					_hoots = Ohoots_cutscene;
				else
					_hoots = noone;
			}
			//"!" bubble
			if (_hoots != noone)
				draw_sprite(Stxt_bubble, 5, _hoots.x, _hoots.y - 16);
		break;
		case 1:
			var _hoots = Oplayer;
			if (!instance_exists(_hoots))
			{
				if (instance_exists(Ohoots_cutscene))
					_hoots = Ohoots_cutscene;
				else
					_hoots = noone;
			}
			//"!" bubble
			if (_hoots != noone)
				draw_sprite(Stxt_bubble, 5, _hoots.x, _hoots.y - 16);
		break;
	}
}











