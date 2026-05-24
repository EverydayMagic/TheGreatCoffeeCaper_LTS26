ed_alpha = 0;

circle_scale = 0;

beat = 0;

see_logo_length = 1;

wait_a_frame = 1;
circle_bg_frm = 0;

see_logo_time = time_source_create(time_source_game, see_logo_length, time_source_units_seconds, function(){
		beat++;
});


zstart_img = 0;

surf = -1;
GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();
scale = 5;

display_set_gui_size(160 * scale, 144 * scale);

blah = false;