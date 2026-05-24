sprite_index = choose(Ssparksend_big, Ssparksend_small);

//path
path = path_add();

target_x = Ocluebattle_sparkmeter.x + 4;
target_y = Ocluebattle_sparkmeter.y + 8;

moving = false;

alarm[0] = 1;

brownwheel_value_togive = 0;

spd = 4;

depth = Ocluebattle_cluereward.depth - 1;

image_xscale = Omglass.image_xscale;
image_yscale = Omglass.image_yscale;