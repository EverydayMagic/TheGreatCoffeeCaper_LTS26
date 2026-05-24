if (instance_exists(Oclawdine))
{
	if ((Oclawdine.sprite_index = Sclawdine_slash) && (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0))
	{
		if (Oclawdine.image_index >= 2 && Oclawdine.image_index <= 3)
		{
			play_sfx(snd_throwing, 1, 2); 
			
			stick_shake = true;
			x = stick_start_x;
			stick_shake_magnitude = 0.5;
			stick_shake_time = 5;
			stick_xval = 0;
		}
		
		//depth = Oclawdine.depth + 1;
	}
}

//if (instance_exists(Oladder))
//	depth = Oladder.depth - 1;
depth = -y;

if (stick_shake)
{
	stick_shake_time -= 1;
	
	if (stick_xval <= 0) { stick_xval = stick_shake_magnitude; } else { stick_xval = -stick_shake_magnitude; }
	
	x = stick_start_x + stick_xval;
	
	if (stick_shake_time <= 0)
	{
		stick_shake_magnitude -= stick_shake_fade;
		
		if (stick_shake_magnitude <= 0)
		{
			x = stick_start_x;
			
			stick_shake = false;
		}
	}
}



if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.OPEN_UP_BANDITS] = 0)
{
	if (!instance_exists(Otextbox))
	{
		if (instance_exists(Ointeractbox))
		{
			if (place_meeting(x, y, Ointeractbox))
			{
				create_textbox("logoutsideclawdines");	
			}
		}
	}
}










