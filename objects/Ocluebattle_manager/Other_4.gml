if (instance_exists(Oplayer))
{
	//update these
	Ocluehunt.old_x = Oplayer.x;
	Ocluehunt.old_y = Oplayer.y;	
	
	instance_deactivate_object(Oplayer);
	if (instance_exists(Ocharliemouse))
		instance_deactivate_object(Ocharliemouse);
}

layer_set_visible("BG", false);
layer_set_visible("TestObstacles", false);

//go ahead and prepare for battle
fill_clue_battle();











