function SparkStateLocked(){
	
	//do nothing
	moving = false;
	bouncing = false;
	opening = false;
	alarm[1] = -1;

	if (!global.battle_lock)
	{
		//resume run away path if needed
		if (old_state = SPARK_STATE_RUNAWAY)
		{
			//prepare path
				if (path_exists(path)){ path_delete(path); }
				path = path_add();
			//resume run away path
				mp_grid_path(Ocluebattle_manager.clue_battle_grid, path, x, y, target_x, target_y, true);
				path_start(path, spd * 1.5, path_action_stop, true);
		}
		state = old_state;
	}
}