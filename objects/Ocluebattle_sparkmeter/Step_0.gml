//show_debug_message("METER: " + string(brownwheel_value));


if (sparks_collected <= 125 || global.battle_result = true)
{
	global.battle_lock = true;
	global.battle_result = true;
}

//asking manager for spark number each minigame
if (Ocluebattle_manager.battle_started && array_length(Ocluebattle_manager.spark_ids) > 0)
{
	collect_sections = array_length(Ocluebattle_manager.battle_minigame_order);
	spark_num = array_length(Ocluebattle_manager.spark_ids);
}

show_debug_message("spark collected: " + string(sparks_collected));
show_debug_message("brownwheel: " + string(brownwheel_value));
show_debug_message("brownwheel_values: " + string(brownwheel_values));
show_debug_message("brownwheel_index: " + string(brownwheel_index));

blue_bg_img += 16/FRAME_RATE;
sparkles_bg_img += 8/FRAME_RATE;


//if (keyboard_check_pressed(ord("A"))){ xmod--; }
//if (keyboard_check_pressed(ord("D"))){ xmod++; }
//if (keyboard_check_pressed(ord("W"))){ ymod--; }
//if (keyboard_check_pressed(ord("S"))){ ymod++; }
//if (keyboard_check_pressed(ord("1"))){ radmod++; }
//if (keyboard_check_pressed(ord("2"))){ radmod--; }
//if (keyboard_check_pressed(ord("3"))){ wheelmod++; }
//if (keyboard_check_pressed(ord("4"))){ wheelmod--; }

//show_debug_message("xmod: " + string(xmod));
//show_debug_message("ymod: " + string(ymod));
//show_debug_message("radmod: " + string(radmod));
//show_debug_message("wheelmod: " + string(wheelmod));
//show_debug_message("sparkle x: " + string(x));
//show_debug_message("sparkle y: " + string(y));