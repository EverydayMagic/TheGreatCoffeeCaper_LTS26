//movement
keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keySelect = keyboard_check_pressed(ord("Z"));
//check for hold option for attack
if (global.settings.battle_control_hold)
{ 
	if (boss_battle){ hold_time = 3; }
	
	keySelect = false; 
	if (check_hold)
	{
		keySelect = keyboard_check(ord("Z"));
		check_hold = false;
	} else {
		if (alarm[1] = -1){ alarm[1] = hold_time; }	
	}
}

//show_debug_message("keySelect: " + string(keySelect));

h_spd = ((keyRight - keyLeft) * 2) * image_xscale;
v_spd = ((keyDown - keyUp) * 2) * image_yscale;

//show_debug_message("JOHN DEPTH: " + string(depth));

//collision
//for walls
mask_index = sprite_index;
if (place_meeting(x + h_spd, y, Ocol)){ h_spd = 0; }
if (place_meeting(x, y + v_spd, Ocol)){ v_spd = 0; }
//for obstacles
mask_index = Smglass_hit_col;
if (place_meeting(x + h_spd, y, Ocluebattle_obstacle)){ h_spd = 0; }
if (place_meeting(x, y + v_spd, Ocluebattle_obstacle)){ v_spd = 0; }

if (global.battle_lock)
{
	h_spd = 0;
	v_spd = 0;
	spark_wheel_shown = false;
}


x += h_spd;
y += v_spd;

var _boss = [Obigsparkboss];
for (var i = 0; i < array_length(_boss); i++)
{
	if (instance_exists(_boss[i])){ boss_battle = true; }	
}

#region regular battles
	
	if (!boss_battle)
	{
	
		//interacting with spark
		if (place_meeting(x, y, Ospark_enemy) && spark_hunting != -1)
		{
	
			if (spark_hunting.cur_hp > 0)
			{
		
				if (keySelect && !instance_exists(Otextbox))
				{
					spark_hunting.being_attacked = true;
			
					//subtracting hp
					if ((spark_hunting.state = SPARK_STATE_TIRED || spark_hunting.state = SPARK_STATE_BEINGATTACKED) && global.battleTutorial[5] = false)
					{	
						var _hpbar_mod = ((spark_hunting.total_hp - spark_hunting.cur_hp)/spark_hunting.total_hp);
				
						if (_hpbar_mod > mod_high || (_hpbar_mod = 0 && mod_high = 0)) // meter will be added to if this is true & spark will take damage
						{
							//subtract spark hp
							spark_hunting.cur_hp--;
					
							mod_high = _hpbar_mod;
							//send tiny sparks to sparkle meter
							var _sparksend = instance_create_depth(spark_hunting.x, spark_hunting.y, -bbox_bottom, Ocluebattle_sendsparkles);
					
							//var _spark_num = array_length(Ocluebattle_manager.spark_ids);
							//modify sparkle meter
							//for (var i = 0; i < _spark_num; i++)
							//{
							//	//make sure we alter the meter correctly depending on the spark and giving the data to the sparksend
							//	if (spark_hunting = Ocluebattle_manager.spark_ids[i])
							//	{
									var _given_sparkhp = spark_hunting.total_hp;
									Ocluebattle_sparkmeter.spark_hp_divider = _given_sparkhp;
									Ocluebattle_sparkmeter.collect_sparks();
									//_sparksend.brownwheel_value_togive = wheelvalue_sofar - ((145/array_length(Ocluebattle_manager.spark_ids)) * (1/_given_sparkhp));
									//wheelvalue_sofar = _sparksend.brownwheel_value_togive;
							//	}
							//}
					
							//sound effect
							play_sfx(snd_sparktakingdamage, 1, 1 + _hpbar_mod);
						}

						//modify wheel frame
						spark_wheel_shown = true;
				
						spark_wheel_frm = (_hpbar_mod + (1/(spark_hunting.total_hp))) * (sprite_get_number(Ssparkwheel) - 1);
				
						//make spark spin and spin emotion
						spark_hunting.image_speed = 1 + _hpbar_mod;
						spark_hunting.emotion = "scared";
					}
			
				} else {
			
					//wheel frame decreases
					if (spark_wheel_shown && spark_wheel_frm > 0)
					{
						spark_wheel_frm -= (1/spark_hunting.total_hp);
					} else {
						if (spark_wheel_frm <= 0)
						{
							if (spark_hunting != -1 )
							{
								spark_hunting.being_attacked = false;
								spark_hunting.image_index = 0;
							}
							spark_hunting = -1;
							spark_wheel_shown = false;
							spark_wheel_frm = 0;
							mod_high = 0;
						}
					}
			
				}
			}

		} else {
			if (spark_hunting != -1 )
			{
				spark_hunting.being_attacked = false;
				spark_hunting.image_index = 0;
			}
			spark_hunting = -1;
			spark_wheel_shown = false;
			spark_wheel_frm = 0;
			mod_high = 0;
		}
	
	}

#endregion


#region boss battles
	
	if (boss_battle)
	{
		
		//show_debug_message("spark hunting: " + string(spark_hunting));
		
		for (var b = 0; b < array_length(_boss); b++)
		{
			if (place_meeting(x, y, _boss[b]) && spark_hunting != -1)
			{
				if (spark_hunting.hp_current > 0)
				{
					if (keySelect && !instance_exists(Otextbox))
					{
						spark_hunting.being_attacked = true;
			
						//subtracting hp
						if (spark_hunting.emotion = "tired" || spark_hunting.emotion = "scared")
						{	
							var _hpbar_mod = ((spark_hunting.hp_total - spark_hunting.hp_current)/spark_hunting.hp_total);
							
							if (_hpbar_mod > mod_high || (_hpbar_mod = 0 && mod_high = 0)) // meter will be added to if this is true & spark will take damage
							{
								//subtract spark hp
								spark_hunting.hp_current--;

								mod_high = _hpbar_mod;
								//send tiny sparks to sparkle meter
								var _sparksend = instance_create_depth(spark_hunting.x, spark_hunting.y, -bbox_bottom, Ocluebattle_sendsparkles);
								var _given_sparkhp = spark_hunting.hp_total;
								_sparksend.brownwheel_value_togive = wheelvalue_sofar - (145 * (1/_given_sparkhp));
								wheelvalue_sofar = _sparksend.brownwheel_value_togive;
					
								//sound effect
								play_sfx(snd_sparktakingdamage, 1, 0.25 + _hpbar_mod);
							}

							//modify wheel frame
							spark_wheel_shown = true;
				
							spark_wheel_frm = (_hpbar_mod + (1/(spark_hunting.hp_total))) * (sprite_get_number(Ssparkwheel) - 1);
				
							//make spark spin and spin emotion
							spark_hunting.image_angle *= 1 + _hpbar_mod;
							spark_hunting.emotion = "scared";
						
						}
			
					} else {
			
						//wheel frame decreases
						if (spark_wheel_shown && spark_wheel_frm > 0)
						{
							spark_wheel_frm -= (1/spark_hunting.hp_total);
						} else {
							if (spark_wheel_frm <= 0)
							{
								if (spark_hunting != -1 )
								{
									spark_hunting.being_attacked = false;
									spark_hunting.image_index = 0;
								}
								spark_hunting = -1;
								spark_wheel_shown = false;
								spark_wheel_frm = 0;
								mod_high = 0;
							}
						}
			
					}
				}

			} else {
				if (spark_hunting != -1 && instance_exists(spark_hunting))
				{
					spark_hunting.being_attacked = false;
					spark_hunting.image_index = 0;
				}
				spark_hunting = -1;
				spark_wheel_shown = false;
				spark_wheel_frm = 0;
				mod_high = 0;
			}
		}
	
	}
	
#endregion
show_debug_message("global.hp: " + string(global.hp));

#region taking damage

var _debugnodamage = false;
if (global.debugActive)
{
	if (instance_exists(Odebugperst))
	{
		_debugnodamage = Odebugperst.no_damage;
	}
}

//taking damage aka sending out glass shards
if (invincible && !sharded && !_debugnodamage) //if we have been hit
{	
	//how many glass shards to send out
	if (damage_taken > 0)
	{
		var _damage_taken = damage_taken * global.damage_mod;
		global.hp -= _damage_taken;
		
		show_debug_message("hp: " + string(global.hp)); 
		
		
		var _gshard_count = 1;
		if (_damage_taken > 0){ _gshard_count = 1; }
		if (_damage_taken >= 5){ _gshard_count = 2; }
		if (_damage_taken >= 10){ _gshard_count = 3; }
		if (_damage_taken >= 12){ _gshard_count = 4; }
		if (_damage_taken >= 15){ _gshard_count = 5; }
		if (_damage_taken >= 17){ _gshard_count = 6; }
		if (_damage_taken >= 20){ _gshard_count = 7; }
		if (_damage_taken >= 30){ _gshard_count = 8; }
		if (_damage_taken >= 35){ _gshard_count = 9; }
		if (_damage_taken >= 40){ _gshard_count = 10; }
		if (_damage_taken >= 50){ _gshard_count = 12; }
		if (_damage_taken >= 100){ _gshard_count = 50; }
		
		show_debug_message("_gshard_count: " + string(_gshard_count));
		
		var _cur_scale_percent = Ocluebattle_healthbar.healthhearts_curscale/Ocluebattle_healthbar.healthhearts_xscale
		var _new_scale = Ocluebattle_healthbar.healthhearts_xscale * (_cur_scale_percent - (_damage_taken / global.total_hp));
		show_debug_message("_new_scale: " + string(_new_scale));
		var _hp_part = (Ocluebattle_healthbar.healthhearts_curscale - _new_scale) / _gshard_count;
		show_debug_message("_hp_part: " + string(_hp_part));
		
		for (var g = 0; g < _gshard_count; g++)
		{
			with (instance_create_depth(x, y, depth - 1, Omglass_gshard))
			{
				hp_part = _hp_part;	
			}
		}
		
		
		//for (var i = 0; i < damage_taken; i++)
		//{
		//	//var _hpparts = (damage_taken/(global.total_hp/100))/_gshard_count;
		//	//var _hpparts_percent = _hpparts/100;
		//	//show_debug_message("_hpparts_percent: " + string(string_format(_hpparts_percent,3,15)));
		//	//var _cur_xscale = Ocluebattle_healthbar.healthhearts_values[Ocluebattle_healthbar.healthhearts_index];
		//	//var _xscale_diff = Ocluebattle_healthbar.healthhearts_xscale - _cur_xscale;
			
		//	//array_push(Ocluebattle_healthbar.healthhearts_values, (Ocluebattle_healthbar.healthhearts_xscale * (1 - (_hpparts_percent * (i + 1)))) - _xscale_diff);
		//	//instance_create_depth(x, y, depth - 1, Omglass_gshard);
		//	//show_debug_message("shards: " + string(instance_number(Omglass_gshard)));
		//}
		
		sharded = true;
		if (global.battleTutorial[3] = true)
		{
			spark_wheel_shown = false; 
			global.battle_lock = true;
			create_textbox("draftedfiend_battletutorial", false);
		}
	}
}
#endregion