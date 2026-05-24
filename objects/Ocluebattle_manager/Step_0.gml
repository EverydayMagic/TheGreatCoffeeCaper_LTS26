////spawn sparks
if (!Ocluehunt.trans_to_battle && !battle_started )
{
	start_clue_battle();	
	battle_started = true;
}

if (array_length(spark_ids) > 0 && !instance_exists(Ospark_enemy) && battle_started) //minigame done
{
	if (battle_minigame_step < (array_length(battle_minigame_order) - 1)) //more minigames to play
	{
		switch (beat)
		{
			case 0:
				//clean up everything
				with (Ocluebattle_obstacle){ instance_destroy(); }
				with (Ocluebattle_decoration){ instance_destroy(); }
				with (Ospark_pathpoint){ instance_destroy(); }
				
				beat++;
			break;
			
			case 1:
				//move mglass to center
				if (!path_exists(mglass_path))
				{
					mglass_path = path_add();
					path_set_closed(mglass_path, false);
					path_add_point(mglass_path, Omglass.x, Omglass.y, 100);
					path_add_point(mglass_path, room_width/2, room_height/2, 100);
					with (Omglass){ path_start(Ocluebattle_manager.mglass_path, 10, path_action_stop, true); }
				}
				
				if (Omglass.path_position < 1)
				{
					//rotate
					if ((Omglass.image_angle + 360/(path_get_length(mglass_path)/Omglass.path_speed)) < 360)
					{
						Omglass.image_angle += 360/(path_get_length(mglass_path)/Omglass.path_speed);
					} else {
						Omglass.image_angle = 360;
					}
					
					//scale
					var _newscale = 2;
					if (string_starts_with(battle_minigame_order[battle_minigame_step + 1], "maze"))
					{
						_newscale = 1;	
					}
					var _scale = _newscale - Omglass.image_xscale;
					Omglass.image_xscale += _scale/(path_get_length(mglass_path)/Omglass.path_speed);
					Omglass.image_yscale += _scale/(path_get_length(mglass_path)/Omglass.path_speed);
					
				} else {
					//angle
					Omglass.image_angle = 0;
					
					//scale
					var _scale = 2;
					if (string_starts_with(battle_minigame_order[battle_minigame_step + 1], "maze"))
					{
						_scale = 1;	
					}
					Omglass.image_xscale = _scale;
					Omglass.image_yscale = _scale;
					
					path_delete(mglass_path);
					
					beat++;
				}
			break;
			
			case 2:
				//now at center, start next minigame
				battle_minigame_step++;
				battle_started = false;
				spark_ids = [];
				beating = false;
				beat = 0;
			break;
		}
	}
}	

//show_debug_message("battle list: " + string(battle_minigame_order));
//show_debug_message("battle data:\n" + string(battle_minigame_order_data));
//show_debug_message("battle config: " + string(battle_minigame_order_config));

//if (battle_started)
//{


//}

/*
if (!battle_started && !Ocluehunt.trans_to_battle)
{
	if (battle_type != global.item_list.hammer)
	{
		start_clue_battle(battle_type);
	} else {
		create_battle_insts = false;
		battle_started = true;
	}
}



//battle tutorial stuff
if (global.battleTutorial[2] = true) //tell the player to bump sparks out of safety
{
	if (battle_started && !Ocluehunt.trans_to_battle && instance_exists(Ospark_enemy))
	{
		if (Ospark_enemy.state = SparkStateSafe)
		{
			global.battle_lock = true;
			create_textbox("bumpspark_battletutorial", true);
		}
	}
}

//big spark boss intro
if (Ocluehunt.bigsparkboss_intro && battle_type = global.item_list.hammer)
{
	global.battle_lock = true;
	switch (beat)
	{
		case 0:
			if (alarm[0] = -1){ alarm[0] = 30; }
		break;
		
		case 1:
			if (!instance_exists(Otextbox))
			{
				if (!Ocluehunt.bigsparkboss_intro_skip){ create_textbox("bigsparkboss_intro"); }
				beat++;
			}
		break;
		
		case 2:
			if (!instance_exists(Otextbox))
			{
				beat++;	
			}
		break;
		
		case 3:
			if (!instance_exists(Obigsparkboss))
			{
				instance_create_depth(0, 0, Omglass.depth, Obigsparkboss);
				beat++;
			}
		break;
		
		case 4:
			if (alarm[0] = -1){ alarm[0] = 45; }
		break;
		
		case 5:
			if (Obigsparkboss.state = BIGSPARK_STATE_IDLE)
			{
				Obigsparkboss.state = BigSparkStateLaugh;
				beat++;
			}
		break;
		
		case 6:
			if (alarm[0] = -1){ alarm[0] = 20; }
		break;
		
		case 7:
			if (!instance_exists(Otextbox))
			{
				if (!Ocluehunt.bigsparkboss_intro_skip)
				{
					create_textbox("bigsparkboss_intro2");
					beat++;
				} else {
					beat = 9;	
				}
			}
		break;
		
		case 8:
			if (!instance_exists(Otextbox))
			{
				beat++;	
			}
		break;
		
		case 9:
			if (Obigsparkboss.state = BIGSPARK_STATE_IDLE)
			{
				Obigsparkboss.state = BigSparkStateAttack;
				global.battle_lock = false;
				Ocluehunt.bigsparkboss_intro = false;
				beat++;
			}
		break;
	}
	
}

