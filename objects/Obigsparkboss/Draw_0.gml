//warning block (for zooming)
if (zoom_warning_block_alpha != -1 && state = BIGSPARK_STATE_ATK_ZOOM)
{
	var _x = 0;
	var _y = 0;
	switch (zoom_cur_corner)
	{
		case 1:
			_x = 5;
			_y = 25;
		break;
		case 2:
			_x = 136;
			_y = 6;
		break;
		case 3:
			_x = 24;
			_y = 124;
		break;
		case 4:
			_x = 156;
			_y = 104;
		break;
	}
	
	draw_sprite_ext(Spixel, 1, _x, _y, 27, 202, zoom_warning_block_dir, white_col, zoom_warning_block_alpha);
}

//body
draw_self();

//face
draw_sprite_ext(face, face_dir, x, y, face_xscale, face_yscale, 0, c_white, image_alpha);

//bullet body
draw_sprite_ext(Sbigsparkbullet_body, 0, x, y, 1, 1, image_angle, c_white, dvd_bullet_body_alpha);

//sweat
if (emotion = "tired")
	draw_sprite(Ssweat, sweat_index, x, y - 6);


















