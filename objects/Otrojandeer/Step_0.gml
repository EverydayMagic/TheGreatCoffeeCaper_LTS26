keyUp = keyboard_check_pressed(vk_up);
keyDown = keyboard_check_pressed(vk_down);
keyLeft = keyboard_check_pressed(vk_left);
keyRight = keyboard_check_pressed(vk_right);
show_debug_message("DEER POS: " + string(x) + ", " + string(y));
if (!depth_manual && !global.cutsceneActive){ depth = -y; }

//specific cutscene execution
if (global.cutsceneActive && global.story_beat = STORY_PACE.TROJAN_DEER_CONFRONT)
{
	ex_cutscene("Trojan Deer Confront");
}

if (global.cutsceneActive || instance_exists(Ofade) || instance_exists(Omulti_goto)){ exit; }

if (!moving)
{
	start_x = x;
	start_y = y;
	
	xspd = 0;
	yspd = 0;
	
	if (keyUp){ dir = 1; moving = true; }
	if (keyDown){ dir = 3; moving = true; }
	if (keyLeft){ dir = 2; moving = true; }
	if (keyRight){ dir = 0; moving = true; }
}
direction = 90 * dir;

if (moving)
{	
	//change sprite and set speeds
	switch (dir)
	{
		case 0:
			sprite_index = Strojandeer_roll_r;
			xspd = moveSpd;
			yspd = 0;
		break;
		case 1:
			sprite_index = Strojandeer_roll_u;
			xspd = 0;
			yspd = -moveSpd;
		break;
		case 2:
			sprite_index = Strojandeer_roll_l;
			xspd = -moveSpd;
			yspd = 0;
		break;
		case 3:
			sprite_index = Strojandeer_roll_d;
			xspd = 0;
			yspd = moveSpd;
		break;
	}
	
	//check for collision
	if (place_meeting(x + xspd, y + yspd, Ocol))
	{
		xspd = 0;
		yspd = 0;
	}
	
	//create track
	if (alarm[0] = -1){ alarm[0] = track_spawn_time; }
	
	if (!audio_is_playing(snd_woodencartrolling))
	{
		play_sfx(snd_woodencartrolling);	
	}
}

//show_debug_message("exist: " + string(instance_exists(Otrojandeer_tracks)));

//move
if (!instance_exists(Ofade) && !instance_exists(Otextbox) && !global.gamePaused)
{
	x += xspd;
	y += yspd;
}

//after moving, reset and set idle sprite
if (xspd = 0 && yspd = 0)
{
	moving = false;
	
	sprite_index = Strojandeer_idle;
	image_index = dir;
	
	//stop spawning of tracks
	alarm[0] = -1;
	
	//stop sfx
	if (audio_is_playing(snd_woodencartrolling))
	{
		audio_stop_sound(snd_woodencartrolling);	
	}
}

if (instance_exists(Oplayer) && global.story_beat != STORY_PACE.TROJAN_DEER_CONFRONT)
{
	instance_deactivate_object(Oplayer);	
}
if (global.story_beat = STORY_PACE.TROJAN_DEER_CONFRONT)
{
	if (instance_exists(Omulti_goto))
	{
		depth = -y - 13;
		if (x >= 161 && y = 108)
		{
			while (instance_exists(Omulti_goto)){ instance_destroy(Omulti_goto); }
			instance_destroy();
		}
	}
}












