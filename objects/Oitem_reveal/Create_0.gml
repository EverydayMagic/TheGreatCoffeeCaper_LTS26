if (instance_exists(Oplayer))
{
	x = Oplayer.x;
	y = Oplayer.y;
	depth = Oplayer.depth - 1;
	oldplayer_sindex = Oplayer.sprite_index;
}
item_revealing = -1;
item_desc = "";
item_desc_type = "";
type_speed = 0; //1 letter typed every [type_speed] frame(s)
type_timer = type_speed;
char = 0;

beat = 0;
beating = true;

cam_x = camera_get_view_x(VIEW);
cam_y = camera_get_view_y(VIEW);
cam_width = 160;
cam_height = 144;

cam_xdist = (Oplayer.x - 40);
cam_ydist = (Oplayer.y - 52);

cam_wdist = 160/2;
cam_hdist = 144/2;

star_ydist = Oplayer.y - 24;


time = 10;

surface = -1;
GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();
radius = GUI_W/2;
radius_dist = radius - 100;

bigtext_x = cam_width/2;
bigtext_y = camera_get_view_y(VIEW) - 5;
bigtext_y_dist = 0;
bigtext_xscale = 0.2;
bigtext_yscale = 0.2;
arrow_index = 0;

effect_timer = 5;
