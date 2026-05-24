if (instance_exists(Oplayer))
{
	switch(round(Oplayer.direction))
	{
		case (0):
			image_angle = 0;
			x = Oplayer.x;
			y = Oplayer.y + 1;
		break;
		
		case (90):
			image_angle = 90;
			x = Oplayer.x;
			y = Oplayer.y;
		break;
	
		case (180):
			image_angle = 180;
			x = Oplayer.x;
			y = Oplayer.y + 1;
		break;
	
		case (270):
			image_angle = -90;
			x = Oplayer.x;
			y = Oplayer.y;
		break;
	}
} else instance_destroy();










