if (room = Rcluebattle && trans_to_battle && instance_exists(Ocluebattle_manager))
{
	show_debug_message("mini order: " + string(mini_order));
	show_debug_message("mini order config: " + string(mini_order_config));
	Ocluebattle_manager.item = type_to_transfer;
	if (array_length(mini_order) > 0){ Ocluebattle_manager.battle_minigame_order = mini_order; }
	if (array_length(mini_order_config) > 0){ Ocluebattle_manager.battle_minigame_order_config = mini_order_config; }
}

if (room = old_room)
{
	instance_activate_object(Oplayer);
	Oplayer.x = old_x;
	Oplayer.y = old_y;
	mglasstrans_sfx = false;
}

activate_cluehunt = false;
alarm[2] = 2;














