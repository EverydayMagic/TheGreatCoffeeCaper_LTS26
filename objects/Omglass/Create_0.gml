x = room_width/2;
y = room_height/2;

h_spd = 2.5;
v_spd = 2.5;

spark_wheel_shown = false;
spark_wheel_frm = 0;
mod_high = 0;

spark_hunting = -1;


if (instance_exists(Ocluehunt))
	if (Ocluehunt.trans_to_battle)
		visible = false;
		
wheelvalue_sofar = 270;

invincible = false;
iframes_run = 0;
bullet_parent = -1;
sharded = false;

damage_taken = 0;

boss_battle = false;

check_hold = true;
hold_time = 5;

depth = -80;

//create hit collision
//if (!instance_exists(Omglass_hit_col))
//	instance_create_layer(x, y, "Instances", Omglass_hit_col);
