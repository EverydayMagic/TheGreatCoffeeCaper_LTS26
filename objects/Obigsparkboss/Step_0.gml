
mask_index = Sbigsparkbullet_body;

if (emotion != "laugh")
{
	//stop laugh sfx
	if (audio_is_playing(snd_bigsparklaugh)){ audio_stop_sound(snd_bigsparklaugh); }	
}

//face change
face_xscale = 1;
face_yscale = 1;
switch (emotion)
{
	case "laugh":
		face = Sbigsparkboss_laughface;
		face_dir += sprite_get_speed(face)/FRAME_RATE;
	break;
	case "happy":
		face_dir = 0;
		face = Sbigsparkboss_smileface;
		sweat_index = 0;
	break;
	case "sneer":
		face_dir = 0;
		face = Sbigsparkboss_sneerface;
	break;
	case "sneer open":
		face_dir = 1;
		face = Sbigsparkboss_sneerface;
	break;
	case "preburp":
		face = Sbigsparkboss_bubbleface;
		if (face_dir < (sprite_get_number(face) - 1))
		{
			face_dir += sprite_get_speed(face)/FRAME_RATE;
		}
	break;
	case "burp":
		face = Sbigsparkboss_burpface;
		face_dir = 0;
	break;
	case "tired":
		face = Sbigsparkboss_tiredface;
		face_dir += sprite_get_speed(face)/FRAME_RATE;
		sweat_index += sprite_get_speed(Ssweat)/FRAME_RATE;
	break;
	case "scared":
		face = Sbigsparkboss_scaredface;
		face_dir = 0;
		sweat_index = 0;
	break;
}

if (hp_current <= 0 || global.battle_result = 1)
{
	if (alarm[6] != -1){ alarm[6] = -1; }
		
	if (image_alpha > 0)
	{
		y--;
		image_alpha -= 1/16;
	} else {
		visible = false;
		instance_destroy();
	}
}

if (global.battle_result != 0 && global.battle_result != 2)
	script_execute(state);
















