//TO WHO IT MAY CONCERN//
//this is the worst code ever written//
//I don't know how it got this bad//
//It was first made when I lived by the programming philosophy of "if it doesn't work, add more parts to it till it does"//
//I'm sorry in advance...//
//- Caleb//

depth = Oshadow.depth - 1;
if (instance_exists(Otextbox)){ depth = Otextbox.depth - 1; }
x = camera_get_view_x(view_camera[0]) + 16;
y = camera_get_view_y(view_camera[0]) + 32;
visible = false;

menu_xscale = 0;
menu_yscale = 0;
menu_frame = 0;

sided = true;

downtrack = 0;
curs_x_track = 1;
curs_y_track = 0;


for (var i = 0; i < 4; i++)
	sidebox_x[i] = round((x + 64) - (sprite_get_width(Spausemenu)/2) + 2);

side_itembox_index = 0;
side_stashitembox_index = 0;
side_gearbox_index = 0;
side_exitbox_index = 0;


//Items Menu
menu[0, 0] = "Items";
menu[0, 1] = "???";
menu[0, 2] = "???";
menu[0, 3] = "???";
menu[0, 4] = "???";
menu[0, 5] = "???";
menu[0, 6] = "???";
menu[0, 7] = "???";
menu[0, 8] = "???";
menu[0, 9] = "???";
menu[0, 10] = "???";
menu[0, 11] = "???";
menu[0, 12] = "???";

itembox_row_y[0] = y - 29;
itembox_row_y[1] = y - 2;
itembox_row_y[2] = y + 23;
itembox_row_y[3] = y + 48;
keeprowy = itembox_row_y[0];

itembox_row_y_moving_d = false;
itembox_row_y_moving_u = false;

active_box = 0;

itembox_index = 0;

max_item_boxes = 8;

//Stash Items Menu
stash_itembox_row_y[0] = y - 29;
stash_itembox_row_y[1] = y - 2;
stash_itembox_row_y[2] = y + 23;
stash_itembox_row_y[3] = y + 48;
stash_keeprowy = stash_itembox_row_y[0];

stash_itembox_row_y_moving_d = false;
stash_itembox_row_y_moving_u = false;

stash_active_box = 0;

stash_itembox_index = 0;

max_stash_item_boxes = 6;

//Settings Menu
menu[1, 0] = "Settings";

item_surface = -1;
stash_item_surface = -1;
setting_surface = -1;
sandq_surface = -1;

setting_row_y[0] = y - 31;
setting_row_y[1] = y - 12;
setting_row_y[2] = y + 7;
setting_row_y[3] = y + 26;
setting_keeprowy = setting_row_y[0];

setting_row_y_moving_d = false;
setting_row_y_moving_u = false;

setting_index = 0;
setting_state = 0;

vol_knob_x = (x + 64 - (sprite_get_width(Spausemenu)/2) + 3) - 34;
vol_knob_y = y - 17;
volarrow_frm = 0;
vol_range = (sprite_get_width(Svolume_meter) - 2) - ((x + 64 - (sprite_get_width(Spausemenu)/2) + 3) - 34);

doonce = true;

flsrc_xmod = 0;

if (global.settings.font = global.font_classic)
{
	font_text = "CLASSIC";
} else {
	font_text = "CLEAN";
}
font_col = white_col;
font_arrows_frm = 0;


if (global.settings.battle_control_hold)
{
	atkstyle_text = "HOLD";	
} else {
	atkstyle_text = "MASH";	
}
atkstyle_col = white_col;

//Save & Quit Menu
sq_col[0] = white_col;
sq_col[1] = white_col;

box_imgindex[0] = 0;
box_imgindex[1] = 0;

save_check = false;

saved = false;

wait_a_frame = 0;
wait_a_frame_tres = 30;

load_settings();