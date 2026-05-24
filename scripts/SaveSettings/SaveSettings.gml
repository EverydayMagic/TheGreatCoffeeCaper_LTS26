function save_settings(){
	with (Omenu)
	{
		var _save_settings = {
			masterVolume: global.settings.volume,
			fullscreen: global.settings.fullscreen,
			fontMain: global.settings.font,
			atkStyle_hold: global.settings.battle_control_hold,
			menuChar: global.settings.menu_char,
		}
		array_push(global.saved_settings, _save_settings);
	}
	var _savedSettings = {
		settings: global.saved_settings,	
	};
	
	//turn all this data into a JSON string and save it via a buffer
	var _string = SnapToJSON(_savedSettings, true);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, working_directory + "coffeecaper_settings.edm");
	buffer_delete(_buffer);
	
	//show_debug_message("Settings Saved! " + _string);
	
	global.saved_settings = [
		//empty it so the player can write over it again
	];
	
	return true;
}


function load_settings(){
	if (file_exists("coffeecaper_settings.edm"))
	{
		var _buffer = buffer_load("coffeecaper_settings.edm");
		var _string = buffer_read(_buffer, buffer_string);	
		buffer_delete(_buffer);
		
		try 
		{
			var _settingData = SnapFromJSON(_string);
			
		} catch (_ex) {
			//show_debug_message(_ex.message);	
		}
		
		if (is_struct(_settingData))
		{
			for (var i = 0; i < array_length(_settingData.settings); i++)
			{
				//show_debug_message("SETTING: " + string(_setting_str));
				global.settings.volume = _settingData.settings[i].masterVolume;	
				global.settings.fullscreen = _settingData.settings[i].fullscreen;
				if (variable_struct_exists(_settingData.settings[i], "fontMain") && (_settingData.settings[i].fontMain = global.font_classic || _settingData.settings[i].fontMain = global.font_ffl))
				{
					if (_settingData.settings[i].fontMain = global.font_classic || _settingData.settings[i].fontMain = global.font_ffl)
					{
						global.settings.font = _settingData.settings[i].fontMain;
					}
				}
				
				if (variable_struct_exists(_settingData.settings[i], "atkStyle_hold"))
				{
					global.settings.battle_control_hold = _settingData.settings[i].atkStyle_hold;	
				}
				if (variable_struct_exists(_settingData.settings[i], "menuChar"))
				{
					global.settings.menu_char = _settingData.settings[i].menuChar;
				}
			}
		}
		
	}
}
