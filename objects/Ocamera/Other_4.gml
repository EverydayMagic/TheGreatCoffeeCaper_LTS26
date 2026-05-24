view_enabled = true;
view_visible[0] = true;

view_width = 160;
view_height = 144;

if (room = Rcluebattle)
{
	view_width = room_width;
	view_height = room_height;
}

if (instance_exists(Oplayer))
{
	var _xx = clamp(Oplayer.x - view_width/2, 0, room_width - view_width);
	var _yy = clamp(Oplayer.y - view_height/2, 0, room_height - view_height);
	camera_set_view_pos(VIEW, _xx, _yy);
}








