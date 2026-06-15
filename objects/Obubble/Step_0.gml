image_index = bubble_type;
if (!instance_exists(char_track)){ char_track = noone; }
if (char_track != noone)
{
	var _spr_h = sprite_get_height(char_track.sprite_index);
	x = char_track.x + x_mod;
	y = (char_track.y + y_mod) - (_spr_h + h_mod);
	visible = true;
} else instance_destroy();

if (bounce && alarm[0] = -1)
{ 
	h_mod_track = h_mod;
	alarm[0] = 1;
}

depth = -y - 100;

if (kill_time > 0 && alarm[1] = -1){ alarm[1] = kill_time; }













