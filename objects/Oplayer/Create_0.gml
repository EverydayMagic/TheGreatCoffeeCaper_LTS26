

state = PlayerStateFree;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
walk_spd = 1;

//speedWalkV = 1.15;
//speedWalkH = 1.15;
speedWalkV = 1;
speedWalkH = 1;

spriteWalk = global.playerWalk;
spriteIdle = global.playerIdle;
localFrame = 0;

old_depth = depth;

treed = false;
tree_id = noone;

room_in = room;

in_trojan_deer = true;

//For Character Following
array_size = 50; //the amount of positions to record


var _pm = Opartypoint_manager;
for (var i = array_size - 1; i >= 0; i--){
	
	_pm.pos_x[i] = x;
	_pm.pos_y[i] = y; 
	
	_pm.toRecordSprite[i] = Splayer_idle;
	_pm.toRecordImageIndex[i] = image_index;
	_pm.toRecordImageSpeed[i] = image_speed;
	
}
pm_backup = false;


ibox_create = false;
ibox_timer = 2;

hoots_sleep = false;

hoots_push = false;

hoots_sprint = false;

beat = 0;
beating = 0;
beat_time_length = 0;

pushblock_list = ds_list_create();
closest_block = 0;
closest_dist = 999;

if (Oitem_manager.inv[0] = global.item_list.detective_hat){ global.playerIdle = Splayer_capidle; global.playerWalk = Splayer_capwalk; }