var _player = noone;

if (instance_exists(Oplayer))
{
	_player = Oplayer	
} else if (instance_exists(Ohoots_cutscene)) {
	_player = Ohoots_cutscene	
}


if (!instance_exists(Omooshmushroom)){ instance_destroy(); exit; }

if (instance_exists(Omooshmushroom))
{
	if ((Omooshmushroom.sprite_index = Smoosh_spawn && Omooshmushroom.image_index < 2) || (Omooshmushroom.sprite_index = Smoosh_spawn_reverse && Omooshmushroom.image_index >= 2))
	{
		visible = true;
		x = Omooshmushroom.x;
		y = Omooshmushroom.y;
	} else {
		visible = false;	
	}
}

if (instance_exists(Omooshmushroom))
{
	depth = Omooshmushroom.depth + 10;	
}


















