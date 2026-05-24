object = noone;
origin_x = 0;
origin_y = 0;
x_pos = [];
y_pos = [];
spd = 0;
spr_list = [];

imagespd_manual = noone;

goto_track = 0;

multi_goto_done = false;

hoots_track_start = -1;

function add_goto_track(){
	if ((goto_track + 1) < array_length(x_pos))
	{ 
		goto_track++; 
	} else {
		object.image_speed = 0;
		if (!multi_goto_done)
		{
			global.multi_goto_done++;
			multi_goto_done = true;
		}
	}
}
















