if (!instance_exists(char_track)){ char_track = noone; }
if (char_track != noone)
{
	var _spr_h = sprite_get_height(char_track.sprite_index);
	x = char_track.x;
	y = char_track.y - (_spr_h - h_mod);
	depth = char_track.depth - depth_mod;
} else instance_destroy();



depth = -y - depth_mod;

if (player_depth && instance_exists(Oplayer)){ depth = Oplayer.depth; }















