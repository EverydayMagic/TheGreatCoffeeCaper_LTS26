global.charlie_follow = false;
array_size = 60; //the amount of positions to record
//max party size is array_size/20
party_size = 1;

global.player_party = [];

//create arrays for data
for (var i = array_size - 1; i >= 0; i--){
	
	pos_x[i] = 0;
	pos_y[i] = 0; 
	
	toRecordSprite[i] = Splayer_idle;
	toRecordImageIndex[i] = 0;
	toRecordImageSpeed[i] = 0;
	
}

reset_points = function(){
	for (var i = array_size - 1; i >= 0; i--){
		var _player = Oplayer;
		if (!instance_exists(Oplayer))
		{
			if (instance_exists(Ohoots_cutscene))
			{
				_player = Ohoots_cutscene;	
			}
		}
		
		if (instance_exists(_player))
		{
			pos_x[i] = _player.x;
			pos_y[i] = _player.y;
		}
	}
}

