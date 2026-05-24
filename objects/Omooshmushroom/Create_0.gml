//sprites
idle_spawn_spr = Smoosh_spawn;
idle_spr = Smoosh_idle;
idle_side_spr = Smoosh_idleside;
idle_kick_spr = Smoosh_kick;
idle_jumpkick_spr = Smoosh_jumpkick;
idle_spin_spr = Smoosh_spin;
idle_splits_spr = Smoosh_splits;
idle_splits_confetti_spr = Smoosh_splits_confetti;


image_speed = 0;

holdTime = 0;

if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_MOOSH] = 0)
{
	//starting at zero for first discovery
	image_alpha = 0;
}

start_act = false;

instance_create_depth(0, 0, 0, Omooshmushroom_shadow);

col = noone;

//confetti_ytrack = 0;

//with (instance_create_depth(119, 0, depth, Oconfetti))
//	drawit = true;
//confetti_ytrack++;
