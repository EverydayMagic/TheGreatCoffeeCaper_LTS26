x = round(x);
y = round(y);

if (!instance_exists(parent)){ exit; }

check_obj = [ Ocol, Ocluebattle_obs_uni_col, Ocluebattle_timer, Ocluebattle_sparkmeter, Ocluebattle_cluereward, Ocluebattle_brownbar ];

var _sparkstaterun = SparkStateRunAway;
var _sparkstatebounce = SparkStateBounce;

if (parent.state = _sparkstaterun || parent.state = _sparkstatebounce)
{
	if (parent.running_away || parent.bouncing)
	{
		if (x != parent.target_x && y != parent.target_y)
			safe_path = false;	
	}
	
	if (x = parent.x && y = parent.y && safe_path)
	{
		//reset	all col checkers
		var _par = parent;
		with (Ospark_checkcol)
		{
			if (parent = _par)
			{
				x = parent.x + xmod;
				y = parent.y + ymod;
	
				for (var i = 0; i < array_length(check_obj); i++)
				{
					//if (check_obj[i] = Ocluebattle_obstacle){ check_obj[i].old_mask = check_obj[i].mask_index; check_obj[i].mask_index = check_obj[i].sprite_index; }
					if (place_meeting(x, y, check_obj[i]))
					{
						safe_path = false;
						image_index = 1;
						break;
					} else {
						safe_path = true;
						image_index = 0;
					}
					//if (check_obj[i] = Ocluebattle_obstacle){ check_obj[i].mask_index = check_obj[i].old_mask; }
				}

				
			}
		}
	}

} else {
	
	//constant updating
	x = parent.x + xmod;
	y = parent.y + ymod;
	
	
	for (var i = 0; i < array_length(check_obj); i++)
	{
		//if (check_obj[i] = Ocluebattle_obstacle){ check_obj[i].old_mask = check_obj[i].mask_index; check_obj[i].mask_index = check_obj[i].sprite_index; }
		if (place_meeting(x, y, check_obj[i]))
		{
			safe_path = false;
			image_index = 1;
			break;
		} else {
			safe_path = true;
			image_index = 0;
		}
		//if (check_obj[i] = Ocluebattle_obstacle){ check_obj[i].mask_index = check_obj[i].old_mask; }
	}
	
}


if (safe_path)
	image_index = 0;
else
	image_index = 1;






