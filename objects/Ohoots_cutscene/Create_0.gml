//Cutscene Variables
cut_fadebox_alpha = 0;

idle_nocap_spr = Splayer_idle;
idle_lookdown_nocap_spr = Splayer_readbook;
walk_l_spr = Splayer_nocap_walk_l;
walk_r_spr = Splayer_nocap_walk_r;
walk_u_spr = Splayer_nocap_walk_u;
walk_d_spr = Splayer_nocap_walk_d;
bed_awake_spr = Shoots_bed_awake;
bed_asleep_spr = Shoots_bed_sleep;
idle_knockout_spr = Shoots_knockout;

idle_cap_spr = Splayer_capidle;
walk_l_cap_spr = Splayer_capwalk_l;
walk_r_cap_spr = Splayer_capwalk_r;
walk_u_cap_spr = Splayer_capwalk_u;
walk_d_cap_spr = Splayer_capwalk_d;

idle_cap_sit_spr = Splayer_capsit;
idle_cap_sit_sleep_spr = Splayer_capsit_sleep;
idle_cap_sit_yawn_spr = Splayer_capsit_yawn;

idle_cap_hoist_spr = Splayer_caphoist;
idle_cap_hoist_shock_spr = Splayer_caphoist_shock



moveOrder = 0;
holdTime = 0;

if (instance_exists(Oplayer))
{
	sprite_index = Oplayer.sprite_index;
	image_index = Oplayer.image_index;
	direction = Oplayer.direction;
	image_speed = 0;
}





//character recording to give to player
array_size_togive = 50; //the amount of positions to record

//pos_x_togive = [];
//pos_y_togive = []; 
	
//toRecordSprite_togive = [];
//toRecordImageIndex_togive = [];
//toRecordImageSpeed_togive = [];
//toRecordDepth_togive = [];

for (var i = array_size_togive - 1; i >= 0; i--){
	
	//pos_x_togive[i] = x;
	//pos_y_togive[i] = y; 
	
	pos_x[i] = x;
	pos_y[i] = y; 
	
	toRecordSprite_togive[i] = Splayer_idle;
	toRecordImageIndex_togive[i] = image_index;
	toRecordImageSpeed_togive[i] = image_speed;
	
}
pm_backup = false;

begin_record = false;
recorded = false;

tree_id = noone;
old_depth = depth;

depth_manual = false;