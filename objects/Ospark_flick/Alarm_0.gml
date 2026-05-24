///@description back to flying
state = FlickStateFly;

//destroy sweat
var _id = self.id;
for (var i = 0; i < instance_count; i++)
{
	var _inst = instance_id[i];
	if (object_get_name(_inst) = "Osweatbeads")
	{
		with (_inst)
		{
			if (char_track = _id)
			{
				instance_destroy(_inst);
			}
		}
	}
}
















