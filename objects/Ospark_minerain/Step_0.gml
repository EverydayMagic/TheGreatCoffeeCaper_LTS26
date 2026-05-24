switch (beat)
{
		
	//movement
	case 0:
		if (y > -10)
		{
			y -= spd;
			
			if (!babied) //tell parent to make next bomb mine
			{
				if (point_distance(x, y, parent.x, parent.y) >= 16)
				{
					parent.attack_again = true;
					parent.pt_dir = -1;
					parent.bubbled = false;
					babied = true;
				}
			}
			
		} else beat++;
	break;
	
	//choosing spot to land
	case 1:
		if (target_x = -1 && target_y = -1)
		{
				
			//choose random spot
			var _tx = irandom_range(10, (room_width - 10));
			var _ty = irandom_range(10, (room_height - 10));

			var _check = true;
			var _id = noone;
			var _x = 0;
			var _y = 0;
			//check to see if it's occupied
			with (instance_create_depth(_tx, _ty, 0, Ospark_bombrain_target))
			{
				_id = self.id;
		
				#region objects to check for
			
					var _obj = [
						Ocluebattle_obstacle, 
						Ospark_enemy, 
						Ocluebattle_decoration,
						Ospark_pathpoint,
						Ocluebattle_coolspot,
						Ocluebattle_brownbar,
						Ocluebattle_cluereward,
						Ocluebattle_healthbar,
						Ocluebattle_mglass_icon,
						Ocluebattle_sparkmeter,
						Ocluebattle_timer
					];
		
				#endregion
		
				for (var i = 0; i < array_length(_obj); i++)
				{
					if (place_meeting(x, y, _obj[i]))
					{
						//spot didn't work, try again next step
						_check = false;
						instance_destroy();
						break;
					}
				}
				_x = x;
				_y = y;
			}
	
			if (_check)
			{
				target_x = _x;
				target_y = _y;
				instance_destroy(_id);
				beat++;
			}
				
		}
	break;
	
	//change position
	case 2:
		x = target_x;
		//create shadow
		shadow = instance_create_depth(x, target_y, Omglass.depth + 1, Obombshadow);
		beat++;
	break;
	
	//fall down
	case 3:
		if (y < target_y)
		{
			if (y + spd <= target_y)
				y += spd;
			else
				y = target_y;
		} else {
			instance_destroy(shadow);
			beat++;
		}
	break;
	
	//planted
	case 4:
		if (alarm[0] = -1)
		{
			sprite_index = Ssparkbomb_planted;
			image_speed = 1;
			alarm[0] = 3 * FRAME_RATE;
		}
		depth = Omglass.depth + 1;
	break;
	
	//explode
	case 5:
		if (sprite_index != Ssparkexplosion)
		{
			sprite_index = Ssparkexplosion;
			image_index = 0;
			image_speed = 1;
		} else {
			
			//check to see if we hit mglass
			if (place_meeting(x, y, Omglass))
			{
				if (image_index < (round((image_number - 1)/2)))
				{
					if (Omglass.invincible = false)
					{
						Omglass.bullet_parent = parent;
						Omglass.damage_taken = damage;
						with (Omglass)
						{
							invincible = true;
							alarm[0] = 1; //invincible blinking
						}
					}	
				}
			}
			
			//destroy itself after animating
			if (image_index >= (image_number - 1))
			{
				image_speed = 0;
				image_index = (image_number - 1);
				instance_destroy();
			}
			
		}
		
	break;
}
	














