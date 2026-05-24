if (Ocluehunt.cluehunt_active){ exit; }

var _player = Oplayer;
if (!instance_exists(Oplayer))
{
	if (instance_exists(Ohoots_cutscene))
	{
		_player = Ohoots_cutscene;	
	}
}


if (instance_exists(_player))
{
	notalk = _player.y < y;
}

if ((instance_exists(Ointeractbox) || global.cutsceneActive) && !notalk && alarm[0] = -1  && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle)
{
	if (place_meeting(x, y, Ointeractbox) || global.cutsceneActive)
	{
		if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_BOOKWORM] = 1)
		{
			ex_cutscene("Bookworm Again");
		}
	}
}

//"start act" will only be used if it's your first time discovering the bug
if (start_act)
{
	if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_BOOKWORM] = 0)
	{
		ex_cutscene("Meet Bookworm");
	}
}

//telling sign to SHUT UP
var _sign = instance_place(x, y, Osign);
if (instance_exists(_sign))
{
	_sign.bookwormed = true;	
}







