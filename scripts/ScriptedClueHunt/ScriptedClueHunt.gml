///goes through each room that might have a story related clue hunt
function check_scriptcluehunt(_room){
	var _scripted = true;
	switch (_room)
	{
		case Rcoffeeshop:
			//investigate cup o joe prints leading to closet
			if (global.saveslot_story[global.saveslot][STORY_PACE.MUSICSHEET_FOUND] = 0)
			{
				var _print_data = 
					{
						class: "footprint",
						x: 72,
						y: 112,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 80,
						y: 96,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 80,
						y: 80,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 80,
						y: 64,
						image_angle: 180,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 96,
						y: 64,
						image_angle: 180,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 112,
						y: 64,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 112,
						y: 48,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 112,
						y: 32,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 120,
						y: 16,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				
			}
		break;
		
		case Rhooters:
			//finding hoots hat
			if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && Oitem_manager.inv[0].name != "Hoots Hat")
			{
				//footprints
					var _print_data = {
						class: "footprint",
						x: 48,
						y: 32,
						image_angle: 0,
					}
					array_push(global.scripted_print_data, _print_data);
				
					var _print_data = {
						class: "footprint",
						x: 64,
						y: 32,
						image_angle: 0,
					}
					array_push(global.scripted_print_data, _print_data);
				
					var _print_data = {
						class: "footprint",
						x: 64,
						y: 48,
						image_angle: 270,
					}
					array_push(global.scripted_print_data, _print_data);
					
					var _print_data = {
						class: "footprint",
						x: 64,
						y: 64,
						image_angle: 270,
					}
					array_push(global.scripted_print_data, _print_data);
					
					var _print_data = {
						class: "footprint",
						x: 64,
						y: 80,
						image_angle: 270,
					}
					array_push(global.scripted_print_data, _print_data);
					
					var _print_data = {
						class: "footprint",
						x: 64,
						y: 96,
						image_angle: 270,
					}
					array_push(global.scripted_print_data, _print_data);
					
					var _print_data = {
						class: "footprint",
						x: 80,
						y: 96,
						image_angle: 0,
					}
					array_push(global.scripted_print_data, _print_data);
					
					var _print_data = {
						class: "footprint",
						x: 80,
						y: 112,
						image_angle: 270,
					}
					array_push(global.scripted_print_data, _print_data);
					
					var _print_data = {
						class: "footprint",
						x: 96,
						y: 112,
						image_angle: 0,
					}
					array_push(global.scripted_print_data, _print_data);
					
					var _print_data = {
						class: "footprint",
						x: 112,
						y: 112,
						image_angle: 0,
					}
					array_push(global.scripted_print_data, _print_data);
				
				//spark
					var _print_data = {
						class: "spark",
						subclass: "scripted_item",
						item: global.item_list.detective_hat,
						x: 32,
						y: 32,
					}
					array_push(global.scripted_print_data, _print_data);
			}	
		break;
		
		case Rcoffeecloset:
			//finding first primary clue
			if (global.saveslot_story[global.saveslot][STORY_PACE.CLOUDPUFF_FOUND] = 0)
			{
				//footprints
				var _print_data = 
					{
						class: "footprint",
						x: 112,
						y: 112,
						image_angle: 0,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 96,
						y: 112,
						image_angle: 0,
					}	
					array_push(global.scripted_print_data, _print_data);	
				var _print_data = 
					{
						class: "footprint",
						x: 80,
						y: 112,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 80,
						y: 96,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 80,
						y: 80,
						image_angle: 180,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 96,
						y: 80,
						image_angle: 180,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 112,
						y: 80,
						image_angle: 180,
					}	
					array_push(global.scripted_print_data, _print_data);
				//spark
				var _print_data = 
					{
						class: "spark",
						subclass: "scripted_item",
						item: global.item_list.cloud_puff,
						x: 128,
						y: 80,
					}
					array_push(global.scripted_print_data, _print_data);
			}
			//finding second primary clue
			if (global.saveslot_story[global.saveslot][STORY_PACE.BLUEHAT_FOUND] = 0 && global.saveslot_story[global.saveslot][STORY_PACE.CLOUDPUFF_FOUND] = 1)
			{
				//footprints
				var _print_data = 
					{
						class: "footprint",
						x: 128,
						y: 80,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 128,
						y: 64,
						image_angle: 0,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 112,
						y: 64,
						image_angle: 0,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 96,
						y: 64,
						image_angle: 0,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 80,
						y: 64,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 80,
						y: 48,
						image_angle: 0,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 64,
						y: 48,
						image_angle: 270,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 64,
						y: 32,
						image_angle: 0,
					}	
					array_push(global.scripted_print_data, _print_data);
				//spark
				var _print_data = 
					{
						class: "spark",
						subclass: "scripted_item",
						item: global.item_list.blue_hat,
						x: 48,
						y: 32,
					}
					array_push(global.scripted_print_data, _print_data);
				
			}
			//finding third primary clue
			if (global.saveslot_story[global.saveslot][STORY_PACE.MUSICSHEET_FOUND] = 0 && global.saveslot_story[global.saveslot][STORY_PACE.BLUEHAT_FOUND] = 1)
			{
				//footprints
				var _print_data = 
					{
						class: "footprint",
						x: 48,
						y: 32,
						image_angle: 90,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 48,
						y: 48,
						image_angle: 90,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 48,
						y: 64,
						image_angle: 90,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 48,
						y: 80,
						image_angle: 0,
					}	
					array_push(global.scripted_print_data, _print_data);
				var _print_data = 
					{
						class: "footprint",
						x: 32,
						y: 80,
						image_angle: 90,
					}	
					array_push(global.scripted_print_data, _print_data);
				//spark
				var _print_data = 
					{
						class: "spark",
						subclass: "scripted_item",
						item: global.item_list.music_sheet,
						x: 32,
						y: 96,
					}
					array_push(global.scripted_print_data, _print_data);
			}
		break;
		
		case Rbeforeneighborhood:
			//bookworm
			if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_BOOKWORM] = 0 && global.saveslot_story[global.saveslot][STORY_PACE.FOUND_ALL_MAIN_CLUES] = 0)
			{
				//spark
				var _print_data = {
					class: "spark",
					subclass: "bug",
					item: Obookworm,
					x: 112,
					y: 81,
					bug_x: 121,
					bug_y: 85,
					dir_needed: [1, 3],
				}
				array_push(global.scripted_print_data, _print_data);	
			}
			//finding love letter
			if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_BEAN_BANDITS] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.LOVELETTER_FOUND] = 0 && Oitem_manager.inv[6].display_name != "Love Letter")
			{
				//spark
					var _print_data = {
						class: "spark",
						subclass: "scripted_item",
						item: global.item_list.love_letter,
						x: 128,
						y: 96,
					}
					array_push(global.scripted_print_data, _print_data);	
			}
		break;	
		
		case Rwoodshop:
			//finding clawdine's hammer
			if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_CLAWDINE] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.HAMMER_FOUND] = 0)
			{
				//footprints
					var _print_data = 
						{
							class: "footprint",
							x: 64,
							y: 96,
							image_angle: 0,
						}	
						array_push(global.scripted_print_data, _print_data);
					var _print_data = 
						{
							class: "footprint",
							x: 48,
							y: 96,
							image_angle: 270,
						}	
						array_push(global.scripted_print_data, _print_data);
					var _print_data = 
						{
							class: "footprint",
							x: 48,
							y: 80,
							image_angle: 270,
						}	
						array_push(global.scripted_print_data, _print_data);
					var _print_data = 
						{
							class: "footprint",
							x: 48,
							y: 64,
							image_angle: 180,
						}	
						array_push(global.scripted_print_data, _print_data);
					var _print_data = 
						{
							class: "footprint",
							x: 64,
							y: 64,
							image_angle: 270,
						}	
						array_push(global.scripted_print_data, _print_data);
					var _print_data = 
						{
							class: "footprint",
							x: 64,
							y: 48,
							image_angle: 180,
						}	
						array_push(global.scripted_print_data, _print_data);
					var _print_data = 
						{
							class: "footprint",
							x: 80,
							y: 48,
							image_angle: 180,
						}	
						array_push(global.scripted_print_data, _print_data);
					var _print_data = 
						{
							class: "footprint",
							x: 96,
							y: 48,
							image_angle: 270,
						}	
						array_push(global.scripted_print_data, _print_data);
					var _print_data = 
						{
							class: "footprint",
							x: 96,
							y: 32,
							image_angle: 180,
						}	
						array_push(global.scripted_print_data, _print_data);
				//spark
					var _print_data = {
						class: "spark",
						subclass: "scripted_item",
						item: global.item_list.hammer,
						x: 112,
						y: 32,
					}
					array_push(global.scripted_print_data, _print_data);	
			}
		break;
		
		case Rroadtohoots:
			//mushroom
			if (global.saveslot_story[global.saveslot][STORY_PACE.ACT1_CHAP1_SCENE1] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.MEET_MOOSH] = 0)
			{
				//spark
				var _print_data = {
					class: "spark",
					subclass: "bug",
					item: Omooshmushroom,
					x: 112,
					y: 64,
					bug_x: 120,
					bug_y: 81,
				}
				array_push(global.scripted_print_data, _print_data);		
			}
		break;
		
		default: _scripted = false; break;
	}
	
	return _scripted;
}