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
		if (!instance_exists(Ofade))
		{
			//move towards party point
			goTo_partypoint();
		}
	}
	
	//change sprite based on direction headed
	partypoint_changespr();
	
	//if there is an iris transition, change sprite and pos accordingly
	partypoint_irischange()
}

//show_debug_message("Mouse VIS: " + string(visible));
//show_debug_message("Mousedepth: " + string(depth));
//show_debug_message("Mouse Sprite: " + string(sprite_index));
//show_debug_message("Hootsdepth: " + string(Oplayer.depth));
//show_debug_message("Mouse Sprite: " + string(sprite_index));
//show_debug_message("Mouse X: " + string(x) + " Mouse Y: " + string(y));
//show_debug_message("updepth: " + string(up_depth));