if (char = noone){ shake = false; }

if (shake)
{
	if (array_length(old_x) <= 0)
	{
		for (var c = 0; c < array_length(char); c++)
		{
			array_push(old_x, char[c].x);
			array_push(old_y, char[c].y);
		}
	}
	
	if (waitfortext)
	{
		if (instance_exists(Otextbox))
			exit;
		else
			waitfortext = false;
	}
	
	if (delay_const = 0) delay_const = delay;
		
	if (delay > 0)
	{
		delay--;
		exit;
	}
	
	if (shake_time != "infin")
		shake_time -= 1;
	
	if (xval <= 0) { xval = shake_magnitude; } else { xval = -shake_magnitude; }
	if (yval <= 0) { yval = shake_magnitude; } else { yval = -shake_magnitude; }

	var _check_inst = false;
	if (is_array(char))
	{
		for(var i = 0; i < array_length(char); i++)
		{
			if (instance_exists(char[i])){ _check_inst = true; } else { _check_inst = false; break; }	
		}
	} else {
		if (instance_exists(char)){ _check_inst = true; }	
	}
	if (_check_inst)
	{
		switch (dir)
		{
			case "vert":
				if (is_array(char))
				{
					for(var i = 0; i < array_length(char); i++)
					{
						char[i].y = old_y[i] + yval;	
					}
				} 
			break;
			case "horz":
				if (is_array(char))
				{
					for(var i = 0; i < array_length(char); i++)
					{
						char[i].x = old_x[i] + xval;	
					}
				}
			break;
			default:
				if (is_array(char))
				{
					for(var i = 0; i < array_length(char); i++)
					{
						char[i].y = old_y[i] + yval;	
						char[i].x = old_x[i] + xval;
					}
				}
			break;
		}
	}
	
	if (shake_time != "infin")
	{
		if (shake_time <= 0)
		{
			shake_magnitude -= shake_fade;
		
			if (shake_magnitude <= 0)
			{
				if (_check_inst)
				{
					switch (dir)
					{
						case "vert":
							if (is_array(char))
							{
								for(var i = 0; i < array_length(char); i++)
								{
									char[i].y = old_y[i]// + yval;	
								}
							}
						break;
						case "horz":
							if (is_array(char))
							{
								for(var i = 0; i < array_length(char); i++)
								{	
									char[i].x = old_x[i]// + xval;
								}
							}
						break;
						default:
							if (is_array(char))
							{
								for(var i = 0; i < array_length(char); i++)
								{
									char[i].y = old_y[i]// + yval;	
									char[i].x = old_x[i]// + xval;
								}
							} 
						break;
					}
				}

				char = noone;
				shake_time = 0;
				
				old_x = [];
				old_y = [];
				if (global.cutsceneActive = true && cut_dontadd != true)
					add_move_order();
					
				cut_dontadd = false;
			}
		}
	}
	delay = delay_const;
} else {
	old_x = [];
	old_y = [];
}




