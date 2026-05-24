//draw_body
draw_self();

//draw_face
if (face != -1)
	draw_sprite_ext(face, face_dir, x, y, image_xscale, image_yscale, 0, face_color, image_alpha);

if (emotion = "scared")
	draw_sprite_ext(Ssweat, sweat_spd, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
else
	sweat_spd = 0;


//draw_set_color(c_white);
//draw_set_font(global.font_tiny);

//draw_text(0, 0, "State: " + string(script_get_name(state)));
//draw_text(0, 8, "Body: " + string(sprite_get_name(body)));
//draw_text(0, 0, "Emotion: " + string(emotion));
//draw_text(0, 8, "Running: " + string(running_away));
//draw_text(0, 8, "Path Spd: " + string(path_speed));
//if (atk_chosen != 0)
//	draw_text(0, 0, "Bullet Max: " + string(atk_chosen.bullet_max));
////draw_text(0, 10, "IMG SPD: " + string(image_speed));
reset_draw_funcs();

//if (path_exists(path))
//	draw_path(path, x, y, true);








