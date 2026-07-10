function cut_shownoah(){
	get_scene_cast(99);
	
	global.moveOrder = [
		[ costume_change, [Ohoots_cutscene, Splayer_capwalk_d] ],
		[ goTo, [Ohoots_cutscene, 32, 65, 32, 96, 1] ],
		[ costume_change, [Ohoots_cutscene, Splayer_capidle, 3] ],
		[ create_textbox, ["bigbottom", Ohoots_cutscene, false] ],
		[ costume_change, [Ocharliemouse_cutscene, Scmouse_walkl] ],
		[ goTo, [Ocharliemouse_cutscene, 72, 103, 48, 96, 1] ],
		[ costume_change, [Ocharliemouse_cutscene, Scmouse_idle, 2] ],
		[ create_textbox, ["bigbottomm", Ocharliemouse_cutscene, false] ],
	]
	
	if (global.moveOrder_beat < array_length(global.moveOrder))
	{
		var entry = global.moveOrder[global.moveOrder_beat];
		if (is_array(entry) == true)
			script_execute_ext(entry[0], entry[1]);      
		else
			entry();

	} else {
		/////////////////////////////////////////////
		//Uncomment this once cutscene is finished!//
		/////////////////////////////////////////////
			
		end_scene();	
	}
}