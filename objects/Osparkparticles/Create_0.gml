p_system = part_system_create_layer("Instances", false);

part1 = part_type_create();

//part_type_sprite(part1, Ssparksend_small, false, false, true);

part_type_shape(part1, ps_shape_rectangle);

part_type_size(part1, 1, 1, 0, 0); 

part_type_scale(part1, 1, 1);

part_type_colour1(part1, white_col);

part_type_alpha3(part1, 0, 1, 0);

part_type_speed(part1, -1, -1, 0.25, 0.1);

part_type_direction(part1, 90, 90, 0, 0); 

part_type_blend(part1, true);

part_type_life(part1, 10, 30);


emitter = part_emitter_create(p_system);
part_emitter_region(p_system, emitter, 80, 96, 64, 80, ps_shape_rectangle, ps_distr_linear);

part_emitter_stream(p_system, emitter, part1, -20);
//alarm[0] = 30;
