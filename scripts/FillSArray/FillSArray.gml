

function fill_savearray() {

		with (Oplayer)
		{
			var _save_data = {
				object: object_get_name(object_index),
				x: x,
				y: y,
				spr_index: sprite_get_name(sprite_index),
				img_index: image_index,
				_state: state,
				room: room_in,
				depth: depth,
				direction: direction,
				visible: visible,
			}
			array_push(global.saveload_array, _save_data);

		}
	
		with (Odirector)
		{
			for (var r = 0; r < STORY_PACE.ENUM_LENGTH; r++)
			{
				story_data[r] = global.saveslot_story[global.saveslot][r];
			}
		
			var _save_data = {
				object: object_get_name(object_index),
				story_beat: global.story_beat,
			}
			array_push(global.saveload_array, _save_data);
		
		}
	
		with (Ogame)
		{
			var _save_data = {
				object: object_get_name(object_index),
				playerIdle: sprite_get_name(global.playerIdle),
				playerWalk: sprite_get_name(global.playerWalk),
				textActive: global.textActive,
				cutsceneActive: global.cutsceneActive,
				gamePaused: false,
				menuChar0: menu_char[0],
				menuChar1: menu_char[1],
				menuChar2: menu_char[2],
			}
			array_push(global.saveload_array, _save_data);
		}
	
		with (Oitem_manager)
		{
			//var _item_save_data = global.item_list;
			//array_set(global.base_item_data_array, 0, _item_save_data);
		
			var _save_data = {
				object: object_get_name(object_index),
				inv_array: inv,
				inv_stash_array: inv_stash,
				_equipped: equipped,
			}
			array_push(global.saveload_array, _save_data);
		}	
	
		//with (Osubtitle_menu)
		//{
		//	var _save_data = {
		//		object: object_get_name(object_index),
		//	}
		//}
		
		with (Ocluehunt)
		{
			var _save_data = {
				object: object_get_name(object_index),
				cluehunt_active: cluehunt_active,
				firsttimemenonosnotmyfirsttime: firsttimemenonosnotmyfirsttime,
			}
			array_push(global.saveload_array, _save_data);
		}
		
		if (instance_exists(Ocharliemouse))
		{
			with (Ocharliemouse)
			{
				var _save_data = {
					object: object_get_name(object_index),
					x: x,
					y: y,
					spr_index: sprite_get_name(sprite_index),
					img_index: image_index,
				}
				array_push(global.saveload_array, _save_data);
			}
		}
		
		if (instance_exists(Othatsinglechairthatyoupushandneverpushagain))
		{
			with (Othatsinglechairthatyoupushandneverpushagain)
			{
				var _save_data = {
					object: object_get_name(object_index),
					x: x,
				}
				array_push(global.saveload_array, _save_data);
			}
		}
		
		if (instance_exists(Opartypoint_manager))
		{
			with (Opartypoint_manager)
			{
				var _save_data = {
					object: object_get_name(object_index),
					pos_x: pos_x,
					pos_y: pos_y,
				}
				array_push(global.saveload_array, _save_data);
			}
		}
		
		with (all)
		{
			if (instance_exists(Odirector))
				if (Odirector.existing_in_room[0] = 0)
					array_set(Odirector.existing_in_room, 0, object_get_name(object_index));
				else
					array_push(Odirector.existing_in_room, object_get_name(object_index));	
		}

}