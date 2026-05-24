
///@arg x
///@arg y
///@arg value
///@arg max
///@arg colour
///@arg radius
///@arg transparency
///@arg [angle]
///@arg [flip]
function draw_pie(_x, _y, _value, _max, _colour, _radius, _transparency, _angle = 90, _flip = false){
	
	if (_value > 0) { // no point even running if there is nothing to display (also stops /0
	
		var i, len, tx, ty, val;

		var numberofsections = 60; // there is no draw_get_circle_precision() else I would use that here

		var sizeofsection = 360/numberofsections;

		val = (_value/_max) * numberofsections;

		if (val > 1) {

			draw_set_colour(_colour);
			draw_set_alpha(_transparency);

			draw_primitive_begin(pr_trianglefan);

			draw_vertex(_x, _y);

			for(i = 0; i <= val; i++) {

				len = (i*sizeofsection) + _angle; // the starting angle

				tx = lengthdir_x(_radius, len);

				ty = lengthdir_y(_radius, len);

				if (!_flip)
					draw_vertex(_x - tx, _y + ty);
				else
					draw_vertex(_x - tx, _y - ty);

			}

			draw_primitive_end();

		}

		draw_set_alpha(1);
	
	}
}

///@arg x
///@arg y
///@arg value
///@arg sprite
///@arg radius
///@arg transparency
///@arg [image_index]
///@arg [angle]
function draw_pie_spr(_x, _y, _value, _sprite, _radius, _transparency, _img_index = 0, _angle = 180) {
	if(_value <= 0) return;
  
	if (!surface_exists(surface)) 
	surface = surface_create(sprite_get_width(_sprite), sprite_get_height(_sprite));
  
	surface_set_target(surface);
  
	draw_clear_alpha(0, 0);
	var _center_x = sprite_get_width(_sprite) / 2;
	var _center_y = sprite_get_height(_sprite) / 2;
  
	gpu_set_colorwriteenable(false, false, false, true);
	//sprite_get_width(_sprite) / 2
	draw_circle(_center_x, _center_y, _radius, false);
	gpu_set_colorwriteenable(true, true, true, false);
  
	draw_sprite(_sprite, _img_index, _center_x, _center_y);
	gpu_set_colorwriteenable(true, true, true, true);
	gpu_set_blendmode(bm_subtract);
	var i, len, tx, ty;
  
	if (_value > 1) {
	draw_set_colour(c_white);
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(_center_x, _center_y);
	for (i = _value; i <= 360; i++) {
		tx = lengthdir_x(_radius, _angle + i);
		ty = lengthdir_y(_radius, _angle + i);
		draw_vertex(_center_x + tx, _center_y + ty);
	}
	draw_primitive_end();
	}
  
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
  
	draw_surface_ext(surface, _x, _y, 1, 1, 0, c_white, _transparency);
}
	
///@arg x
///@arg y
///@arg value
///@arg sprite
///@arg radius
///@arg xscale
///@arg yscale
///@arg transparency
///@arg [image_index]
///@arg [angle]
function draw_pie_spr_ext(_x, _y, _value, _sprite, _radius, _xscale, _yscale, _transparency, _img_index = 0, _angle = 180) {
	if(_value <= 0) return;
  
	if (!surface_exists(surface)) 
		if (!is_array(_sprite))
			surface = surface_create(sprite_get_width(_sprite) * _xscale, sprite_get_height(_sprite) * _yscale);
		else
			surface = surface_create(sprite_get_width(_sprite[0]) * _xscale, sprite_get_height(_sprite[0]) * _yscale);
  
	surface_set_target(surface);
  
	draw_clear_alpha(0, 0);
	if (!is_array(_sprite))
	{
		var _center_x = (sprite_get_width(_sprite) / 2) * _xscale;
		var _center_y = (sprite_get_height(_sprite) / 2) * _yscale;
	} else {
		var _center_x = (sprite_get_width(_sprite[0]) / 2) * _xscale;
		var _center_y = (sprite_get_height(_sprite[0]) / 2) * _yscale;
	}
  
	gpu_set_colorwriteenable(false, false, false, true);
	//sprite_get_width(_sprite) / 2
	draw_circle(_center_x, _center_y, _radius, false);
	gpu_set_colorwriteenable(true, true, true, false);
	
	if (!is_array(_sprite))
	{
		draw_sprite_ext(_sprite, _img_index, _center_x, _center_y, _xscale, _yscale, 0, c_white, 1);
	} else {
		for (var s = 0; s < array_length(_sprite); s++)
		{
			draw_sprite_ext(_sprite[s], _img_index[s], _center_x, _center_y, _xscale, _yscale, 0, c_white, 1);
		}
	}
	gpu_set_colorwriteenable(true, true, true, true);
	gpu_set_blendmode(bm_subtract);
	var i, len, tx, ty;
  
	if (_value > 1) {
	draw_set_colour(c_white);
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(_center_x, _center_y);
	for (i = _value; i <= 360; i++) {
		tx = lengthdir_x(_radius, _angle + i);
		ty = lengthdir_y(_radius, _angle + i);
		draw_vertex(_center_x + tx, _center_y + ty);
	}
	draw_primitive_end();
	}
  
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
  
	draw_surface_ext(surface, _x, _y, 1, 1, 0, c_white, _transparency);
}
	