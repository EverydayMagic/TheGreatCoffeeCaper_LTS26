active_leaves = 0;
leaf_spr_index = choose(Sleaf, Sleaf_roll);
leaf_img_index = irandom(3);
leaf_spawn = choose("up", "side");
leaf_x = 0;
leaf_y = 0;

inside = false;

function new_leaf_stats() {
	spr_index = choose(Sleaf, Sleaf_roll);
	img_index = irandom(3);
	leaf_spawn = choose("up", "side");
	
	if (leaf_spawn = "up")
	{
		leaf_x = irandom_range(0, camera_get_view_width(VIEW) - 10);
		leaf_y = irandom_range(-20, -10);
	} else {
		leaf_x = irandom_range(camera_get_view_width(VIEW) + 10, camera_get_view_width(VIEW) + 20);
		leaf_y = irandom_range(0, camera_get_view_height(VIEW) - 10);
	}
}















