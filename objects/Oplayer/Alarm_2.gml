///@description invincible blinker
if (image_alpha < 1){ image_alpha = 1; } else { image_alpha = 0; }
invincible_blink++;

if (invincible_blink < 8)
{
	alarm_set(2, 2);	
} else {
	invincible_blink = 0;
	image_alpha = 1;
}