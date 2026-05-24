if (alpha = -1)
{
	
}

switch (fade_type)
{
	
	case "out":
		
		if (alpha > 0)
		{
			alpha -= (1/30);
		} else instance_destroy();
		
	break;
	
	case "in":
		
		if (alpha < 1)
		{
			alpha += (1/30);
		} else instance_destroy();
		
	break;
	
	
}


















