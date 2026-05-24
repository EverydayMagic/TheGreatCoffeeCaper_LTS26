path_delete(path);
path = path_add();

if (global.battle_result = true)
{
	target_x = 150 * 2;
	target_y = 134 * 2;
}

mp_linear_step(target_x, target_y, spd, false);

if (x != target_x || y != target_y){ moving = true; } else { moving = false; }



//loop
alarm_set(0, 1);











