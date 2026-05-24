if (room = Rbattle || !instance_exists(Oplayer))
	exit;

//check if we have a story-related scripted clue hunt happening
if (!scripted_footssplaced && !global.cutsceneActive)
	scripted_cluehunt = check_scriptcluehunt(room);

//////////////////////////
//FOR SCRIPTED CLUEHUNTS//
//////////////////////////
	if (scripted_cluehunt)
	{
		//place footprints
		if (!scripted_footssplaced)
		{
			for (var f = 0; f < array_length(global.scripted_print_data); f++)
			{
				with (instance_create_depth(0, 0, Oplayer.depth + 1, Ocluesteps))
				{
					
					class = global.scripted_print_data[f].class;
					var _footpos_mod = 0;
					if (class = "footprint"){ _footpos_mod = 8; }
					x = global.scripted_print_data[f].x + _footpos_mod;	
					y = global.scripted_print_data[f].y + _footpos_mod;
					if (class = "footprint")
					{
						image_angle = global.scripted_print_data[f].image_angle;
						image_index = choose(0, 1);
						num = instance_number(Ocluesteps);
					} else {
						subclass = global.scripted_print_data[f].subclass;
						item = global.scripted_print_data[f].item;
						if (subclass = "bug")
						{
							x = global.scripted_print_data[f].x;	
							y = global.scripted_print_data[f].y;
							if (variable_struct_exists(global.scripted_print_data[f], "bug_x"))
							{
								bug_x = global.scripted_print_data[f].bug_x;			
							}
							if (variable_struct_exists(global.scripted_print_data[f], "bug_y"))
							{
								bug_y = global.scripted_print_data[f].bug_y;			
							}
							if (variable_struct_exists(global.scripted_print_data[f], "dir_needed"))
							{
								dir_needed = global.scripted_print_data[f].dir_needed;	
							}
						}
					}
				}
				if (f + 1 >= array_length(global.scripted_print_data))
					scripted_footssplaced = true;
			}
		}
	}


/////////////////////////
//FOR RANDOM ENCOUNTERS//
/////////////////////////
	if (scripted_cluehunt){ exit; }
	exit;
	//update tile maps
	natureMap = layer_tilemap_get_id(layer_get_id("Nature"));
	treeMap = layer_tilemap_get_id(layer_get_id("Trees"));
	treeLowerMap = layer_tilemap_get_id(layer_get_id("Lower_TreeTop"));
	treeBelowMap = layer_tilemap_get_id(layer_get_id("TreesBelow"));
	buildingHereMap = layer_tilemap_get_id(layer_get_id("BuildingHere"));


	//placing sparks for "random encounter" battles
	if (!spark_placed)
	{
		//determine whether or not a spark is going to be placed
		var _checkrm = false;
		for (var i = 0; i < array_length(global.insiderooms) - 1; i++)
		{
			if (room != global.insiderooms[i])
				_checkrm = true;
			else { _checkrm = false; break; }
		}
		if (_checkrm && diced_it = false)
			dice = irandom_range(0, 0);

		if (dice = dice_target)
		{
			//determine where spark should be
				//x and y of spark
					x = possible_x[irandom_range(0, array_length(possible_x) - 1)];
					y = possible_y[irandom_range(0, array_length(possible_y) - 1)];

		
				//see if we are placing on a grass tile (to avoid placing on a tree or etc)
					tile_pix_array = [
				
					[tilemap_get_at_pixel, [treeMap, x, y] ],
					[tilemap_get_at_pixel, [treeLowerMap, x, y]],
					[tilemap_get_at_pixel, [treeBelowMap, x, y]],
					[tilemap_get_at_pixel, [buildingHereMap, x, y]],
				
					]
				
					for (var q = 0; q < array_length(tile_pix_array); q++)
					{
						var	_check_tile_array = tile_pix_array[q];
						if (is_array(_check_tile_array))
							if ((script_execute_ext(_check_tile_array[0], _check_tile_array[1]) != -1))
							{
								var _check_tile = script_execute_ext(_check_tile_array[0], _check_tile_array[1]);
							
								if (tile_get_empty(_check_tile))
								{
									all_empty = true;
								} else {
									all_empty = false;
									break;
								}
							}
					}
						
					var _tile_pix_nature = tilemap_get_at_pixel(natureMap, x, y);
			
					if (_tile_pix_nature = 4 || _tile_pix_nature = 23 || _tile_pix_nature = 24 || _tile_pix_nature = 34 || _tile_pix_nature = 44 || _tile_pix_nature = 43 || _tile_pix_nature = 33 || _tile_pix_nature = 23)
					{
						if (all_empty)
						{
							if (instance_exists(Oplayer))
							{
								with (instance_create_depth(x, y, Oplayer.depth + 1, Ocluesteps))
								{
									visible = false;
									//set the class of the clue to be spark
										class = "spark";
									//set the subclass of the clue to be something random
										subclass = global.item_list.screw;
										sprite_index = Scluespark;
						
									Ocluesteps_manager.footprint_id[0] = self.id;
								}
								spark_placed = true;
								diced_it = false;
					
							}
						} else diced_it = true;
			
					} else {
						//this is if the dice rolled correctly in the room start but didnt place spark because it didn't find good tile
						diced_it = true;
					}
				
		}
	}


	//placing footprints
	if (spark_placed)
	{
		var _inst_num = instance_number(Ocluesteps) - 1;
	
		if (_inst_num <= 8 && !instance_exists(Ofade))
		{
		
		//check to see what directions are allowed	
			for (var i = 0; i <= 3; i++)
			{
				var _negpos_x = 0;
				var _negpos_y = 0;
		
				//for x
					if (i = 1 || i = 3)
					{
						_negpos_x = 0;	
					} else {
						if (i = 0){ _negpos_x = 1; }
						if (i = 2){ _negpos_x = -1; }
					}
				//for y
					if (i = 0 || i = 2)
					{
						_negpos_y = 0;	
					} else {
						if (i = 3){ _negpos_y = 1; }
						if (i = 1){ _negpos_y = -1; }
					}
		
			
				var _x = x + (16 * _negpos_x);
				var _y = y + (16 * _negpos_y);
			
				tile_pix_array = [
				
				[tilemap_get_at_pixel, [treeMap, _x, _y] ],
				[tilemap_get_at_pixel, [treeLowerMap, _x, _y] ],
				[tilemap_get_at_pixel, [treeBelowMap, _x, _y] ],
				[tilemap_get_at_pixel, [buildingHereMap, _x, _y] ],
				
				]
			
				for (var q = 0; q < array_length(tile_pix_array); q++)
				{
					var	_check_tile_array = tile_pix_array[q];
					if (is_array(_check_tile_array))
						if ((script_execute_ext(_check_tile_array[0], _check_tile_array[1]) != -1))
						{
							var _check_tile = script_execute_ext(_check_tile_array[0], _check_tile_array[1]);
							
							if (tile_get_empty(_check_tile))
							{
								all_empty = true;
							} else {
								all_empty = false;
								break;
							}
						}
				}
			
				var _tile_at_pix_nature = tilemap_get_at_pixel(natureMap, _x, _y);
		
				if (_tile_at_pix_nature = 4 || _tile_at_pix_nature = 23 || _tile_at_pix_nature = 24 || _tile_at_pix_nature = 34 || _tile_at_pix_nature = 44 || _tile_at_pix_nature = 43 || _tile_at_pix_nature = 33 || _tile_at_pix_nature = 23)
				{
					if (all_empty)
						check_dir[i] = true;
					else 
						check_dir[i] = false;
				} else check_dir[i] = false;
			
			
			
				if (check_dir[i] = true && _inst_num > 0)
				{
					for (var u = 0; u < array_length(Ocluesteps_manager.footprint_id); u++)
					{
						if (((_x + 8) = footprint_id[u].x && (_y + 8) = footprint_id[u].y)||(((_x + 8) = footprint_id[u].x + 8 && (_y + 8) = footprint_id[u].y + 8)))
						{
							check_dir[i] = false;
						}
					}
				}
			
			
			}
	
			for (var b = 0; b < array_length(check_dir); b++)
			{
				if (check_dir[b] = true)
				{
					if (instance_exists(Oplayer))
					{
						var _negpos_x = 0;
						var _negpos_y = 0;
		
						//for x
							if (b = 1 || b = 3)
							{
								_negpos_x = 0;	
							} else {
								if (b = 0){ _negpos_x = 1; }
								if (b = 2){ _negpos_x = -1; }
							}
						//for y
							if (b = 0 || b = 2)
							{
								_negpos_y = 0;	
							} else {
								if (b = 3){ _negpos_y = 1; }
								if (b = 1){ _negpos_y = -1; }
							}
					
						var _x = x + (16 * _negpos_x);
						var _y = y + (16 * _negpos_y);
					
						with (instance_create_depth(_x + 8, _y + 8, Oplayer.depth + 1, Ocluesteps))
						{
							class = "footprint";
							subclass = "default print";
						
							sprite_index = Scluepaws_default;
						
							image_angle = 0 + (90 * b);
							image_index = choose(0, 1);
							image_speed = 0;
						
							visible = Ocluehunt.cluehunt_active;

							Ocluesteps_manager.x = x - 8;
							Ocluesteps_manager.y = y - 8;
						
							num = _inst_num + 1;
						
							Ocluesteps_manager.footprint_id[num] = self.id;
						
						}
					
						break;
					}
				}
			}
		}
	
	}




	//show_debug_message("x: " + string(x) + " y: " + string(y)); 







