
///@param _type
function start_clue_battle(){
	
	if (array_length(battle_minigame_order_data) <= 0)
	{
		fill_clue_battle();
		exit;
	}
	
	var _battle_data = battle_minigame_order_data[battle_minigame_step];
	
	var _scale = 2;
	
	if (string_starts_with(battle_minigame_order[battle_minigame_step], "maze"))
	{
		_scale = 1;		
	}
	
	if (instance_exists(Omglass))
	{
		Omglass.image_xscale = _scale;
		Omglass.image_yscale = _scale;
	}
	
	//create sparks
	for (var si = 0; si < array_length(_battle_data.enemies); si++)
	{
		with (instance_create_layer(_battle_data.enemies[si].x, _battle_data.enemies[si].y, "Instances", Ospark_enemy))
		{
			//class = _battle_data.enemies[si].class;
			//emotion = _battle_data.enemies[si].emotion;
			image_xscale = _scale;
			image_yscale = _scale;
			
			array_push(Ocluebattle_manager.spark_ids, self.id);
		}
	}
	
	#region sprite assets to use for obs and dec
			
		//room obstacle asset "packages" (what sprites for obstacles each room is allowed to use)
		var _default_outdoors_obs_package = [
			Sbattle_obs_gblade_big,
			Sbattle_obs_leaf,
			Sbattle_obs_rock,
		]
		var _coffee_indoors_obs_package = [
			Sbattle_obs_coffeecup,
		]
		var _hoots_indoors_obs_package = [
			Sbattle_obs_book,
		]
		//rooms decoration "package"
		var _default_outdoors_dec_package = [
			Sbattle_dec_gblade_small,
			Sbattle_dec_mushroom,
			Sbattle_dec_rock_small,
		]
		var _coffee_indoors_dec_package = [
			Sbattle_dec_cbean,
		]
		//rooms that each package is associated with
		var _rooms_default_outdoors_obs_package = [
			Rneighborhood,
			Routbighouse,
			Routchophouse,
			Routcoffeehouse,
			Routsidehooters,
			Rbeforeneighborhood,
			Rinbetween,
			Rladder,
			Rpathtopond,
			Rroadtohoots,
			Rstage,
		]
		var _rooms_coffee_indoors_obs_package = [
			Rcoffeecloset,
			Rcoffeeshop,
		]
		var _rooms_hoots_indoors_obs_package = [
			Rhooters,
			Rhooterscloset,
		]
		//find what room we're in and assign the proper asset package to use
		var _obs_package_using = -1;
		var _dec_package_using = -1;
		var _room = Ocluehunt.old_room;
		
		for (var o = 0; o < array_length(_rooms_default_outdoors_obs_package); o++)
		{
			if (_room = _rooms_default_outdoors_obs_package[o])
			{
				_obs_package_using = _rooms_default_outdoors_obs_package;	
				_dec_package_using = _default_outdoors_dec_package;
			}
		}
		for (var c = 0; c < array_length(_rooms_coffee_indoors_obs_package); c++)
		{
			if (_room = _rooms_coffee_indoors_obs_package[c])
			{
				_obs_package_using = _coffee_indoors_obs_package;
				_dec_package_using = _coffee_indoors_dec_package;
			}
		}
		for (var h = 0; h < array_length(_rooms_hoots_indoors_obs_package); h++)
		{
			if (_room = _rooms_hoots_indoors_obs_package[h])
			{
				_obs_package_using = _hoots_indoors_obs_package;
				_dec_package_using = _hoots_indoors_obs_package;
			}	
		}
		if (_obs_package_using = -1){ _obs_package_using = _default_outdoors_obs_package; } //failsafe
		if (_dec_package_using = -1){ _dec_package_using = _default_outdoors_dec_package; } //failsafe
			
	#endregion
	
	//create obstacles
	for (var oi = 0; oi < array_length(_battle_data.obstacles); oi++)
	{
		with (instance_create_layer(_battle_data.obstacles[oi].x, _battle_data.obstacles[oi].y, "Instances", Ocluebattle_obstacle))
		{
			sprite_index = _obs_package_using[irandom((array_length(_obs_package_using) - 1))];
			image_index = irandom((image_number - 1));
			image_xscale = _scale;
			image_yscale = _scale;
		}
	}
	
	//create decorations
	if (variable_struct_exists(_battle_data, "decorations"))
	{
		for (var di = 0; di < array_length(_battle_data.decorations); di++)
		{
			with (instance_create_layer(_battle_data.decorations[di].x, _battle_data.decorations[di].y, "Instances", Ocluebattle_decoration))
			{
				sprite_index = _dec_package_using[irandom((array_length(_dec_package_using) - 1))];
				image_index = irandom((image_number - 1));
				image_xscale = _scale;
				image_yscale = _scale;
			}
		}
	}
	
	//create runaway points
	show_debug_message("runaways: " + string(_battle_data.runaways));
	for (var ri = 0; ri < array_length(_battle_data.runaways); ri++)
	{
		with (instance_create_layer(_battle_data.runaways[ri].x, _battle_data.runaways[ri].y, "Instances", Ospark_pathpoint))
		{
			image_xscale = _scale;
			image_yscale = _scale;
		}
	}
	
	
	#region old
	/*
	var _battle_data = 
		{
			enemies: global.enemies,
			obstacles: global.obstacles,
			decoration: global.decoration,
			coolspots: global.coolspots,
			runawayspots: global.runawayspots,
		}
		
	if (is_struct(_battle_data))
	{
		///////////////
		//ENEMIE DATA//
		///////////////
			for (var i = 0; i < array_length(_battle_data.enemies); i++)
			{
				with (instance_create_depth(0, 0, Omglass.depth, Ospark_enemy))
				{
					x = _battle_data.enemies[i].x;
					y = _battle_data.enemies[i].y;
					class = _battle_data.enemies[i].class;
					emotion = _battle_data.enemies[i].emotion;
					
					Ocluebattle_manager.spark_ids[i] = self.id;			
				}
			}
		
		/////////////////
		//OBSTACLE DATA//
		/////////////////
			for (var c = 0; c < array_length(_battle_data.obstacles); c++)
			{
				with (instance_create_depth(0, 0, Omglass.depth, Ocluebattle_obstacle))
				{
					x = _battle_data.obstacles[c].x;
					y = _battle_data.obstacles[c].y;
					sprite_index = _battle_data.obstacles[c].sprite_index;
					image_index = _battle_data.obstacles[c].image_index;
					
					//add to mp grid
					mp_grid_add_instances(Ocluebattle_manager.clue_battle_grid, self.id, true);
					
					//change mask index after mp grid
					///so that sparks still go around
					mask_index = _battle_data.obstacles[c].mask_index;
					
					uni_col = instance_create_depth(0, 0, 0, Ocluebattle_obs_uni_col);
					var _id = self.id;
					with (uni_col){ parent = _id; }
				}
				
			}
		
		///////////////////
		//DECORATION DATA//
		///////////////////
			for (var d = 0; d < array_length(_battle_data.decoration); d++)
			{
				with (instance_create_depth(0, 0, Omglass.depth + 1, Ocluebattle_decoration))
				{
					x = _battle_data.decoration[d].x;
					y = _battle_data.decoration[d].y;
					sprite_index = _battle_data.decoration[d].sprite_index;
					image_index = _battle_data.decoration[d].image_index;
					decoration = true;
				}
			}
			
			
		/////////////////
		//COOLSPOT DATA//
		/////////////////
			for (var g = 0; g < array_length(_battle_data.coolspots); g++)
			{
				with (instance_create_depth(0, 0, Omglass.depth, Ocluebattle_coolspot))
				{
					x = _battle_data.coolspots[g].x;
					y = _battle_data.coolspots[g].y;
				}
			}
		
		/////////////////////
		//RUNAWAYSPOT DATA//
		/////////////////////
			for (var f = 0; f < array_length(_battle_data.runawayspots); f++)
			{
				with (instance_create_layer(0, 0, "Instances", Ospark_pathpoint))
				{
					x = _battle_data.runawayspots[f].x;
					y = _battle_data.runawayspots[f].y;
				}
			}
		
	}
	
	create_battle_insts = false;
	battle_started = true;
	*/
	#endregion
}