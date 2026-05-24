if (parent != noone)
{
	//pos
	x = (parent.x - parent.sprite_xoffset);
	y = (parent.y - parent.sprite_yoffset);
	
	//stretch
	image_xscale = (sprite_get_width(parent.sprite_index)/sprite_get_width(sprite_index));
	image_yscale = (sprite_get_height(parent.sprite_index)/sprite_get_height(sprite_index));
	
	parent.uni_col = self.id;
}





















