//different classes
////"yellow", "blue", "red"

class = "yellow";

min_dice_atk = 16;
attacking = false;
pt_dir = -1;
bullets_shot = 0;
bullet_max = 1;
bubbled = false;

being_attacked = false;
bouncing = false;
running_away = false;
opening = false;

old_state = -1;


//path
path = path_add();

z_path = 0;

target_x = 0;
target_y = 0;

moving = false;

stamina = 0;
stamina_recovery = 0;

runaway_attack = false;

//ATTACKING VARIABLES
bullets_shot = 0;
bullet_max = 1;
next_bullet = true;
pt_dir = -1;
bubbled = false;
atk_chosen = 0;


//hp will be the number of taps required to kill
total_hp = 1;

body = Sspark_body_normal;
face = Sspark_normalface;
face_color = c_white;
face_dir = 0;

spd = 0;

state = SparkStateOpen;

reset_stats = function(){
	switch (class)
	{
		case "yellow":
			total_hp = 12;
			body = Sspark_body_normal;
			face_color = #B65F21;
			spd = 2.5 * image_xscale;
			min_dice_atk = 15;
			max_stamina = 1;
			stamina_recovery = 2;
		break;
		case "blue":
			total_hp = 15;
			body = Sspark_body_hard;
			face_color = #465544;
			spd = 2.25 * image_xscale;
			max_stamina = 2;
			stamina_recovery = 2;
			min_dice_atk = 10;
		break;
		case "red":
			total_hp = 20;
			body = Sspark_body_realhard;
			face_color = #83391D;
			spd = 3 * image_xscale;
			max_stamina = 3;
			stamina_recovery = 0.5;
			min_dice_atk = 5;
		break;
	}

}
reset_stats();

check_if_dead = function(){
	if (cur_hp <= 0)
	{
		state = SparkStateLocked;
	
		alarm[1] = -1;
		beating = true;
		//fade away
		switch (beat)
		{
			case 0: yprev = y; beat++; break;
			case 1: 
				if (y > (yprev - 16))
				{
					y -= 0.5;
					image_alpha -= (1/16);
					image_speed = 1;
				} else {
					beat++;
					image_alpha = 0;
					image_speed = 1;
				}
			break;
			case 2:
				//remove spark from spark_ids array
				//var _removed = false;
				//for (var i = 0; i < array_length(Ocluebattle_manager.spark_ids); i++)
				//{
				//	if (Ocluebattle_manager.spark_ids[i] = self.id)
				//	{
				//		array_delete(Ocluebattle_manager.spark_ids, i, 1);
				//		_removed = true;
				//	}
				//}
				//if (_removed){ 
					visible = false; 
					Omglass.spark_hunting = -1; 
					_loop = false; //}
				instance_destroy();
				exit;
			break;
		}
	}	
}

sprite_index = body;
cur_hp = total_hp;
stamina = max_stamina;

image_speed = 0;
sweat_spd = 0;

coolspots_avaliable = [];
pathpoints_avaliable[0][0] = 0;

wait_after_attack = time_source_create(time_source_game, 2, time_source_units_seconds, function(){
	//reset variables for next attack
	bullets_shot = 0;
	bullet_max = 1;
	next_bullet = true;
	pt_dir = -1;
	bubbled = false;
	atk_chosen = 0;
});


beat = 0;
beating = false;
yprev = 0;

old_depth = depth;

alarm[4] = 1;

create_colchecks = function(){
	var _id = self.id;
	var _inst = [
		[ instance_create_layer, [x + 24, y, "Instances", Ospark_checkcol] ], //0 degree
		[ instance_create_layer, [x + 12, y - 12, "Instances", Ospark_checkcol] ], //45 degree
		[ instance_create_layer, [x, y - 24, "Instances", Ospark_checkcol] ], //90 degree
		[ instance_create_layer, [x - 12, y - 12, "Instances", Ospark_checkcol] ], //135 degree
		[ instance_create_layer, [x - 24, y, "Instances", Ospark_checkcol] ], //180 degree
		[ instance_create_layer, [x - 12, y + 12, "Instances", Ospark_checkcol] ], //225 degree
		[ instance_create_layer, [x, y + 24, "Instances", Ospark_checkcol] ], //270 degree
		[ instance_create_layer, [x + 12, y + 12, "Instances", Ospark_checkcol] ], //315 degree
	]
	
	for (var i = 0; i < array_length(_inst); i++)
	{
		var _ext = _inst[i];
		with (script_execute_ext(_ext[0], _ext[1]))
		{
			parent = _id;
			
			switch (i)
			{
				case 0:	xmod = 24; ymod = 0; break;
				case 1: xmod = 12; ymod = -12; break;
				case 2: xmod = 0; ymod = -24; break;
				case 3: xmod = -12; ymod = -12; break;
				case 4: xmod = -24; ymod = 0; break;
				case 5: xmod = -12; ymod = 12; break;
				case 6: xmod = 0; ymod = 24; break;
				case 7: xmod = 12; ymod = 12; break;
			}
			image_xscale = parent.image_xscale;
			image_yscale = parent.image_yscale;
		}
	}
	
	return true;
}

//array_push(Ocluebattle_manager.spark_ids, self.id);