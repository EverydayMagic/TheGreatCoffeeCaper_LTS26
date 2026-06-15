if (instance_exists(feetsies) && instance_exists(parent))
{
	depth = feetsies.depth - 1;
	x = feetsies.x - sprite_width/2;
	y = feetsies.y;
	depth = feetsies.depth - 1;
} else {
	instance_destroy();	
	exit;
}
if (!place_meeting(parent.x, parent.y, feetsies)){ instance_destroy(); }