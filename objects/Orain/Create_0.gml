if (instance_exists(Ostartstart))
	depth = Ostartstart.depth + 1;

spawn = choose("up", "side");

death_x = irandom_range(0, camera_get_view_width(VIEW));
death_y = irandom_range(0, camera_get_view_height(VIEW));

spd = 5;

beat_override = false;






