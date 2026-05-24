//creating grid
	clue_battle_grid = mp_grid_create(0, 0, room_width/4, room_height/4, 4, 4);
//create different grid for the sparklesends cause the other one has that area blocked off
	sparklesend_grid = mp_grid_create(0, 0, room_width/4, room_height/4, 4, 4);

//adding blocked off instances to grid
	mp_grid_add_instances(clue_battle_grid, Ocluebattle_timer, false);
	mp_grid_add_rectangle(clue_battle_grid, 32, 122, room_width, room_height);

background = -1;
//change bg based on room we were in
for (var i = 0; i < array_length(global.insiderooms); i++)
{
	if (global.insiderooms[i] != Ocluehunt.old_room)
	{
		background = Sbattlebg_grass;
	} else {
		background = Sbattlebg_wood;
		break;
	}
}

spark_ids = [];

depth = 999;

battle_minigame_order = [];
battle_minigame_order_config = [];
battle_minigame_order_data = [];
battle_minigame_step = 0;

//enemie_data = [];
//runaway_data = [];
//obstacle_data = [];
//decoration_data = [];

global.battleActive = true;

create_battle_insts = false;

item = "";

battle_started = false;

beating = false;
beat = 0;
mglass_path = -1;