if (!place_meeting(x, y, Omglass) && instance_exists(parent))
	depth = parent.depth + 1;
else
	depth = old_depth;