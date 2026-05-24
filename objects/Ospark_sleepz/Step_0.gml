depth = Omglass.depth + 1;
if (path_index != -1)
{
	if (path_position >= 0.75 && !created_baby)
	{
		var _id = self.id;
		with (instance_create_depth(parent.x + 2, parent.y + 2, depth, Ospark_sleepz))
		{
			parent = _id.parent;
		}
		created_baby = true;
	}
	
	if (path_position < 1 && image_xscale < 1)
	{
		image_xscale += 1/(12/path_speed);
		image_yscale += 1/(12/path_speed);
	}
	
	if (image_xscale >= 1)
	{
		image_alpha -= 1/(16/path_speed);
		if (image_alpha <= 0)
			instance_destroy();	
	}
}


















