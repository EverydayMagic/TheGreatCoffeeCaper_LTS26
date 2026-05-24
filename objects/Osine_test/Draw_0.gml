for(var i = 0; i < array_length(xpos_array); i++)
{
	draw_set_color(c_red);
	draw_rectangle(xpos_array[i], ypos_array[i], xpos_array[i] + 1, ypos_array[i] + 1, false);	
	draw_set_color(c_teal);
	draw_line(start_x, start_y, start_x, y);
	reset_draw_funcs();
}


//heading left


draw_self();
//reset_draw_funcs();

//draw_text(140, 0, curve_speed);
//draw_text(140, 10, y);
//draw_text(140, 20, curve_speed * y);





















