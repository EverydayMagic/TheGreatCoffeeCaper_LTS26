//Following
//show_debug_message("xprev: " + string(xprevious));
//show_debug_message("yprev: " + string(yprevious));

depth = -y;

var _player = Oplayer;
if (!instance_exists(Oplayer))
{
	if (instance_exists(Ohoots_cutscene))
	{
		_player = Ohoots_cutscene;	
	}
}

if (instance_exists(_player) && !global.cutsceneActive)
{
	if (instance_exists(Opartypoint))
	{
		if (!instance_exists(Ofade) && !waitforinput)
		{
			if (_player = Oplayer && Oplayer.state != PlayerStateRun)
			{
				//move towards party point
				goTo_partypoint();
				
			} else {
				switch (Oplayer.beat)
				{
					case 0:
						//move toward player pos
						if (!instance_exists(Omulti_goto))
						{
							var _x = x;
							var _y = y;
							with (instance_create_depth(0, 0, 0, Omulti_goto))
							{
								object = Ocharliemouse;
								origin_x = _x;
								origin_y = _y;
								x_pos = [Oplayer.x];
								y_pos = [Oplayer.y];
								spd = 3;
							}
						} else if (x = Oplayer.x && y = Oplayer.y) {
							while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
							x = Oplayer.x;
							y = Oplayer.y;
							sprite_index = Scmouse_idle;
							image_index = round(Oplayer.direction/90);
							image_speed = 0;
						}
					break;
					case 1:
						while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
						x = Oplayer.x;
						y = Oplayer.y;
						sprite_index = Scmouse_idle;
						image_index = round(Oplayer.direction/90);
						image_speed = 0;
						visible = false;
					break;
				}
			}
		}
	}
	
	//change sprite based on direction headed
	partypoint_changespr();
	
	//if there is an iris transition, change sprite and pos accordingly
	partypoint_irischange();
}

if (waitforinput)
{
	if (InputPressed(INPUT_VERB.ANYMOVE)){ waitforinput = false; }
}

//show_debug_message("Mouse VIS: " + string(visible));
//show_debug_message("Mousedepth: " + string(depth));
//show_debug_message("Mouse Sprite: " + string(sprite_index));
//show_debug_message("Hootsdepth: " + string(Oplayer.depth));
//show_debug_message("Mouse Sprite: " + string(sprite_index));
//show_debug_message("Mouse X: " + string(x) + " Mouse Y: " + string(y));
//show_debug_message("updepth: " + string(up_depth));