if (Ocluehunt.cluehunt_active = false || Ocluehunt.spotlighted = false)
{
	visible = false;
} else visible = true;

if (instance_exists(Oplayer))
	depth = Oplayer.depth + 10;

var _obj_to_check = [Osign];
var _obj = noone;
for (var o = 0; o < array_length(_obj_to_check); o++)
{
	_obj = instance_place(x, y, _obj_to_check[o]);	
	if (instance_exists(_obj)){ break; }
}
if (instance_exists(_obj))
{
	if (_obj.visible && class = "spark")
	{
		depth = -(y + 16);
	}
}

if (Ocluehunt.trans_to_battle = true)
{
	if (class != "spark")
	{
		visible = false;
		exit;
	} else visible = true;
}


if (class = "footprint" )
{
	//determine sprite index
		switch (subclass)
		{
			default: sprite_index = Scluepaws_default; break;
		}
		
}

if (Ocluehunt.cluehunt_active && instance_exists(Oplayer))
{
	var _pdist = abs(point_distance(x, y, Oplayer.x, Oplayer.y));
	
	if (class = "footprint")
	{
		if (_pdist <= 20)
		{
			if (!place_meeting(Oplayer.x, Oplayer.y, self))
			{
				image_alpha = (3/_pdist) * 2;
			} else image_alpha = 1;
			
		} else image_alpha = 0;
	}
	
	if (class = "spark")
	{
		_pdist = abs(point_distance(x + 8, y + 8, Oplayer.x, Oplayer.y));
		
		if (_pdist <= 24)
		{
			if (!place_meeting(x, y, Oplayer))
			{
				image_alpha = (1/_pdist) * 2;
			} else {
				
				//different behavior if bug item
				switch (subclass)
				{
					case "bug":
						if (!Ocluehunt.bug_trans){ image_alpha = 1; }
						
						//interacting with spark
						if (instance_exists(Ointeractbox))
						{
							var _facing_dir = true;
							if (dir_needed != -1) {
								var _player_dir = round(Oplayer.direction/90);
								if (!is_array(dir_needed))
								{
									if (_player_dir = dir_needed){ _facing_dir = true; } else { _facing_dir = false; }
								} else {
									//if it's an array, that means player can be multiple directions to interact
									for (var d = 0; d < array_length(dir_needed); d++)
									{
										if (_player_dir = dir_needed[d]){ _facing_dir = true; break; } else { _facing_dir = false; }	
									}
								}
							}
							
							if (place_meeting(x, y, Ointeractbox) && !instance_exists(Otextbox) && !Ocluehunt.bug_trans && _facing_dir)
							{
								Ocluehunt.bug_trans = true;
								Ocluehunt.type_to_transfer = item; //we wont be transfering to battle_manager (cause no battle)	
							}
						}
						
						if (instance_exists(item))
						{
							if (item.start_act){ instance_destroy(); }
						}
					break;
					
					default:
						image_alpha = 1;
						
						if (global.battleTutorial[0] = true && !instance_exists(Otextbox))
						{
							create_textbox("sparkfound_battletutorial");
						}
						//interacting with spark
						if (instance_exists(Ointeractbox))
						{
							var _facing_dir = true;
							if (dir_needed != -1) {
								var _player_dir = round(Oplayer.direction/90);
								if (!is_array(dir_needed))
								{
									if (_player_dir = dir_needed){ _facing_dir = true; } else { _facing_dir = false; }
								} else {
									//if it's an array, that means player can be multiple directions to interact
									for (var d = 0; d < array_length(dir_needed); d++)
									{
										if (_player_dir = dir_needed[d]){ _facing_dir = true; break; } else { _facing_dir = false; }	
									}
								}
							}
							
							if (place_meeting(x, y, Ointeractbox) && !instance_exists(Otextbox) && !Ocluehunt.bug_trans && _facing_dir)
							{
								Ocluehunt.trans_to_battle = true;
								Ocluehunt.type_to_transfer = item;
								if (array_length(mini_order) > 0){ Ocluehunt.mini_order = mini_order; }
								if (array_length(mini_order_config) > 0){ Ocluehunt.mini_order_config = mini_order_config; }
								//Ocluebattle_manager.item = subclass;
								Ocluehunt.old_room = room;
							}
						}
					break;
				}
			}
			
		} else image_alpha = 0;
		
	}
}


//Creating Dust Clouds When Player Over Footprints
if (instance_exists(Oplayer))
{
	var _inst = instance_number(Ocluesteps) - 1;
	if (num = _inst)
	{
		if ((place_meeting(x, y, Oplayer) || place_meeting(Oplayer.x, Oplayer.y, self.id)) && !Ocluehunt.cluehunt_active)
		{
			if (!instance_exists(Ocluedustcloud))
			{
				var _xmod = irandom_range(-3, 3);
				var _ymod = irandom_range(-2, 2);
				instance_create_depth(Oplayer.x + _xmod, Oplayer.y + _ymod, Oplayer.depth - 1, Ocluedustcloud);	
			}
		} else {
			if (instance_exists(Ocluedustcloud))
			{
				with (Ocluedustcloud)
				{
					instance_destroy();	
				}
			}
		}
	}
}






//show_debug_message("subclass: " + string(subclass));
//show_debug_message("item: " + string(item));

