//variables for moving
xspd = 0;
yspd = 0;
moveSpd = 2;
dir = 0;

//how far we need to move
gridSpace = 16;
start_x = x;
start_y = y;
target_x = x;
target_y = y;

//state
sliding = false;
on_push_area = false;
on_slide_area = false;

//just because parent is Ocol
special = false;
temp = false;


uniform_handle = shader_get_uniform(SHDwhiteoutline, "texture_pixel");

if (sprite_index = Schair || sprite_index = Sbroken_chair)
{
	var _parent = self.id;
	with (instance_create_depth(x, y, depth, Oblankfloor))
	{
		parent = _parent;	
	}
}









