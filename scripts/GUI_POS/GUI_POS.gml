function room_x_to_gui(x, view = 0) {
	return (x - camera_get_view_x(view_camera[view])) * (display_get_gui_width() / camera_get_view_width(view_camera[view]));
}

function room_y_to_gui(y, view = 0) {
	return (y - camera_get_view_y(view_camera[view])) * (display_get_gui_height() / camera_get_view_height(view_camera[view]));
}