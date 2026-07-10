if (instance_exists(char_track))
{
	var _spr_h = sprite_get_height(char_track.sprite_index);
	x = char_track.x + x_mod;
	y = (char_track.y + y_mod) - (_spr_h + h_mod);
	visible = true;
	depth = -y - 100;
}