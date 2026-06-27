object = noone;
origin_x = 0;
origin_y = 0;
x_pos = [];
y_pos = [];
spd = 0;
spr_list = [];
spr_done = -1;
img_done = 0;
pause_after_beat = -1;
pause_done = true;
uphill_move = false;
anim_curve  = animcurve_get_channel(loveletter_animcurve, "curve1");
percent = 0;
position = 0;
dist_x = [];
dist_y = [];
loop_move = false;

imagespd_manual = noone;

goto_track = 0;

multi_goto_done = false;

hoots_track_start = -1;

function add_goto_track(){
	if ((goto_track + 1) < array_length(x_pos))
	{ 
		goto_track++;
	} else {
		if (!loop_move)
		{
			object.image_speed = 0;
			if (spr_done != -1){ object.sprite_index = spr_done; object.image_index = img_done; }
			if (!multi_goto_done)
			{
				global.multi_goto_done++;
				multi_goto_done = true;
			}
		} else {
			goto_track = 0;
			object.x = origin_x;
			object.y = origin_y;
		}
	}
	if (alarm[0] = -1 && pause_after_beat > 0){ alarm[0] = pause_after_beat; pause_done = false;}
}
















