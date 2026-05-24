function SparkStateSleep(){
	var _bd = "Sspark_body_" + string(class) + "_fallasleep";
	body = asset_get_index(_bd);
	sprite_index = body;
	//animate body
	if (image_index < (image_number - 1))
	{
		image_speed = 1;	
	} else {
		image_speed = 0;
		image_index = (image_number - 1);
	}
	emotion = "sleepy";
	var _id = self.id;
	
	//sleep timer (wake up after timer)
	if (alarm[3] = -1)
	{
		alarm[3] = 120;	
	}
	
	if (being_attacked)
	{
		with (Ospark_sleepz)
		{
			if (parent = _id)
				instance_destroy(); 
		}
		if (path_exists(z_path)){ path_delete(z_path); }
		emotion = "scared";
		state = SparkStateBounce;
		alarm[3] = -1;
		exit;
	}
	
	//For Sleep Zs
	if (!path_exists(z_path) && face_dir = 3)
	{
		z_path = path_add();
		path_set_kind(z_path, 1);
		path_set_precision(z_path, 4);
		path_set_closed(z_path, false);
		path_add_point(z_path, x + 2, y + 2, 100);
		path_add_point(z_path, x - 6, y, 100);
		path_add_point(z_path, x - 7, y - 4, 100);
		path_add_point(z_path, x - 5, y - 8, 100);
		path_add_point(z_path, x - 7, y - 12, 100);
		path_add_point(z_path, x - 5, y - 16, 100);


		with (instance_create_depth(x + 2, y + 2, depth - 10, Ospark_sleepz))
		{
			parent = _id;
		}
	}
	
	//show_debug_message("BODY: " + string(sprite_get_name(body)));
}