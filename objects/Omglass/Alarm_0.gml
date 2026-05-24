/// @description invincible blinking
sprite_index = Smglass_battle_hurt;

if (image_alpha = 1)
	image_alpha = 0.5;
else
	image_alpha = 1;

if (!global.battle_lock){ iframes_run++; }

//loop
if (iframes_run < 12)
{
	alarm_set(0, 5);
} else {
	invincible = false;
	iframes_run = 0;
	sharded = false;
	image_alpha = 1;
	sprite_index = Smglass_battle;
}
















