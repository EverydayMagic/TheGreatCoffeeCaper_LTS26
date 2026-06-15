function check_leaf_touch(){
	if (place_meeting(x, y, Oleaf_tile))
	{
		draw_sprite_ext(Sleaftile_foot, 0, x - (sprite_get_width(sprite_index)/2), y, (sprite_get_width(sprite_index)/sprite_get_width(Sleaftile_foot)), 1, 0, c_white, 1); 
	}
}