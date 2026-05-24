clue = -1;

image_speed = 0;

//x *= 2;
//y *= 2;

image_xscale = 2;
image_yscale = 2;

x_dist = x - (room_width/2);
y_dist = y - (room_height/2);



beating = false;
beat = 0;

surface = -1;
GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();

_x = 150 * 2;
_y = 134 * 2;
_x_dist = _x - (room_width/2);
_y_dist = _y - (room_height/2);
radius = 160;
tri_rot = 0;

beat_time = time_source_create(time_source_global, 1, time_source_units_seconds, function(){
	beat++;
	time_source_destroy(beat_time);
});


bigtext_x = 81;
bigtext_y = -5;
bigtext_xscale = 0.2;
bigtext_yscale = 0.2;

clue_desc_type = "";
type_speed = 0; //1 letter typed every [type_speed] frame(s)
type_timer = type_speed;
char = 0;

arrow_index = 0;

sendspark_x = [];
sendspark_y = [];
sendspark_index = 0;

depth = -102