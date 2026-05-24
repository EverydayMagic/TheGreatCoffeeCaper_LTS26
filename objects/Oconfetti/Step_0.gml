

//create confetti
if (instance_number(Oconfetti) < 6)
{
	var _self = self.id
	with(instance_create_depth(119, 0, Omooshmushroom.depth, Oconfetti))
		_self.next_up = self.id;
	Omooshmushroom.confetti_ytrack++;
} else Omooshmushroom.confetti_ytrack = 0;

//move towards ground
y += (79 * 2)/60;
if (image_index >= 3)
{
	if (y >= 0 && move_x)
		x += (x_len/60 * dir) * 2;
} else {
	//if (percent <= 0 && percent < 1) percent += 1/30;
	//if (percent >= 1 && percent > 0) percent -= 1/30;
	percent += 1/30;
	if (percent > 1) percent -= 1;

	position = animcurve_channel_evaluate(curve, percent);

	x = start_x + (4 * position);	
}
if (y >= 79 * 2)
{
	if (drawit)
	{
		//hand off the first variable to some other confetti
		next_up.drawit = true;
		instance_destroy();
		
	} else instance_destroy();
}
















