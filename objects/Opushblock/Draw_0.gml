

if (Ocluehunt.cluehunt_active = true && instance_exists(Oplayer) && !Ocluehunt.beating)
{
	var _close_to_player = (point_distance(x, y, Oplayer.x, Oplayer.y) < 16) || (point_distance(x + sprite_width, y, Oplayer.x, Oplayer.y) < 16) || (point_distance(x, y + sprite_height, Oplayer.x, Oplayer.y) < 16) || (point_distance(x + sprite_width, y + sprite_height, Oplayer.x, Oplayer.y) < 16);
	
	if (_close_to_player)
	{
		//show white outline to hint push
		shader_set(SHDwhiteoutline);

		var _texture = sprite_get_texture(sprite_index, image_index);
		var _texture_width = texture_get_texel_width(_texture);
		var _texture_height = texture_get_texel_height(_texture);

		//put stuff in -> vec2 2 values
		shader_set_uniform_f(uniform_handle, _texture_width, _texture_height);
	}
	
}
draw_self();

shader_reset();
//show_debug_message("id: " + string(self.id) + " x: " + string(x) + " y: " + string(y));

//draw_set_color(c_green);
//draw_rectangle(x, y, bbox_right, bbox_bottom, true);
//reset_draw_funcs();
//draw_sprite(Spixel, 0, x + sprite_width/2, y + sprite_height/2);
//reset_draw_funcs();














