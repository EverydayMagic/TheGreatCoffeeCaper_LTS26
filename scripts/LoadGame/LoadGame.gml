
///@param [object_to_load]
function load_game(){

	if (file_exists("tgcc" + string(global.saveslot) + ".edm"))
	{
		global.now_loading = true;
		
		var _buffer = buffer_load("tgcc" + string(global.saveslot) + ".edm");
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		try 
		{
			var _loadData = SnapFromJSON(_string);
			
		} catch (_ex) {
			//show_debug_message(_ex.message);	
		}
		
		if (is_struct(_loadData)) 
		{
			///////////////////
			//INSTANCE'S DATA//
			///////////////////
			
			for (var i = 0, _len = array_length(_loadData.instances); i < _len; i++)
			{
				var _t = array_length(_loadData.instances);
				var _inst_string = _loadData.instances[i].object;
				var _inst = asset_get_index(_inst_string);
				if (argument_count > 0)
				{
					while (_inst != argument[0])
					{
						i++;
						//update inst
						_inst_string = _loadData.instances[i].object;
						_inst = asset_get_index(_inst_string);
					}
					_len = i;
					_inst = argument[0];	
					
				}
				
				
					/////////////////////
					//INSTANCES IN ROOM//
					/////////////////////
					
					if (argument_count <= 0)
					{
						for (var q = 0, _length = array_length(_loadData.in_room); q < _length; q++)
						{
							var _obj_string = _loadData.in_room[q];
							var _obj = asset_get_index(_obj_string);
							
							if (_obj = Oplayer && !instance_exists(_obj))
							{
								instance_create_depth(0, 0, 100, _obj);
								room_goto(asset_get_index(_loadData.instances[0].room));
							} else if (instance_exists(Oplayer) && room != asset_get_index(_loadData.instances[0].room)) {
								room_goto(asset_get_index(_loadData.instances[0].room));
							}
							
							if (_obj = Ocharliemouse && !instance_exists(_obj))
							{
								instance_create_depth(0, 0, 100, _obj);	
							}
							
							//&& _obj = _inst
							//for (var char = 0; char < array_length(global.char_list); c++)
							//{
							//	if (!instance_exists(_obj) && _obj = global.char_list[char])
							//		instance_create_depth(0, 0, 0, _obj);
							//}
							//if (_obj = Ocharliemouse)
							//{
									
							//}
						}
					}
				
					with (_inst)
					{
						switch (_inst)
						{
							case (Oplayer):
								x = _loadData.instances[i].x;
								y = _loadData.instances[i].y;
								sprite_index = asset_get_index(_loadData.instances[i].spr_index);
								image_index = _loadData.instances[i].img_index;
								depth = _loadData.instances[i].depth;
								state = _loadData.instances[i]._state;
								direction =  _loadData.instances[i].direction;
								visible = _loadData.instances[i].visible;
							break;
							
							case (Ocharliemouse):
								x = _loadData.instances[i].x;
								y = _loadData.instances[i].y;
								sprite_index = asset_get_index(_loadData.instances[i].spr_index);
								image_index = _loadData.instances[i].img_index;
								if (sprite_index = -1){ sprite_index = Scmouse_idle; }
							break;
						
							case (Odirector):
								global.story_beat = _loadData.instances[i].story_beat;
							break;
							
							case (Ogame):
								global.playerWalk = asset_get_index(_loadData.instances[i].playerWalk);
								global.playerIdle = asset_get_index(_loadData.instances[i].playerIdle);
								global.textActive = _loadData.instances[i].textActive;
								global.cutsceneActive = _loadData.instances[i].cutsceneActive;
								global.gamePaused = _loadData.instances[i].gamePaused;
								//menu_char[0] = _loadData.instances[i].menuChar0;
								//menu_char[1] = _loadData.instances[i].menuChar1;
								//menu_char[2] = _loadData.instances[i].menuChar2;
								//if (menu_char[0] > menu_char_forsave[0])
								//{
								//	menu_char_forsave[0] = menu_char[0];
								//	menu_char_forsave[1] = menu_char[1];
								//	menu_char_forsave[2] = menu_char[2];
								//} else {
								//	if (menu_char[0] < menu_char_forsave[0])
								//	{
								//		menu_char[0] = menu_char_forsave[0];
								//		menu_char[1] = menu_char_forsave[1];
								//		menu_char[2] = menu_char_forsave[2];	
								//	}
								//}
							break;
							
							case (Oitem_manager):
								//reset inventory (in case things somehow got "tangled") (there has been an issue reported for this but I can't seem to replicate it)
								if (instance_exists(Oitem_manager))
								{
									with (Oitem_manager)
									{
										for (var m = 0; m < inv_max; m++)
										{
											array_set(inv, m, global.item_list.unknown);
										}
									}
								}
							
								inv = _loadData.instances[i].inv_array;
								inv_stash = _loadData.instances[i].inv_stash_array;
								equipped = _loadData.instances[i]._equipped;
								
								//we need to update the sprites for the items already in the inventory
								var _itemvarnames = variable_struct_get_names(global.item_list);
								var _itemdata = [];
								for (var r = 0; r < array_length(_itemvarnames); r++)
								{
									array_push(_itemdata, variable_struct_get(global.item_list, _itemvarnames[r]));		
								}
								for (var e = 0; e < array_length(_itemdata); e++)
								{
									for (var ee = 0; ee < array_length(inv); ee++)
									{
										//show_debug_message(string(_itemdata[e].display_name) + " : " + string(inv[ee].name));
										if ((_itemdata[e].display_name = inv[ee].name) || (_itemdata[e].name = inv[ee].name))
										{
											inv[ee] = _itemdata[e];
											//if (_itemdata[e].display_name != "Spark Glass"){ 
										}
										//for clue timer specifically
										if (inv[ee].name = "Clue Timer" && _itemdata[e].display_name = "Stopwatch")
										{
											var _lvl = real(string_char_at(inv[ee].description, 5));
											var _stopwatch = global.item_list.clue_timer_lvl1;
											switch(_lvl)
											{
												case 2:
													_stopwatch = global.item_list.clue_timer_lvl2;
												break;
											}
											inv[ee] = _stopwatch;
										}
										//for spark glass specifically
										if (inv[ee].name = "Spark Glass" && _itemdata[e].display_name = "Spark Glass")
										{
											inv[ee] = _itemdata[e];
											//show_debug_message("inv ee: " + string(inv[ee].name));
											var _lvl = real(string_char_at(inv[ee].name, 17));
											var _mglass = global.item_list.mglass;
											//show_debug_message("lvl: " + string(_lvl));
											switch(_lvl)
											{
												case 1:
													_mglass = global.item_list.mglass_fly;
												break;
											}
											inv[ee] = _mglass;
										}
									}
									
									for (var eee = 0; eee < array_length(inv_stash); eee++)
									{
										if ((_itemdata[e].display_name = inv_stash[eee].name) || (_itemdata[e].name = inv_stash[eee].name) || (_itemdata[e].description = inv_stash[eee].description))
										{
											//when we overwrite the item data to update the sprites, it will overwrite the quantity, so we need to save it real quick
											var _quan = inv_stash[eee].quantity;
											inv_stash[eee] = _itemdata[e];
											inv_stash[eee].quantity = _quan; //give back quantity
										}		
									}
								}
								
								
								if (inv[1].display_name = "Spark Glass")
								{
									if (inv[2].display_name != "Stopwatch"){ item_add(global.item_list.clue_timer_lvl1); }
								}
							break;
							
							//case (Osubtitle_menu):
							//	charswap_index[0] = Ogame.menu_char[0];
							//	charswap_index[1] = Ogame.menu_char[1];
							//	charswap_index[2] = Ogame.menu_char[2];
							//break;
							
							case (Ocluehunt):
								cluehunt_active = _loadData.instances[i].cluehunt_active;
								firsttimemenonosnotmyfirsttime = _loadData.instances[i].firsttimemenonosnotmyfirsttime;
							break;
							
							case (Opartypoint_manager):
								pos_x = _loadData.instances[i].pos_x;
								pos_y = _loadData.instances[i].pos_y;
							break;
							
							case (Othatsinglechairthatyoupushandneverpushagain):
								x = _loadData.instances[i].x;
								
								if (Othatsinglechairthatyoupushandneverpushagain.x = 112)
								{
									with (instance_create_layer(114, 80, "Col_Broken", Ocol))
									{
										image_xscale = 1.5;
										image_yscale = 2;	
									}
								} else {
									with (instance_create_layer(98, 80, "Col_Broken", Ocol))
									{
										image_xscale = 1.5;
										image_yscale = 2;
										special = true;
									}
								}
							break;
							
						}
					}
					
					if (instance_exists(Oplayer))
						with (Oplayer) { depth = 100; }
					
			}
			
			//////////////
			//STORY DATA//
			//////////////
				//data in saveslot
					for (var o = 0, _len = array_length(_loadData.story_data); o < _len; o++)
					{
						with (Odirector)
							global.saveslot_story[global.saveslot][o] = _loadData.story_data[o];
					}
					
				//for story percentages
					for (var ii = 1; ii < 3; ii++)
					{
						if (file_exists("tgcc" + string(ii) + ".edm"))
						{
							//access story data for other save files
							var _buffer = buffer_load("tgcc" + string(ii) + ".edm");
							var _string = buffer_read(_buffer, buffer_string);
							buffer_delete(_buffer);
						
							try
							{
								var _storyData = SnapFromJSON(_string);
							} catch (_ex) {
								//show_debug_message(_ex.message);	
							}
						
							if (is_struct(_storyData))
							{
								for (var o = 0, _len = array_length(_storyData.story_data); o < _len; o++)
								{
									with (Odirector)
										global.saveslot_story[ii][o] = _storyData.story_data[o];
								}
							}
						}
					}
				
			/////////////
			//COL CHECK//
			/////////////	
				with (Oplayer)
				{		
					if (place_meeting(x, y, Ocol))
					{	
						//we don't want to spawn in on a collision block, so we need to change our position
						//cycle through rooms
						
						ResetRoomPos();
					}
				}
			
		}
		
		//show_debug_message(filename_path("coffeecaper" + string(global.saveslot) + ".edm"));
		//show_debug_message("game loaded! " + _string);
		global.now_loading = false;

	}
}