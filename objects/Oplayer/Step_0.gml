//item_add(global.item_list.hammer);

keyUp = InputCheck(INPUT_VERB.UP);
keyDown = InputCheck(INPUT_VERB.DOWN);
keyLeft = InputCheck(INPUT_VERB.LEFT);
keyRight = InputCheck(INPUT_VERB.RIGHT);
spriteWalk = global.playerWalk;
spriteIdle = global.playerIdle;

speedWalkH = (keyRight - keyLeft) * walk_spd;
speedWalkV = (keyDown - keyUp) * walk_spd;
inputMagnitude = (keyRight-keyLeft != 0) or (keyDown-keyUp != 0);
inputDirection = point_direction(0, 0, keyRight-keyLeft, keyDown-keyUp);

//if (keyboard_check_pressed(vk_enter)){ item_add(global.item_list.love_letter, true); }

//show_debug_message("DIRECTION: " + string(inputDirection));

if (hoots_sleep)
{
	state = PlayerStateSleep;
}

if (Oitem_manager.inv[0].name = "Hoots Hat" && !Ocluehunt.cluehunt_active){ global.playerIdle = Splayer_capidle; global.playerWalk = Splayer_capwalk; }

if (!hoots_sleep)
{
	//if (keyboard_check(ord("X")) && Oladder.ladder = false && !Ocluehunt.cluehunt_active && !global.itemAdding)
	//{
	//	walk_spd = 2;
	//	if (global.playerIdle = Splayer_capidle){ global.playerWalk = Splayer_caprun; } else { global.playerWalk = Splayer_run; }
		
	//} else {
		if (Oladder.ladder = false)
		{
			walk_spd = 1;
			if (!Ocluehunt.cluehunt_active && !global.itemAdding)
				if (global.playerIdle = Splayer_capidle){ global.playerWalk = Splayer_capwalk; } else { global.playerWalk = Splayer_walk; }
		} else {
			if (inputMagnitude != 0)
				sprite_index = spriteWalk;
			else
				sprite_index = spriteIdle;
			direction = 90;
			walk_spd = 0.5;
			if (global.playerIdle = Splayer_capidle){ global.playerWalk = Splayer_capwalk; } else { global.playerWalk = Splayer_walk; }
		}
	//}
}
	
if (!hoots_sleep && !state_manual)
{
	if (instance_exists(Otextbox) || instance_exists(Ofade) || global.gamePaused = true || global.cutsceneActive = true || global.battleActive = true || Ocluehunt.beating = true || global.itemAdding = true || hoots_push || !visible)
		state = PlayerStateLocked;
	else
		state = PlayerStateFree;
}

if (global.cutsceneActive = true)
{
	if (instance_exists(Ocharliemouse))
		global.charlie_follow = false;
		
	visible = false;
	instance_deactivate_object(self);
	
	if (instance_exists(Ocharliemouse))
	{
		Ocharliemouse.visible = false;
		instance_deactivate_object(Ocharliemouse);
	}
}



script_execute(state);

depth = -y;

//For Character Following
var _pm = Opartypoint_manager;
//update pos recording
if (x != xprevious or y != yprevious)
{
	pm_backup = true;
	
	_pm.pos_x[0] = x;
	_pm.pos_y[0] = y;
		
		
	_pm.toRecordSprite[0] = sprite_index;
	_pm.toRecordImageIndex[0] = image_index;
	_pm.toRecordImageSpeed[0] = image_speed;
		
} else pm_backup = false;



	
//if (instance_exists(Ocharliemouse))
//{
//	if (point_distance(x, y, Ocharliemouse.x, Ocharliemouse.y) >= 20)
//	{
//		global.charlie_follow = true;	
//	}
//}

//show_debug_message("POS X: " + string(pos_x));
//show_debug_message("POS Y: " + string(pos_y));


//Interact Box
var _ibox = Ointeractbox;

if (Omenu.visible != true)
{
	if (instance_exists(_ibox) && !instance_exists(Otextbox))
	{
		instance_destroy(_ibox);
		ibox_create = false;
		ibox_timer = 1;
	}

	if (InputPressed(INPUT_VERB.SELECT) && !instance_exists(Otextbox) && !instance_exists(_ibox) && ibox_timer = 0)
	{
		ibox_create = true;	
	} else {
		if (ibox_timer > 0)
			ibox_timer--;
	}

	if (ibox_timer = 0 && ibox_create = true && !instance_exists(Otextbox))
		instance_create_depth(x, y, depth - 1, _ibox);
}


//Sprinting
//if (global.sprinting_unlocked)
//{
	//I'm gonna wait until the sprites are made :)
	
	/*	
	if (instance_exists(Ocharliemouse))
	{
		//make sure we are currently in hoots party
		var _in_party = false;
		for (var p = 0; p < array_length(global.player_party); p++)
		{
			if (global.player_party[p] = Ocharliemouse.id){ _in_party = true; }	
		}
		
		if (_in_party)
		{
			//check for keyboard input
			if (keyboard_check(ord("Z")))
			{
				
			}
		}
	}
	*/
//}

//If Hootsworth Should Be Sleeping
if (!keyboard_check_pressed(vk_anykey) && !keyboard_check(vk_anykey) && !global.cutsceneActive && !instance_exists(Otextbox) && !global.transitioning && !instance_exists(Oitem_reveal) && !global.itemAdding)
{
	if (alarm[0] = -1){ alarm[0] = 300 * FRAME_RATE; }
} else  {
	alarm[0] = -1;
	if (instance_exists(Omenu))
		if (!Omenu.save_check && !global.itemAdding)
			image_speed = 0;
	hoots_sleep = false;
	beat = 0;
	beating = false;
}

//interact with push blocks
if ((instance_exists(Ointeractbox) || hoots_push) && !instance_exists(Otextbox))
{	
	if (instance_exists(Opushblock))
	{
		//find the dir to check for push block
		var _check_dir = CARDINAL_DIR * 90;
		//see if we find a push block
		var _check_x = x + lengthdir_x(1, _check_dir);
		var _check_y = y + lengthdir_y(1, _check_dir);
		if (ds_list_size(pushblock_list) <= 0)
		{
			instance_place_list(_check_x, _check_y, Opushblock, pushblock_list, false);
			
			//manually order the list based on center of block rather than top corner
			closest_block = pushblock_list[| 0];
			closest_dist = 999;
			for (var p = 0; p < ds_list_size(pushblock_list); p++)
			{
				var _block = pushblock_list[| p];
				var _dist = 0;
				with (_block)
				{
					_dist = point_distance(x + sprite_width/2, y + sprite_height/2, Oplayer.x, Oplayer.y);
				}
		        if (_dist < closest_dist)
		        {
		            closest_dist = _dist;
		            closest_block = _block;
		        }	
			}
		}
		
		var _pushblock_id = closest_block;
		
		if ((_pushblock_id != undefined && instance_exists(_pushblock_id) && !_pushblock_id.sliding && !Ocluehunt.cluehunt_active && state = PlayerStateFree) || hoots_push)
		{
			if (!global.gamePaused && !instance_exists(Ofade)){ image_speed = 1; }
			
			if (sprite_index != Splayer_push_side && sprite_index != Splayer_push_forward && sprite_index != Splayer_push_backward)
			{				
				image_xscale = 1;
				image_index = 0;
				//first change our sprite
				switch (CARDINAL_DIR)
				{
					case 0:
						sprite_index = Splayer_push_side;
						image_xscale = -1;
					break;
					case 1:
						sprite_index = Splayer_push_backward;
					break;
					case 2:
						sprite_index = Splayer_push_side;
					break;	
					case 3:
						sprite_index = Splayer_push_forward;
					break;
					case 4:
						sprite_index = Splayer_push_side;
						image_xscale = -1;
					break;
				}
				
				hoots_push = true;
				
				//play sfx
				play_sfx(snd_pushing, 1, choose(1, 1.25));
				
			} else {
				if (image_index >= 2 && instance_exists(_pushblock_id))
				{
					_pushblock_id.sliding = true;
					_pushblock_id.dir = CARDINAL_DIR;
				}
				if (image_index >= image_number - 1)
				{
					image_speed = 0;
					hoots_push = false;
				}
				
			}
		}
	}
} else {
	if (ds_exists(pushblock_list, ds_type_list))
	{ 
		ds_list_clear(pushblock_list); 
		closest_block = 0;
		closest_dist = 999;
	}
}

//fall down pushblock hole
var _hole = instance_place(x, y, Opushblock_hole);
show_debug_message("close: " + string(closest_hole));
if (instance_exists(_hole))
{
	//if we're close to two holes
	if (ds_list_size(pushblock_hole_list) <= 0)
	{
		instance_place_list(x, y, Opushblock_hole, pushblock_hole_list, false);
			
		//manually order the list based on center of block rather than top corner
		closest_hole = pushblock_hole_list[| 0];
		closest_hole_dist = 999;
		for (var p = 0; p < ds_list_size(pushblock_hole_list); p++)
		{
			var _pbhole = pushblock_hole_list[| p];
			var _dist = 0;
			with (_pbhole)
			{
				_dist = point_distance(_hole.x + 8, _hole.y + 8, x, y);
			}
		    if (_dist < closest_hole_dist)
		    {
		        closest_hole_dist = _dist;
		        closest_hole = _pbhole;
		    }	
		}
	}
	
	//close to hole
	if (distance_to_point(closest_hole.x + 8, closest_hole.y + 8) < 8 && distance_to_point(closest_hole.x + 8, closest_hole.y + 8) > 1 && !closest_hole.full)
	{
		if (!instance_exists(Osweatbeads))
		{
			with (instance_create_depth(x, y - (sprite_height - 4), depth - 4, Osweatbeads))
			{
				char_track = Oplayer;
				h_mod = 4;
				player_depth = true;
			}
		}
	} else if (distance_to_point(closest_hole.x + 8, closest_hole.y + 8) != 1){
		if (instance_exists(Osweatbeads)){ instance_destroy(Osweatbeads); }	
	}
	if (place_meeting(x, y, closest_hole) && !closest_hole.full && distance_to_point(closest_hole.x + 8, closest_hole.y + 8) <= 2)
	{
		if (instance_exists(Osweatbeads)){ instance_destroy(Osweatbeads); }
		visible = false;
		sprite_index = Splayer_capidle;
		closest_hole.full = true;
		closest_hole.full_by = Oplayer;
		if (ds_exists(pushblock_hole_list, ds_type_list))
		{ 
			ds_list_clear(pushblock_hole_list); 
			closest_hole = 0;
			closest_hole_dist = 999;
		}
	}
}
if (instance_exists(_hole) && !global.cutsceneActive)
{
	if (distance_to_point(_hole.x + 8, _hole.y + 8) >= 8)
	{
		if (instance_exists(Osweatbeads)){ instance_destroy(Osweatbeads); }
		if (ds_exists(pushblock_hole_list, ds_type_list))
		{ 
			ds_list_clear(pushblock_hole_list); 
			closest_hole = 0;
			closest_hole_dist = 999;
		}
	}
}
if (!instance_exists(_hole) && instance_exists(Opushblock_hole))
{
	if (instance_exists(Osweatbeads)){ instance_destroy(Osweatbeads); }	
	if (ds_exists(pushblock_hole_list, ds_type_list))
	{ 
		ds_list_clear(pushblock_hole_list); 
		closest_hole = 0;
		closest_hole_dist = 999;
	}
}

if (global.debugActive)
{
	if (instance_exists(Odebugperst))
	{
		if (Odebugperst.fast_player)
		{
			walk_spd = 2;
		} else {
			walk_spd = 1;	
		}
	}
}

room_in = room_get_name(room);
//show_debug_message("CARDINAL DIR: " + string(CARDINAL_DIR));
//show_debug_message("STATE: " + script_get_name(state));
//show_debug_message("depth: " + string(depth));
//show_debug_message("direction: " + string(direction));
//show_debug_message("image_index: " + string(image_index));
//show_debug_message("player x: " + string(x));
//show_debug_message("player y: " + string(y));
//show_debug_message("hoots push: " + string(hoots_push));
//show_debug_message("visible: " + string(visible));
//show_debug_message("hoots walk: " + string(asset_get_index("Splayer_walk")));
//show_debug_message("hoots cap walk: " + string(asset_get_index("Splayer_capwalk")));
//show_debug_message("hoots idle: " + string(asset_get_index("Splayer_idle")));
//show_debug_message("hoots cap idle: " + string(asset_get_index("Splayer_capidle")));
//show_debug_message("playerIdle: " + string(global.playerIdle) + " playerWalk: " + string(global.playerWalk));