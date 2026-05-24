motion_set(direction, spd);
var _boss = Obigsparkboss;

if (bbox_bottom > room_height - 16 || bbox_top < 0)
{
	//if only moving in one direction
	var _onedir = (x = xprevious) || (y = yprevious);
	var _dirchange = 90 + (90 * _onedir);
	direction += _dirchange;
	
	//play sfx
	play_sfx(snd_bumpwall);
	
	if (alarm[0] = -1){ alarm[0] = irandom_range(_boss.burp_explode_range[0], _boss.burp_explode_range[1]); }
}

if (bbox_right > room_width || bbox_left < 0)
{
	//if only moving in one direction
	var _onedir = (x = xprevious) || (y = yprevious);
	var _dirchange = 90 + (90 * _onedir);
	direction += _dirchange;
	
	//play sfx
	play_sfx(snd_bumpwall);
	
	if (alarm[0] = -1){ alarm[0] = irandom_range(_boss.burp_explode_range[0], _boss.burp_explode_range[1]); }
}


if (alarm[0] <= 10 && alarm[0] != -1){ image_speed = 1; }

//hit mglass
if (place_meeting(x, y, Omglass))
{
	if (Omglass.invincible = false)
	{		
		Omglass.bullet_parent = Obigsparkboss;
		Omglass.damage_taken = damage;
		with (Omglass)
		{
			//sound effect
			play_sfx(snd_smallglassshatter);
			
			invincible = true;
			alarm[0] = 1; //invincible blinking
		}
		exit;
	}
}














