for (var i = 0; i < array_length(Ocluesteps_manager.footprint_id); i++)
{
	if (Ocluesteps_manager.footprint_id[i] = self.id)
	{
		array_delete(Ocluesteps_manager.footprint_id, i, 1);
		break;
	}
}
if (array_length(Ocluesteps_manager.footprint_id) <= 0)
	Ocluesteps_manager.footprint_id[0] = -1;

instance_destroy();














