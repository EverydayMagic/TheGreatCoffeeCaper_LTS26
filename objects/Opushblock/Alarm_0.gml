///@description blank floor for chair

if (sprite_index = Schair || sprite_index = Sbroken_chair)
{
	var _parent = self.id;
	with (instance_create_depth(x, y, depth, Oblankfloor))
	{
		parent = _parent;	
	}
}