/// @description fade out

if (image_alpha > 0)
{
	image_speed = 1;
	image_alpha -= 1/8;
	alarm_set(1, 1);
} else {
	image_alpha = 0;	
	instance_destroy();
}

















