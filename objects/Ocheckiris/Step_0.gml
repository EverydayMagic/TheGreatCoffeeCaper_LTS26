if (instance_number(Ocheckiris) < 8)
{
	with (instance_create_depth(0, 0, 0, Ocheckiris))
	{
		switch(instance_number(Ocheckiris))
		{
			//down
			case 2:
				if (instance_exists(Otitle_circle))
				{
					x = (Otitle_circle.GUI_W * 2) / 2;
					y = Otitle_circle.GUI_H;	
				}
			break;
			//left
			case 3:
				if (instance_exists(Otitle_circle))
				{
					x = 0;
					y = (Otitle_circle.GUI_H * 2) / 2;	
				}
			break;
			//right
			case 4:
				if (instance_exists(Otitle_circle))
				{
					x = Otitle_circle.GUI_W;
					y = (Otitle_circle.GUI_H * 2) / 2;
				}
			break;
			//NW
			case 5:
				if (instance_exists(Otitle_circle))
				{
					x = Otitle_circle.GUI_W;
					y = (Otitle_circle.GUI_H * 2) / 2;
				}
			break;
		}
	}
}













