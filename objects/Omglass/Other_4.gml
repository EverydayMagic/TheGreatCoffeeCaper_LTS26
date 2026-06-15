//image index
if (instance_exists(Ocluebattle_manager))
{
	switch (Ocluebattle_manager.background)
	{
		case Sbattlebg_grass:
			image_index = 1;
		break;
	
		case Sbattlebg_wood:
			image_index = 2;
		break;
	
		default: image_index = 0; break;
	}
}