if (global.saveslot_story[global.saveslot][STORY_PACE.HAMMER_FOUND] = 1)
{
	with (instance_create_depth(70, 128, -bbox_bottom, Owarp_block))
	{
		target_x = 56;
		target_y = 82;
		dest = Routchophouse;
		inout = true;
		trans_type = "iris";
		image_xscale = 2.5;
		party_dir = 1;
	}
	
	instance_destroy();
	exit;
	
} else {
	if (instance_exists(Oplayer))
	{
		if (place_meeting(x, y, Oplayer) && !instance_exists(Otextbox) && !global.gamePaused)
		{
			create_textbox("dontleaveclawdinehouse");
			Oplayer.y -= 1;
		}
	}
}






















