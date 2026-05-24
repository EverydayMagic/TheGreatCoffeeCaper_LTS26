function ChangeHP(_points){
	global.hp += _points * global.damage_mod;
	if (global.hp < 0){ global.hp = 0; }
	if (global.hp > global.total_hp){ global.hp = global.total_hp; }
}