if (keyboard_check_pressed(vk_f1))
{
	global.settings.fullscreen =! global.settings.fullscreen;
	reset_window();
}

window_set_fullscreen(global.settings.fullscreen);

var _map_trans = false;
if (instance_exists(Ofade))
	if (Ofade.trans_type = "map")
		_map_trans = true;

if (!global.itemAdding && !_map_trans) //if we are adding an item, the camera is zooming in and we don't want this to affect it
{
	camera_set_view_size(VIEW, view_width, view_height);

	if (instance_exists(Oplayer))
	{
		var _x = clamp(Oplayer.x - view_width/2, 0, room_width-view_width);
		var _y = clamp(Oplayer.y - view_height/2, 0, room_height - view_height);
	
		camera_set_view_pos(VIEW, _x, _y);
		
	} else if (room = Rcluebattle) {
		camera_set_view_pos(VIEW, 0, 0);	
	}
}

//show_debug_message("CAM POS: " + string(camera_get_view_x(VIEW)) + ", " + string(camera_get_view_y(VIEW)));

//show_debug_message("view width: " + string(view_width));
//show_debug_message("view height: " + string(view_height));

//show_debug_message("app surf width: " + string(surface_get_width(application_surface)));
//show_debug_message("app surf height: " + string(surface_get_height(application_surface)));

//show_debug_message("Window Size: " + string(window_get_width()) + ", " + string(window_get_height()));

//show_debug_message("GUI width: " + string(display_get_gui_width()));
//show_debug_message("GUI height: " + string(display_get_gui_height()));