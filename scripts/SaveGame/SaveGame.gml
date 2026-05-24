function save_game(){
	global.saving = true;

	fill_savearray();
	var _saveData = { 
		instances: global.saveload_array,
		story_data: Odirector.story_data,
		in_room: Odirector.existing_in_room,
		base_item_data: global.base_item_data_array,
	};
	
	//turn all this data into a JSON string and save it via a buffer
	var _string = SnapToJSON(_saveData, true);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, working_directory + "tgcc" + string(global.saveslot) + ".edm");
	buffer_delete(_buffer);

	//show_debug_message("Game Saved! " + _string);
	//show_debug_message("Location: " + filename_path("coffeecaper0.edm"));
	
	global.saveload_array = [
		//empty it so the player can write over it again
	];
	Odirector.story_data = [
		//empty it so the player can write over it again
	];
	Odirector.existing_in_room = [ 0
		//empty it so the player can write over it again
	];
	global.base_item_data_array = [ 
		//empty it so the player can write over it again
	];
	
	
	return true;
}

