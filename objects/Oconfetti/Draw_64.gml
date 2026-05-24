//spotlight background
if (!surface_exists(global.confetti_surface)) {
	global.confetti_surface = surface_create(GUI_W, GUI_H);
}

surface_set_target(global.confetti_surface); {
	draw_clear(darkbrown_col);
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(Smooshspotlight, 0, Omooshmushroom.x * 2, Omooshmushroom.y * 2, 2, 2, 0, c_white, 1);
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
}
if (drawit){ draw_set_alpha(0.5); } else { draw_set_alpha(0); }
draw_surface(global.confetti_surface, 0, 0);
draw_set_alpha(1);


draw_self();
















