
switch (beat)
{

	case 0:
		
		//initial growth
		if (xscale < target_scale)
		{
			var _xtar = target_scale;
			if (text = "GO!"){ _xtar = target_scale + go_xscale; }
			
			xscale += _xtar/grow_time;
			yscale += target_scale/grow_time;

		} else beat++;
		
	break;
	
	case 1:
		
		//fade
		if (alpha > 0)
		{
			alpha -= 1/fade_time;	
		} else beat++;
		
	break;
	
	case 2:
		alpha = 0;
		instance_destroy();
	break;

}


















