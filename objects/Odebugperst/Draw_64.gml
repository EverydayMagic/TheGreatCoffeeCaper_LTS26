if (!global.debugActive){ exit; }

draw_set_font(global.font_name);
draw_set_color(c_red);
draw_text(10, 10, string(game_get_speed(gamespeed_fps)));
reset_draw_funcs();

//display_set_gui_maximize();
/*
draw_set_font(font_fancy);
draw_set_color(c_white);

//------Debug Text--------//
//Use a y-gap of 30

//LEFT
draw_text(10, 10,"Room: " + string(room_get_name(room)));
draw_text(10, 40, "Instances In Room: " + string(instance_count));
draw_text(10, 70, "Textbox Active: " + string(instance_exists(Otextbox)));
draw_text(10, 100, "Player Coordinates: (" + string(Oplayer.x) + ", " + string(Oplayer.y) + ")");
draw_text(10, 130, "Press [9] To See Collisions");
draw_text(10, 160, "Interacting With: " + string(object_get_name(interacting_with[0])));


//RIGHT
draw_set_halign(fa_right);


if (interacting_with[0] != noone)
{
	draw_text_ext(2400, 10, "VARIABLES FOR: " + string(object_get_name(interacting_with[0])), 30, 300);
	
	var _inst_vars = variable_instance_get_names(interacting_with[1]);
	for (var i = 0; i < array_length(_inst_vars); i++)
	{
		draw_text(2400, 100 + (30 * i), string(_inst_vars[i]) + ": " + string(variable_instance_get(interacting_with[1], _inst_vars[i])));	
	}
} else {
	var _player = Oplayer;
	
	draw_text_ext(2400, 10, "VARIABLES FOR: " + string(object_get_name(_player)), 30, 300);
	
	var _inst_vars = variable_instance_get_names(_player.id);
	for (var i = 0; i < array_length(_inst_vars); i++)
	{
		draw_text(2400, 100 + (30 * i), string(_inst_vars[i]) + ": " + string(variable_instance_get(_player.id, _inst_vars[i])));	
	}
}

draw_set_font(global.settings.font);

draw_set_halign(fa_left);
*/
reset_draw_funcs();