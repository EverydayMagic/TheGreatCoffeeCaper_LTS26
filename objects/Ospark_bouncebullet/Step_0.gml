//go towards wall
var _v_check = true;
var _h_check = true;
if ((bbox_bottom > room_height - 16) || (bbox_top < 0) || (place_meeting(x, y + vspeed, Ocol)))
{
	_v_check = false;
}
if ((bbox_right > room_width) || (bbox_left < 0) || (place_meeting(x + hspeed, y, Ocol)))
{
	_h_check = false;
}

if (alarm[0] = -1 && !babied){ alarm[0] = 60; }

image_angle += 360/FRAME_RATE * rot_change;

motion_set(direction, spd);


if (!_v_check || !_h_check)
{

	if (bounce_count < 2)
	{
		//go in different direction
		direction = -direction;
		
		rot_change *= -1;
		
		bounce_count++;
	}
}
















