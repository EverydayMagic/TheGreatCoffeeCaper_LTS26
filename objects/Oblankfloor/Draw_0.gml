if (instance_exists(parent))
{
	draw_set_color(#FCBA62);
	draw_rectangle(x, y, x + ((sprite_get_width(parent.sprite_index)/widthmod) - 1), y + ((sprite_get_height(parent.sprite_index)/heightmod) - 1), false);
	reset_draw_funcs();
}






















