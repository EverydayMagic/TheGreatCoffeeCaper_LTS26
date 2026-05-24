function make_arc_points(x1, y1, x2, y2, curve_height, max_points_per_side, xpoints_array, ypoints_array, obj){

	// --- Midpoint ---
	var mid_x = (x1 + x2) / 2;
	var mid_y = (y1 + y2) / 2;

	// --- Control Point: ABOVE midpoint = curve bows downward (∩) ---
	var control_x = mid_x;
	var control_y = mid_y - curve_height;

	// Clamp control point within room
	control_y = max(0, control_y);

	// --- Generate curve points ---
	var total_points = max_points_per_side * 2;
	var curve_points_x = [];
	var curve_points_y = [];

	for (var i = 0; i <= total_points; i++) {
		var t = i / total_points;

		var xt = round((1 - t) * (1 - t) * x1 + 2 * (1 - t) * t * control_x + t * t * x2);
		var yt = round((1 - t) * (1 - t) * y1 + 2 * (1 - t) * t * control_y + t * t * y2);

		xt = clamp(xt, 0, room_width);
		yt = clamp(yt, 0, room_height);

		with (obj) {
			array_push(xpoints_array, xt);
			array_push(ypoints_array, yt);
		}
	}

}