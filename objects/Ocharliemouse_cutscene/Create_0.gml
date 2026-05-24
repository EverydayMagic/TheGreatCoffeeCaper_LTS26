moveOrder = 0;
holdTime = 0;

idle_spr = Scmouse_idle;
walk_l_spr = Scmouse_walkl;
walk_r_spr = Scmouse_walkr;
walk_u_spr = Scmouse_walkb;
walk_d_spr = Scmouse_walkf;
idle_talk_spr = Scmouse_talkf;
idle_side_talk_spr = Scmouse_talkside;
idle_interrogate_spr = Scmouse_interrogate;
dash_spr = Scmouse_dash;
idle_interrogate_bean_spr = Scmouse_interrogatebean;
idle_embarrassed_red_spr = Scmouse_embarrassed_red;
idle_embarrassed_red_side_spr = Scmouse_embarrassed_red_side;
idle_embarrassed_capdown_spr = Scmouse_embarrassed_cap;
idle_distressed_front_spr = Scmouse_distressed_front;
idle_distressed_side_spr = Scmouse_distressed_side;
idle_distressed_back_spr = Scmouse_distressed_backward;
idle_sweat_side_spr = Scmouse_sweat_side;
idle_sweat_finger_spr = Scmouse_sweat_finger;
idle_think_spr = Scmouse_think;

if (instance_exists(Ocharliemouse))
{
	sprite_index = Ocharliemouse.sprite_index;
	image_index = Ocharliemouse.image_index;
}
image_speed = 0;


tree_id = noone;

old_depth = depth;


depth_manual = false;








