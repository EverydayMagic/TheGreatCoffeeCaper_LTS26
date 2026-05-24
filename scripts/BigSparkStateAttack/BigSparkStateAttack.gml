function BigSparkStateAttack(){
	if (atk_chosen = 0)
	{
		switch (atk_performed)
		{
			case 0:
				atk_chosen = BigSparkStateAtk_Zoom;
			break;
			
			case 1:
				burp_max_shots = choose(2, 3);
				atk_chosen = BigSparkStateAtk_Burp;
			break;
			
			case 2:
				atk_chosen = BigSparkStateAtk_Zoom;
			break;
			
			case 3:
				burp_max_shots = choose(3, 4);
				burp_explode_range = [75, 105];
				atk_chosen = BigSparkStateAtk_Burp;
			break;
			
			case 4:
				laugh_next_state = BigSparkStateAttack;
				atk_chosen = BigSparkStateLaugh;
				atk_performed++;
			break;
			
			case 5:
				atk_chosen = BigSparkStateAtk_DVD;
			break;
			
			//first tired
			case 6:
				atk_chosen = BigSparkStateTired;
			break;
			
			case 7:
				preburp_time = 30;
				burp_max_shots = choose(2, 3);
				atk_chosen = BigSparkStateAtk_Burp;
			break;
			
			case 8:
				zoom_travel_time = 7;
				atk_chosen = BigSparkStateAtk_Zoom;
			break;
			
			case 9:
				zoom_travel_time = 5;
				zoom_shoot_time = 10;
				zoom_max_shots = 2;
				atk_chosen = BigSparkStateAtk_Zoom;
			break;
			
			case 10:
				burp_max_shots = 5;
				burp_explode_range = [90, 120];
				atk_chosen = BigSparkStateAtk_Burp;
			break;
			
			case 11:
				zoom_travel_time = 5;
				zoom_shoot_time = 10;
				zoom_max_shots = 6;
				zoom_warning_block_time = 5;
				atk_chosen = BigSparkStateAtk_Zoom;
			break;
			
			//second tired
			case 12:
				atk_chosen = BigSparkStateTired;
			break;
			
			case 13:
				preburp_time = 20;
				burp_max_shots = choose(4, 5);
				atk_chosen = BigSparkStateAtk_Burp;
			break;
			
			case 14:
				laugh_time = 10;
				laugh_next_state = BigSparkStateAttack;
				atk_chosen = BigSparkStateLaugh;
				atk_performed++;
			break;
			
			case 15:
				dvd_wind_up_time = 10;
				atk_chosen = BigSparkStateAtk_DVD;
			break;
			
			case 16:
				preburp_time = 5;
				burp_max_shots = choose(4, 5);
				atk_chosen = BigSparkStateAtk_Burp;
			break;
			
			case 17:
				zoom_travel_time = 5;
				zoom_shoot_time = 10;
				zoom_max_shots = 2;
				zoom_warning_block_time = 5;
				atk_chosen = BigSparkStateAtk_Zoom;
			break;
			
			//third tired
			case 18:
				tired_time = 10 * FRAME_RATE;
				atk_chosen = BigSparkStateTired;
			break;
		}
	}
	
	state = atk_chosen;
	
	//show_debug_message("next state: " + string(laugh_next_state));
	//show_debug_message("state: " + string(state));
	//show_debug_message("atk performed: " + string(atk_performed));
}