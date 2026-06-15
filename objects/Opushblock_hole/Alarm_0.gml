///@description wait after hoots fall
sprite_index = Spushblock_hole;
image_index = 0;
image_speed = 0;
full_by = noone;
full = false;
if (instance_exists(Opartypoint))
{
	Oplayer.x = Opartypoint.x;
	Oplayer.y = Opartypoint.y;
	Oplayer.sprite_index = Splayer_capidle;
	Oplayer.image_index = 3;
}
Oplayer.visible = true;
Oplayer.state = PlayerStateFree;
Opartypoint_manager.reset_points();
with (Opushblock_hole){ alarm[1] = 15; }
Oplayer.alarm[2] = 1;