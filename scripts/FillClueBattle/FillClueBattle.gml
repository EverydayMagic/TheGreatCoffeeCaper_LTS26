
function fill_clue_battle(){
	
	#region select what minigames are played and in what order
	
	if (array_length(battle_minigame_order) <= 0)
	{

		var _battle_pool = [
			"search_tutorial",
			//"search_easy_2",
			//"search_easy_3",
		]
	
		//how many minigames to play? (based on Spark Glass type and level)
		var _minimin = 1;
		var _minimax = 1;
		switch (Oitem_manager.inv[1].name)
		{
			case "Spark Glass LVL 0": _minimin = 1; _minimax = 1; break; //plain Spark Glass
			default: _minimin = 1; _minimax = 1; show_debug_message("SPARK GLASS TYPE NOT GIVEN"); break;
		}
		var _num_played = irandom_range(_minimin, _minimax);
	
		//select the order of the minigames
		for (var i = 0; i < _num_played; i++)
		{
			var _dice = irandom((array_length(_battle_pool) - 1));
		
			array_push(battle_minigame_order, _battle_pool[_dice]);
			
		}
	
	}
	
	#endregion
	
	#region select the configuration of each minigame in order
	
	if (array_length(battle_minigame_order_data) <= 0)
	{
		
		var _mini_list = [];
		
		for (var s = 0; s < array_length(battle_minigame_order); s++)
		{
	
			#region data for each configuration of that minigame
	
			var _mini_name = battle_minigame_order[s];
			switch (_mini_name)
			{
				#region search_tutorial
		
				case "search_tutorial":
					_mini_list = [
						{
							enemies : [ 
								{
									class: "normal",
									emotion: "normal",
									x: 128,
									y: 32,	
								},
							],
							obstacles : [
								{
									sprite_index: Sbattle_obs_rock,
									//mask_index: Sbattle_obs_book_col,
									image_index: 0,
									x: 64,
									y: 64,
								},
							],
							runaways : [
								{
									x: 192,
									y: 22,
								},
								{
									x: 202,
									y: 116,
								},
								{
									x: 250,
									y: 190,
								},
								{
									x: 140,
									y: 230,
								},
								{
									x: 56,
									y: 178,
								},
							],
						},
					]
					show_debug_message("mini list tutorial:\n" + string(_mini_list));
				break;
		
				#endregion
		
				#region search_easy_2
		
				case "search_easy_2":
					_mini_list = [
						{
							//config 1
					
							enemies : [ 
								{
									class: "normal",
									emotion: "normal",
									x: 100,
									y: 24,	
								},
								{
									class: "normal",
									emotion: "normal",
									x: 266,
									y: 152,
								},
							],
							obstacles : [
								{
									x: 62,
									y: 84,
								},
								{
									x: 250,
									y: 60,
								},
							],
							runaways : [
								{
									x: 214,
									y: 150,
								},
								{
									x: 302,
									y: 130,
								},
								{
									x: 128,
									y: 224,
								},
								{
									x: 32,
									y: 160,
								},
								{
									x: 280,
									y: 224,
								},
							],
							decorations : [
								{
									sprite_index: Sbattle_dec_cbean,
									image_index: 2,
									x: 182,
									y: 18,
								},
								{
									sprite_index: Sbattle_dec_cbean,
									image_index: 1,
									x: 252,
									y: 168,
								},
								{
									sprite_index: Sbattle_dec_cbean,
									image_index: 0,
									x: 38,
									y: 152,	
								},
							]
						},
						{
							//config 2
					
							enemies : [
								{
									class: "normal",
									emotion: "normal",
									x: 116,
									y: 36,	
								},
								{
									class: "normal",
									emotion: "normal",
									x: 272,
									y: 220,	
								},
							],
							obstacles : [
								{
									sprite_index: Sbattle_obs_coffeecup,
									image_index: 0,
									mask_index: sprite_index,
									x: 58,
									y: 92,
								},
								{
									sprite_index: Sbattle_obs_coffeecup,
									image_index: 0,
									mask_index: sprite_index,
									x: 234,
									y: 160,
								},
							],
							runaways : [
								{
									x: 32,
									y: 32,
								},
								{
									x: 160,
									y: 32,
								},
								{
									x: 256,
									y: 32,
								},
								{
									x: 256,
									y: 96,
								},
								{
									x: 128,
									y: 128,
								},
								{
									x: 32,
									y: 160,
								}, 
								{
									x: 128,
									y: 224,
								},
								{
									x: 288,
									y: 192,
								},
							],
							decorations : [
								{
									sprite_index: Sbattle_dec_cbean,
									image_index: 2,
									x: 182,
									y: 18,
								},
								{
									sprite_index: Sbattle_dec_cbean,
									image_index: 0,
									x: 150,
									y: 38,
								},
								{
									sprite_index: Sbattle_dec_cbean,
									image_index: 0,
									x: 38,
									y: 195,
								},
								{
									sprite_index: Sbattle_dec_cbean,
									image_index: 1,
									x: 164,
									y: 200,
								},
							],
					
						},
					]
					show_debug_message("mini list spark 2:\n" + string(_mini_list));
				break;
		
				#endregion
		
				#region search_easy_3
		
				case "search_easy_3":
		
					_mini_list = [
						{
							//config 1

							enemies : [
								{
									class: "normal",
									emotion: "normal",
									x: 296,
									y: 194,	
								},
								{
									class: "normal",
									emotion: "normal",
									x: 110,
									y: 26,
								},
								{
									class: "normal",
									emotion: "normal",
									x: 182,
									y: 28,
								},
							],
							obstacles : [
								{
									sprite_index: Sbattle_obs_coffeecup,
									image_index: 4,
									mask_index: sprite_index,
									x: 62,
									y: 84,
								},
								{
									sprite_index: Sbattle_obs_coffeecup,
									image_index: 0,
									mask_index: sprite_index,
									x: 252,
									y: 60,
								},
								{
									sprite_index: Sbattle_obs_coffeecup,
									image_index: 2,
									mask_index: sprite_index,
									x: 234,
									y: 172,
								},
							],
							runaways : [
								{
									x: 32,
									y: 32,
								}, 
								{
									x: 164,
									y: 38,
								},
								{
									x: 292,
									y: 20,
								},
								{
									x: 202,
									y: 130,
								},
								{
									x: 180,
									y: 116,
								},
								{
									x: 32,
									y: 160,
								},
								{
									x: 288,
									y: 226,
								},
								{
									x: 128,
									y: 224,
								},
							],
							decorations : [
								{
									sprite_index: Sbattle_dec_cbean,
									image_index: 2,
									x: 182,
									y: 18,
								},
								{
									sprite_index: Sbattle_dec_cbean,
									image_index: 1,
									x: 114,
									y: 178,					
								},
								{
									sprite_index: Sbattle_dec_cbean,
									image_index: 0,
									x: 38,
									y: 152,
								},
							],
					
						},
						{
							//config 2
					
							enemies : [
								{
									class: "normal",
									emotion: "normal",
									x: 280,
									y: 24,	
								},
								{
									class: "normal",
									emotion: "normal",
									x: 24,
									y: 52,	
								},
								{
									class: "normal",
									emotion: "normal",
									x: 304,
									y: 164,	
								},
							],
							obstacles : [
								{
									sprite_index: Sbattle_obs_rock,
									image_index: 0,
									mask_index: sprite_index,
									x: 64,
									y: 96,
								},
								{
									sprite_index: Sbattle_obs_leaf,
									image_index: 0,
									mask_index: sprite_index,
									x: 256,
									y: 192,
								}, 
								{
									sprite_index: Sbattle_obs_gblade_big,
									image_index: 0,
									mask_index: sprite_index,
									x: 256,
									y: 64,
								},
							],
							runaways : [
								{
									x: 112,
									y: 36,
								},
								{
									x: 34,
									y: 22,
								}, 
								{
									x: 42,
									y: 160,
								},
								{
									x: 184,
									y: 68,
								},
								{
									x: 296,
									y: 116,
								},
								{
									x: 166,
									y: 210,
								},
								{
									x: 138,
									y: 120,
								},
							],
							decorations : [
								{
									sprite_index: Sbattle_dec_gblade_small,
									image_index: 4,
									x: 254,
									y: 102,
								},
								{
									sprite_index: Sbattle_dec_gblade_small,
									image_index: 4,
									x: 128,
									y: 0,
								},
								{
									sprite_index: Sbattle_dec_gblade_small,
									image_index: 3,
									x: 64,
									y: 160,
								},
							],
						},
					]
				break;
			
				#endregion
			}
	
			#endregion
	
			#region choose configuration for minigame and put in the official list
			
				var _dice = irandom((array_length(_mini_list) - 1));
				if ((array_length(battle_minigame_order_config) > 0) && ((array_length(battle_minigame_order_config) - 1) >= s)){ _dice = battle_minigame_order_config[s]; }
				
				array_push(battle_minigame_order_data, _mini_list[_dice]);
		
			#endregion
	
		}
	}
	
		//right now, you can have the same minigame and configuration repeat. I'm not going to fix this until after testing probably
	
	#endregion
	
	//now, we should have the full list of actual minigames being played with the correseponding data. With this, we should be able to set up for the first game.
}