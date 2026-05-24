image_speed = 0;


sparkle_meter_index = 0;

surface = -1;
GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();
_x = 120 * 2;
_y = 136 * 2;
_x_dist = _x - room_width;
_y_dist = _y - room_height;
tri_rot = 0;


beat_time = time_source_create(time_source_global, 1, time_source_units_seconds, function(){
	beat++;
	time_source_destroy(beat_time);
});


brownwheel_value = 270;
//full brownwheel is 125;
sparks_collected = 270;
full_wheel = sparks_collected - 125;
//full sparks collected is 125 (brownwheel_value is the visual wheel, sparks_collected is always updated behind the scenes)
collect_sections = 0;
spark_num = 0;
spark_hp_divider = 0;
brownwheel_values = [270];
brownwheel_index = 0;

collect_sparks = function(){
	sparks_collected -= ((full_wheel/collect_sections)/spark_num)/spark_hp_divider;
	array_push(brownwheel_values, sparks_collected);
}


blue_bg_img = 0;
sparkles_bg_img = 0;

surface = -1;

depth = -99;
//xmod = 0;
//ymod = 0;
//radmod = 0;
//wheelmod = 0;