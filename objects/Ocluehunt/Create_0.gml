surface = -1;
GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();

cluehunt_active = false;

firsttimemenonosnotmyfirsttime = true;

beat = 0;
beat_time_length = 1;
beat_time = -1;
beating = false;

spr_index = 0;
spr_index_base = 0;
mglass_y_mod = 0;

player_x = 0;
player_y = 0;

wait_a_frame = 1;

trans_to_battle = false;
mglass_xscale = 0;
mglass_yscale = 0;
mglass_rot = 0;


bug_trans = false;
bug_x = 0;
bug_y = 0;

type_to_transfer = 0;
mini_order = [];
mini_order_config = [];
old_room = room;
old_x = -1;
old_y = -1;

mglass_index = -1;

spotlighted = false;


timer_path = 0;
timer_scale = 0;

countdown_texted = 0;

mglasstrans_sfx = false;

bigsparkboss_intro = false;
bigsparkboss_intro_skip = false;

activate_cluehunt = false;

item_held = noone;